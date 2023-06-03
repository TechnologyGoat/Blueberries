//
//  SettingsView.swift
//  Blueberries iOS
//
//  Created by Christopher Benton on 5/14/23.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var appDelegate: AppDelegate
    @EnvironmentObject var appSettings: AppSettings
    
    var body: some View {
        List {
            Section {
                HStack {
                    Text("appearance:".localize())
                    
                    Spacer()
                    
                    Picker("", selection: $appSettings.appearance) {
                        Text("system".localize()).tag(AppSettings.Appearance.system)
                        Text("light".localize()).tag(AppSettings.Appearance.light)
                        Text("dark".localize()).tag(AppSettings.Appearance.dark)
                    }
                }
                
                HStack {
                    Text("showMotivationalQuotes:".localize())
                    
                    Spacer()
                    
                    Toggle("", isOn: $appSettings.showMotivationalQuotes)
                        .frame(width: 60)
                }
            }
            
            Section {
                if let url = URL(string: "https://technologygoat.netlify.app/blueberries") {
                    Link("website".localize(), destination: url)
                }
                
                if let url = URL(string: "https://technologygoat.netlify.app/blueberries#privacyAndPolicy") {
                    Link("privacyAndPolicy".localize(), destination: url)
                }
                
                Button("deleteData".localize()) {
                    appDelegate.presentAlert(title: "deleteData".localize(), message: "areYouSureYouWantToDeleteAllOfYourData?".localize(), buttons: ["yes".localize(), "cancel".localize()], completions: [{ appSettings.deleteData() }, {}])
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(AppDelegate())
            .environmentObject(AppTimer())
            .environmentObject(AppSettings())
    }
}
