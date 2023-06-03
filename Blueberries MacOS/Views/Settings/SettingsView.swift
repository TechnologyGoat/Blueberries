//
//  SettingsView.swift
//  Blueberries MacOS
//
//  Created by Christopher Benton on 5/14/23.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var appDelegate: AppDelegate
    @EnvironmentObject var appSettings: AppSettings
    
    var body: some View {
        VStack {
            Spacer()

            VStack {
                HStack {
                    Text("appearance:".localize())
                    
                    Spacer()
                    
                    Picker("", selection: $appSettings.appearance) {
                        Text("system".localize()).tag(AppSettings.Appearance.system)
                        Text("light".localize()).tag(AppSettings.Appearance.light)
                        Text("dark".localize()).tag(AppSettings.Appearance.dark)
                    }
                    .frame(width: 160)
                    .onChange(of: appSettings.appearance) { _ in
                        appDelegate.changedAppearance()
                    }
                }
                
                HStack {
                    Text("showAppIn:".localize(tableName: "LocalizableMacOS"))
                    
                    Spacer()
                    
                    Picker("", selection: $appSettings.showAppIn) {
                        Text("dock".localize(tableName: "LocalizableMacOS")).tag(AppSettings.ShowAppIn.dock)
                        Text("menubar".localize(tableName: "LocalizableMacOS")).tag(AppSettings.ShowAppIn.menubar)
                        Text("dockAndMenubar".localize(tableName: "LocalizableMacOS")).tag(AppSettings.ShowAppIn.dockAndMenubar)
                    }
                    .frame(width: 160)
                    .onChange(of: appSettings.showAppIn) { _ in
                        appDelegate.changedShowAppIn()
                    }
                }
                
                HStack {
                    Text("showTimeInMenubar:".localize(tableName: "LocalizableMacOS"))
                    
                    Spacer()
                    
                    Toggle("", isOn: $appSettings.showTimeInMenubar)
                }
                
                HStack {
                    Text("showMotivationalQuotes:".localize())
                    
                    Spacer()
                    
                    Toggle("", isOn: $appSettings.showMotivationalQuotes)
                }
                
                HStack {
                    Button("deleteData".localize()) {
                        appDelegate.presentAlert(title: "deleteData".localize(), message: "areYouSureYouWantToDeleteAllOfYourData?".localize(), buttons: ["yes".localize(), "cancel".localize()], completions: [{ appSettings.deleteData() }, {}])
                    }
                    
                    Button("closeApplication".localize(tableName: "LocalizableMacOS")) {
                        NSApp.terminate(self)
                    }
                }
            }
            .frame(maxWidth: 300)

            Spacer()
            
            HStack {
                Spacer()
                
                VStack(alignment: .trailing) {
                    if let url = URL(string: "https://technologygoat.netlify.app/blueberries") {
                        Link("website".localize(), destination: url)
                    }
                    
                    if let url = URL(string: "https://technologygoat.netlify.app/blueberries#privacyAndPolicy") {
                        Link("privacyAndPolicy".localize(), destination: url)
                    }
                }
            }
        }
        .padding()
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
