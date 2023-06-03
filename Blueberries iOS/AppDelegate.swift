//
//  AppDelegate.swift
//  Blueberries iOS
//
//  Created by Christopher Benton on 5/14/23.
//

import SwiftUI

@main
class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate, ObservableObject {
    let appTimer = AppTimer()
    let appSettings = AppSettings()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in }
        
        appTimer.completion = {
            if self.appTimer.isSession {
                self.appSettings.coins += Int(self.appTimer.selectedTime / 60)
            }
        }
        
        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let config = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        config.delegateClass = SceneDelegate.self
        
        return config
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .list, .sound])
    }
    
    func sendTimerCompletionNotification(timeInterval: TimeInterval? = nil) {
        let content = UNMutableNotificationContent()
        let trigger = timeInterval == nil ? nil : UNTimeIntervalNotificationTrigger(timeInterval: timeInterval!, repeats: false)
        
        if appTimer.isSession {
            content.title = "sessionCompleted".localize()
            content.body = Int(appTimer.selectedTime / 60) == 1 ? "youGainedCoin.".localize(args: [Int(appTimer.selectedTime / 60)]) : "youGainedCoins.".localize(args: [Int(appTimer.selectedTime / 60)])
        } else {
            content.title = "breakCompleted".localize()
            
            if appSettings.showMotivationalQuotes {
                content.body = "motivationalQuote\(Int.random(in: 1...250))".localize()
            } else {
                content.body = "areYouReadyForYourNextSession?".localize()
            }
        }
        
        content.sound = .default
        
        UNUserNotificationCenter.current().add(UNNotificationRequest(identifier: "AppTimerCompletion-\(UUID().uuidString)", content: content, trigger: trigger))
    }
    
    func removePendingTimerCompletionNotifications() {
        UNUserNotificationCenter.current().getPendingNotificationRequests { requests in
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: requests.compactMap { $0.identifier.hasPrefix("AppTimerCompletion") ? $0.identifier : nil })
        }
    }
    
    func presentAlert(title: String, message: String, buttons: [String], completions: [() -> Void]) {
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        for index in 0..<buttons.count {
            alert.addAction(UIAlertAction(title: buttons[index], style: .default, handler: { _ in completions[index]() }))
        }
        
        sceneDelegate.window?.rootViewController?.present(alert, animated: true)
    }
}
