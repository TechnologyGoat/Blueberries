//
//  HomeView.swift
//  Blueberries MacOS
//
//  Created by Christopher Benton on 5/14/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appDelegate: AppDelegate
    @EnvironmentObject var appTimer: AppTimer
    @EnvironmentObject var appSettings: AppSettings
    @State private var hours = 0
    @State private var minutes = 0
    @State private var seconds = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            ZStack {
                CircleProgressView(theme: appSettings.selectedTheme, percentage: appTimer.percentage, title: appTimer.isStopwatch ? appTimer.pastTimeString : appTimer.remainingTimeString, subtitle: appTimer.state == .off ? "" : appTimer.isSession ? "session".localize() : "break".localize(), fontSize: 35)
                    .frame(maxWidth: 400, maxHeight: 400)
                
                if appTimer.state == .off {
                    Image(systemName: appTimer.isStopwatch ? "stopwatch.fill" : "stopwatch")
                        .filled(LinearGradient(colors: appSettings.selectedTheme.colors, startPoint: .top, endPoint: .bottom))
                        .font(.system(size: 35 / 2))
                        .frame(width: 30, height: 30)
                        .padding(.top, 35 * 1.5)
                        .onTapGesture {
                            appTimer.isStopwatch.toggle()
                        }
                }
            }

            Spacer()
            
            VStack {
                if appTimer.state == .off {
                    HStack {
                        Picker("", selection: $hours) {
                            ForEach(0..<24) { option in
                                Text(String(option)).tag(option)
                            }
                        }
                        .frame(width: 60)
                        .onChange(of: hours, perform: { _ in setAppTimerSelectedTime() })
                        
                        Picker("", selection: $minutes) {
                            ForEach(0..<60) { option in
                                Text(String(option)).tag(option)
                            }
                        }
                        .frame(width: 60)
                        .onChange(of: minutes, perform: { _ in setAppTimerSelectedTime() })
                        
                        Picker("", selection: $seconds) {
                            ForEach(0..<60) { option in
                                Text(String(option)).tag(option)
                            }
                        }
                        .frame(width: 60)
                        .onChange(of: seconds, perform: { _ in setAppTimerSelectedTime() })
                    }
                    .onAppear {
                        hours = Int(appTimer.selectedTime) / 3600
                        minutes = Int(appTimer.selectedTime) % 3600 / 60
                        seconds = Int(appTimer.selectedTime) % 3600 % 60
                    }
                    
                    HStack {
                        Button("startSession".localize()) {
                            appTimer.start(isSession: true)
                            appDelegate.removePendingTimerCompletionNotifications()
                            
                            if !appTimer.isStopwatch {
                                appDelegate.sendTimerCompletionNotification(timeInterval: appTimer.selectedTime)
                            }
                        }
                        .disabled(appTimer.isStopwatch ? false : appTimer.selectedTime == 0)
                        
                        Button("startBreak".localize()) {
                            appTimer.start(isSession: false)
                            appDelegate.removePendingTimerCompletionNotifications()

                            if !appTimer.isStopwatch {
                                appDelegate.sendTimerCompletionNotification(timeInterval: appTimer.selectedTime)
                            }
                        }
                        .disabled(appTimer.isStopwatch ? false : appTimer.selectedTime == 0)
                    }
                } else {
                    HStack {
                        Button("cancel".localize()) {
                            appTimer.stop()
                            appDelegate.removePendingTimerCompletionNotifications()
                        }
                        
                        Button(appTimer.state == .paused ? "resume".localize() : "pause".localize()) {
                            if appTimer.state == .paused {
                                appTimer.resume()
                                appDelegate.removePendingTimerCompletionNotifications()

                                if !appTimer.isStopwatch {
                                    appDelegate.sendTimerCompletionNotification(timeInterval: appTimer.remainingTime)
                                }
                            } else {
                                appTimer.pause()
                                appDelegate.removePendingTimerCompletionNotifications()
                            }
                        }
                        
                        Button(appTimer.isStopwatch ? "stop".localize() : "skip".localize()) {
                            if appTimer.isSession {
                                appSettings.coins += Int(appTimer.pastTime / 60)
                            }
                            
                            appTimer.stop()
                            appDelegate.removePendingTimerCompletionNotifications()
                        }
                    }
                }
            }
            .frame(height: 44)
            
            Spacer()
        }
        .padding([.leading, .trailing, .bottom])
    }
    
    private func setAppTimerSelectedTime() {
        appTimer.selectedTime = Double(hours * 3600 + minutes * 60 + seconds)
        appTimer.remainingTime = appTimer.selectedTime
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(AppDelegate())
            .environmentObject(AppTimer())
            .environmentObject(AppSettings())
    }
}
