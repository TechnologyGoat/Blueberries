//
//  AppSettings.swift
//  Blueberries iOS
//
//  Created by Christopher Benton on 5/14/23.
//

import Foundation

class AppSettings: ObservableObject {
    enum Appearance: Codable {
        case system, light, dark
    }
    
    @Published var appearance = Appearance.system { didSet { save(appearance, forKey: "appearance") } }
    @Published var showMotivationalQuotes = true { didSet { save(showMotivationalQuotes, forKey: "showMotivationalQuotes") } }
    @Published var coins = 0 { didSet { save(coins, forKey: "coins") } }
    @Published var selectedTheme = Theme.blue { didSet { save(selectedTheme, forKey: "selectedTheme") } }
    @Published var unlockedThemes = Set(["blue"]) { didSet { save(unlockedThemes, forKey: "unlockedThemes") } }
    
    init() {
        if let appearance: Appearance = load(forKey: "appearance") { self.appearance = appearance }
        if let showMotivationalQuotes: Bool = load(forKey: "showMotivationalQuotes") { self.showMotivationalQuotes = showMotivationalQuotes }
        if let coins: Int = load(forKey: "coins") { self.coins = coins }
        if let selectedTheme: Theme = load(forKey: "selectedTheme") { self.selectedTheme = selectedTheme }
        if let unlockedThemes: Set<String> = load(forKey: "unlockedThemes") { self.unlockedThemes = unlockedThemes }
    }
    
    private func save(_ value: Codable, forKey key: String) {
        if let encoded = try? JSONEncoder().encode(value) {
            UserDefaults.standard.set(encoded, forKey: "AppSettings.\(key)")
        }
    }
    
    private func load<T: Codable>(forKey key: String) -> T? {
        if let data = UserDefaults.standard.object(forKey: "AppSettings.\(key)") as? Data {
            if let decoded = try? JSONDecoder().decode(T.self, from: data) {
                return decoded
            }
        }
        
        return nil
    }
    
    private func delete(forKey key: String) {
        UserDefaults.standard.removeObject(forKey: "AppSettings.\(key)")
    }
    
    func deleteData() {
        appearance = .system
        showMotivationalQuotes = true
        coins = 0
        selectedTheme = Theme.blue
        unlockedThemes = Set(["blue"])
        
        delete(forKey: "apperance")
        delete(forKey: "showMotivationalQuotes")
        delete(forKey: "coins")
        delete(forKey: "selectedTheme")
        delete(forKey: "unlockedThemes")
    }
}
