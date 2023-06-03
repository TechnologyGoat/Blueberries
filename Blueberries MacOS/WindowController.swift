//
//  WindowController.swift
//  Blueberries MacOS
//
//  Created by Christopher Benton on 5/14/23.
//

import SwiftUI

class WindowController: NSWindowController, NSWindowDelegate {
    private var positioningWindow: NSWindow?
    private var positioningWindowFrameObserver: NSKeyValueObservation?
  
    init() {
        super.init(window: NSWindow(contentRect: NSRect(x: 0, y: 0, width: 300, height: 350), styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView], backing: .buffered, defer: false))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialize(positioningWindow: NSWindow? = nil) {
        guard let appDelegate = NSApp.delegate as? AppDelegate else { return }
        
        self.positioningWindow = positioningWindow
        window?.delegate = self
        window?.contentView = NSHostingView(rootView: ContentView().background(Color("BackgroundColor")).accentColor(Color("AccentColor")).environmentObject(appDelegate).environmentObject(appDelegate.appTimer).environmentObject(appDelegate.appSettings).frame(minWidth: 300, minHeight: 350).ignoresSafeArea())
        window?.titlebarAppearsTransparent = true
        window?.isMovableByWindowBackground = true
        window?.isReleasedWhenClosed = false
        window?.center()
        showWindowIn(appDelegate.appSettings.showAppIn)
        
        if appDelegate.appSettings.showAppIn != .menubar {
            showWindow(self)
        }
        
        positioningWindowFrameObserver = positioningWindow?.observe(\.frame, changeHandler: { window, change in
            if appDelegate.appSettings.showAppIn == .menubar {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                    self.moveWindowToMenubar()
                }
            }
        })
        
        NSEvent.addGlobalMonitorForEvents(matching: .leftMouseDown) { event in
            if appDelegate.appSettings.showAppIn == .menubar {
                self.close()
            }
        }
    }
    
    func windowDidResize(_ notification: Notification) {
        guard let appDelegate = NSApp.delegate as? AppDelegate else { return }

        if appDelegate.appSettings.showAppIn == .menubar {
            moveWindowToMenubar()
        }
    }
    
    func moveWindowToMenubar() {
        guard let window = window else { return }
        guard let positioningWindow = positioningWindow else { return }
        
        window.setFrame(NSRect(x: positioningWindow.frame.midX - window.frame.width / 2, y: positioningWindow.frame.minY - window.frame.height - 10, width: window.frame.width, height: window.frame.height), display: true, animate: true)
    }
    
    func showWindowIn(_ showAppIn: AppSettings.ShowAppIn) {
        switch showAppIn {
        case .dock:
            NSApp.setActivationPolicy(.regular)
            window?.level = .normal
            window?.isMovable = true
            window?.standardWindowButton(.closeButton)?.isHidden = false
            window?.standardWindowButton(.miniaturizeButton)?.isHidden = false
            window?.standardWindowButton(.zoomButton)?.isHidden = false
        case .menubar:
            NSApp.setActivationPolicy(.accessory)
            window?.level = .popUpMenu
            window?.isMovable = false
            window?.standardWindowButton(.closeButton)?.isHidden = true
            window?.standardWindowButton(.miniaturizeButton)?.isHidden = true
            window?.standardWindowButton(.zoomButton)?.isHidden = true
            moveWindowToMenubar()
        case .dockAndMenubar:
            NSApp.setActivationPolicy(.regular)
            window?.level = .normal
            window?.isMovable = true
            window?.standardWindowButton(.closeButton)?.isHidden = false
            window?.standardWindowButton(.miniaturizeButton)?.isHidden = false
            window?.standardWindowButton(.zoomButton)?.isHidden = false
        }
    }
}
