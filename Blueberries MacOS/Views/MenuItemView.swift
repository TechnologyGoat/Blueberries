//
//  MenuItemView.swift
//  Blueberries MacOS
//
//  Created by Christopher Benton on 5/14/23.
//

import SwiftUI

struct MenuItemView: View {
    @EnvironmentObject var appSettings: AppSettings
    @EnvironmentObject var appTimer: AppTimer
    
    var body: some View {
        if appSettings.showAppIn != .dock {
            HStack(spacing: 0) {
                Image(systemName: "timer")
                    .font(.title2)
                    .frame(width: 30)

                if appSettings.showTimeInMenubar && appTimer.state != .off {
                    if appTimer.isStopwatch {
                        Text(appTimer.pastTimeString)
                            .frame(width: 60)
                    } else {
                        Text(appTimer.remainingTimeString)
                            .frame(width: 60)
                    }
                }
            }
            .padding(5)
        }
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView()
            .environmentObject(AppDelegate())
            .environmentObject(AppTimer())
            .environmentObject(AppSettings())
    }
}
