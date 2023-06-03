//
//  StoreView.swift
//  Blueberries
//
//  Created by Christopher Benton on 5/14/23.
//

import SwiftUI

struct StoreView: View {
    @EnvironmentObject var appSettings: AppSettings
    
    let themes = [Theme.red, Theme.orange, Theme.yellow, Theme.green, Theme.blue, Theme.purple, Theme.white, Theme.black, Theme.flare, Theme.orangeJuice, Theme.sulphur, Theme.dustyGrass, Theme.blueSkies, Theme.intuitivePurple, Theme.mystic, Theme.steelGray, Theme.springWarmth, Theme.warmFlame, Theme.nightFade, Theme.cherry, Theme.loveKiss, Theme.piggyPink, Theme.mango, Theme.sunOnTheHorizon, Theme.kokoCaramel, Theme.copper, Theme.limeade, Theme.summerDog, Theme.littleLeaf, Theme.mojito, Theme.maldives, Theme.winterNeva, Theme.blueRaspberry, Theme.skyline, Theme.moonPurple, Theme.sweetDessert, Theme.anamnisar, Theme.zinc, Theme.deepSeaSpace, Theme.blueRed, Theme.relaxingRed, Theme.tranquil, Theme.cherryBlossoms, Theme.peach, Theme.chocolate, Theme.starfall, Theme.seaWeed, Theme.cinnamint, Theme.moss, Theme.flower, Theme.candy, Theme.shore, Theme.aquaMarine, Theme.frost, Theme.azurePop, Theme.electricViolet, Theme.amethyst, Theme.celestial, Theme.margo, Theme.everlastingSky, Theme.brokenHearts, Theme.jShine, Theme.megaTron, Theme.weddingDayBlues, Theme.burningSpring, Theme.gargarinView, Theme.softCherish, Theme.argon, Theme.fabledSunset, Theme.unicornRainbow, Theme.afterTheRain]
    
    var body: some View {
        VStack {
            HStack {
                HStack(spacing: 5) {
                    Image("Coin")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    Text(String(appSettings.coins))
                        .font(.title3)
                        .lineLimit(1)
                }
                
                Spacer()
                
                Text("\(appSettings.unlockedThemes.count) / \(themes.count)")
                    .font(.title3)
                
                Image(systemName: "shuffle")
                    .font(.title3)
                    .onTapGesture {
                        shuffleTheme()
                    }
            }
            
            ScrollView {
                ForEach(themes, id: \.name) { theme in
                    ThemeView(theme: theme)
                }
            }
        }
        .padding()
    }
    
    private func shuffleTheme() {
        guard let randomThemeName = appSettings.unlockedThemes.randomElement() else { return }
        guard let randomTheme = themes.first(where: { theme in theme.name == randomThemeName }) else { return }
        
        appSettings.selectedTheme = randomTheme
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
            .environmentObject(AppDelegate())
            .environmentObject(AppTimer())
            .environmentObject(AppSettings())
    }
}
