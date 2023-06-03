//
//  ContentView.swift
//  Blueberries MacOS
//
//  Created by Christopher Benton on 5/14/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appSettings: AppSettings
    @State private var selectedTab = "home"

    @ViewBuilder var body: some View {
        VStack(spacing: 0) {
            VStack {
                switch selectedTab {
                case "home":
                    HomeView()
                case "store":
                    StoreView()
                        .padding(.top, 5)
                case "settings":
                    SettingsView()
                default:
                    EmptyView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HStack {
                Spacer()
                
                VStack {
                    Image(systemName: "house.fill")
                        .font(.title2)
                    
                    Text("home".localize())
                        .font(.caption2)
                }
                .filled(LinearGradient(colors: selectedTab == "home" ? appSettings.selectedTheme.colors : [Color(red: 153 / 255, green: 153 / 255, blue: 153 / 255)], startPoint: .top, endPoint: .bottom))
                .frame(width: 60, height: 40)
                .onTapGesture {
                    selectedTab = "home"
                }

                Spacer()
                
                VStack {
                    Image(systemName: "cart.fill")
                        .font(.title2)
                    
                    Text("store".localize())
                        .font(.caption2)
                }
                .filled(LinearGradient(colors: selectedTab == "store" ? appSettings.selectedTheme.colors : [Color(red: 153 / 255, green: 153 / 255, blue: 153 / 255)], startPoint: .top, endPoint: .bottom))
                .frame(width: 60, height: 40)
                .onTapGesture {
                    selectedTab = "store"
                }

                Spacer()

                VStack {
                    Image(systemName: "gearshape.fill")
                        .font(.title2)
                    
                    Text("settings".localize())
                        .font(.caption2)
                }
                .filled(LinearGradient(colors: selectedTab == "settings" ? appSettings.selectedTheme.colors : [Color(red: 153 / 255, green: 153 / 255, blue: 153 / 255)], startPoint: .top, endPoint: .bottom))
                .frame(width: 60, height: 40)
                .onTapGesture {
                    selectedTab = "settings"
                }

                Spacer()
            }
            .padding(.bottom, 10)
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
