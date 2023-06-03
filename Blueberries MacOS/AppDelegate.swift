//
//  AppDelegate.swift
//  Blueberries MacOS
//
//  Created by Christopher Benton on 5/14/23.
//

import SwiftUI
import UserNotifications

@main
class AppDelegate: NSObject, NSApplicationDelegate, UNUserNotificationCenterDelegate, ObservableObject {
    private let windowController = WindowController()
    private let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let appTimer = AppTimer()
    let appSettings = AppSettings()
    
    static func main() {
        let delegate = AppDelegate()
        NSApp.delegate = delegate
        _ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)
    }
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in }
        
        NSApp.mainMenu = AppMenu()
        windowController.initialize(positioningWindow: statusItem.button?.window)
        setupStatusItem()
        
        appTimer.completion = {
            if self.appTimer.isSession {
                self.appSettings.coins += Int(self.appTimer.selectedTime / 60)
            }
        }
    }
    
    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        if appSettings.showAppIn != .menubar {
            windowController.showWindow(self)
            return true
        } else {
            return false
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .list, .sound])
    }
    
    private func setupStatusItem() {
        guard let statusButton = statusItem.button else { return }
        guard let statusWindow = statusButton.window else { return }
        guard let contentView = statusWindow.contentView else { return }
        
        let hostingView = NSHostingView(rootView: MenuItemView().accentColor(Color("AccentColor")).environmentObject(self).environmentObject(appTimer).environmentObject(appSettings))
        hostingView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(hostingView)

        NSLayoutConstraint.activate([
            hostingView.topAnchor.constraint(equalTo: contentView.topAnchor),
            hostingView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            hostingView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            hostingView.leftAnchor.constraint(equalTo: contentView.leftAnchor)
        ])
        
        statusButton.action = #selector(statusButtonClicked)
    }
  
    @objc private func statusButtonClicked() {
        if appSettings.showAppIn == .menubar {
            if windowController.window?.isVisible ?? false {
                windowController.close()
            } else {
                windowController.moveWindowToMenubar()
                windowController.showWindow(self)
            }
        } else {
            windowController.showWindow(self)
            windowController.window?.orderFrontRegardless()
        }
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
        guard let window = windowController.window else { return }
        
        let alert = NSAlert()
        alert.messageText = title
        alert.informativeText = message
        alert.alertStyle = .warning

        for button in buttons {
            alert.addButton(withTitle: button)
        }
        
        alert.beginSheetModal(for: window, completionHandler: { modalResponse in
            if modalResponse == .alertFirstButtonReturn {
                completions[0]()
            } else if modalResponse == .alertSecondButtonReturn {
                completions[1]()
            } else {
                completions[2]()
            }
        })
    }
    
    func changedAppearance() {
        windowController.close()
        windowController.window?.orderFrontRegardless()
    }
    
    func changedShowAppIn() {
        windowController.showWindowIn(appSettings.showAppIn)
    }
}
