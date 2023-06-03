//
//  ContentView.swift
//  Blueberries iOS
//
//  Created by Christopher Benton on 5/14/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appSettings: AppSettings
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("home".localize(), systemImage: "house.fill") }
            
            StoreView()
                .tabItem { Label("store".localize(), systemImage: "cart.fill") }
            
            SettingsView()
                .tabItem { Label("settings".localize(), systemImage: "gearshape.fill") }
        }
        .preferredColorScheme(appSettings.appearance == .system ? .none : appSettings.appearance == .light ? .light : .dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppDelegate())
            .environmentObject(AppTimer())
            .environmentObject(AppSettings())
    }
}
