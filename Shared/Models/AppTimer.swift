//
//  AppTimer.swift
//  Blueberries
//
//  Created by Christopher Benton on 5/14/23.
//

import Foundation

class AppTimer: ObservableObject {
    enum State: Codable {
        case off, on, paused
    }

    @Published var completion = { }
    @Published var state = State.off { didSet { save(state, forKey: "state") } }
    @Published var previousDate: Date? = nil { didSet { save(previousDate, forKey: "previousDate") } }
    @Published var pastTime = 0.0 { didSet { save(pastTime, forKey: "pastTime") } }
    @Published var remainingTime = 0.0 { didSet { save(remainingTime, forKey: "remainingTime") } }
    @Published var selectedTime = 0.0 { didSet { save(selectedTime, forKey: "selectedTime") } }
    @Published var isSession = true { didSet { save(isSession, forKey: "isSession") } }
    @Published var isStopwatch = false { didSet { save(isStopwatch, forKey: "isStopwatch") } }
    
    var pastTimeString: String { localizeSeconds(Int(pastTime)) }
    var remainingTimeString: String { localizeSeconds(Int(remainingTime)) }
    var percentage: Double { isStopwatch ? 1 : pastTime / selectedTime }
    
    init() {
        if let state: State = load(forKey: "state") { self.state = state }
        if let pastTime: Double = load(forKey: "pastTime") { self.pastTime = pastTime }
        if let remainingTime: Double = load(forKey: "remainingTime") { self.remainingTime = remainingTime }
        if let selectedTime: Double = load(forKey: "selectedTime") { self.selectedTime = selectedTime }
        if let isSession: Bool = load(forKey: "isSession") { self.isSession = isSession }
        if let isStopwatch: Bool = load(forKey: "isStopwatch") { self.isStopwatch = isStopwatch }
        if let previousDate: Date? = load(forKey: "previousDate") { self.previousDate = previousDate }
        
        if state == .on {
            let currentPastTime = Date().timeIntervalSince(previousDate ?? Date())
            pastTime += currentPastTime
            remainingTime -= currentPastTime
            previousDate = Date()
        }
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in self.tick() })
    }

    private func save(_ value: Codable, forKey key: String) {
        if let encoded = try? JSONEncoder().encode(value) {
            UserDefaults.standard.set(encoded, forKey: "AppTimer.\(key)")
        }
    }

    private func load<T: Codable>(forKey key: String) -> T? {
        if let data = UserDefaults.standard.object(forKey: "AppTimer.\(key)") as? Data {
            if let decoded = try? JSONDecoder().decode(T.self, from: data) {
                return decoded
            }
        }

        return nil
    }

    private func delete(forKey key: String) {
        UserDefaults.standard.removeObject(forKey: "AppTimer.\(key)")
    }
    
    private func tick() {
        if state == .on {
            let date = Date()
            let currentPastTime = date.timeIntervalSince(previousDate ?? Date())
            pastTime += currentPastTime
            remainingTime -= currentPastTime
            previousDate = date
            
            if percentage >= 1 && !isStopwatch {
                completion()
                stop()
            }
        }
    }
    
    private func localizeSeconds(_ seconds: Int) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad

        return formatter.string(from: TimeInterval(seconds)) ?? String(seconds)
    }
    
    func start(isSession: Bool) {
        previousDate = Date()
        state = .on
        self.isSession = isSession
    }
    
    func stop() {
        previousDate = nil
        state = .off
        pastTime = 0
        remainingTime = selectedTime
    }
    
    func pause() {
        guard state == .on else { return }
        previousDate = nil
        state = .paused
    }
    
    func resume() {
        guard state == .paused else { return }
        previousDate = Date()
        state = .on
    }
}
