//
//  ThemeView.swift
//  Blueberries
//
//  Created by Christopher Benton on 5/14/23.
//

import SwiftUI

struct ThemeView: View {
    @EnvironmentObject var appDelegate: AppDelegate
    @EnvironmentObject var appSettings: AppSettings
    let theme: Theme
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(LinearGradient(colors: appSettings.unlockedThemes.contains(theme.name) ? theme.colors : [.black], startPoint: .top, endPoint: .bottom))
                .brightness(appSettings.unlockedThemes.contains(theme.name) ? 0 : 0.1)
                .frame(height: 50)
                .cornerRadius(5)
            
            if appSettings.unlockedThemes.contains(theme.name) {
                Text(theme.name.localize())
                    .font(.title3)
                    .fontWeight(appSettings.selectedTheme.name == theme.name ? .semibold : .regular)
            } else {
                HStack(spacing: 5) {
                    Image("Coin")
                        .resizable()
                        .frame(width: 15, height: 15)
                    
                    Text(String(theme.price))
                        .font(.title3)
                        .fontWeight(appSettings.selectedTheme.name == theme.name ? .semibold : .regular)
                }
            }
        }
        .padding([.horizontal])
        .onTapGesture {
            if appSettings.unlockedThemes.contains(theme.name) {
                appSettings.selectedTheme = theme
            } else {
                appDelegate.presentAlert(title: "confirmPurchase".localize(), message: "areYouSureYouWantToPurchaseThisThemeForCoins?".localize(args: [theme.price]), buttons: ["yes".localize(), "no".localize()], completions: [{
                    if appSettings.coins >= theme.price {
                        appSettings.coins -= theme.price
                        appSettings.unlockedThemes.insert(theme.name)
                    } else {
                        appDelegate.presentAlert(title: "notSoFast!".localize(), message: "youDon’tHaveEnoughCoins.".localize(), buttons: ["ok".localize()], completions: [{ }])
                    }
                }, { }])
            }
        }
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView(theme: Theme.blue)
            .environmentObject(AppDelegate())
            .environmentObject(AppTimer())
            .environmentObject(AppSettings())
    }
}
