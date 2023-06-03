//
//  CircleProgressView.swift
//  Blueberries
//
//  Created by Christopher Benton on 5/14/23.
//

import SwiftUI

struct CircleProgressView: View {
    let theme: Theme
    let percentage: Double
    let title: String
    let subtitle: String
    let fontSize: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 25)
                .opacity(0.4)
                .padding()
            
            Circle()
                .trim(from: 0, to: min(percentage, 1))
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .rotation(.degrees(270))
                .padding()
            
            Text(title)
                .font(.system(size: fontSize))
                .fontWeight(.bold)
            
            Text(subtitle)
                .font(.system(size: fontSize / 2))
                .fontWeight(.semibold)
                .padding(.top, fontSize * 1.5)
        }
        .filled(LinearGradient(colors: theme.colors, startPoint: .top, endPoint: .bottom))
    }
}

struct CircleProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressView(theme: Theme.blue, percentage: 1, title: "00:00:00", subtitle: "", fontSize: 50)
            .environmentObject(AppDelegate())
            .environmentObject(AppTimer())
            .environmentObject(AppSettings())
    }
}
