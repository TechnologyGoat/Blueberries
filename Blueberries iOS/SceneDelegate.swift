//
//  SceneDelegate.swift
//  Blueberries iOS
//
//  Created by Christopher Benton on 5/14/23.
//

import SwiftUI

class SceneDelegate: NSObject, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        guard let windowScene = scene as? UIWindowScene else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UIHostingController(rootView: ContentView().accentColor(Color("AccentColor")).environmentObject(appDelegate).environmentObject(appDelegate.appTimer).environmentObject(appDelegate.appSettings))
        window?.makeKeyAndVisible()
    }
}
