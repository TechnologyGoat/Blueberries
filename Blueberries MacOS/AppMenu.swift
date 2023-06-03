//
//  AppMenu.swift
//  Blueberries MacOS
//
//  Created by Christopher Benton on 5/14/23.
//

import AppKit

class AppMenu: NSMenu {
    private let aboutItem = NSMenuItem(title: "aboutBlueberries".localize(tableName: "LocalizableMacOS"), action: #selector(NSApplication.orderFrontStandardAboutPanel(_:)), keyEquivalent: "")
    private let hideFlow = NSMenuItem(title: "hideBlueberries".localize(tableName: "LocalizableMacOS"), action: #selector(NSApplication.hide(_:)), keyEquivalent: "h")
    private let hideOthers = NSMenuItem(title: "hideOthers".localize(tableName: "LocalizableMacOS"), action: #selector(NSApplication.hideOtherApplications(_:)), keyEquivalent: "h")
    private let showAll = NSMenuItem(title: "showAll".localize(tableName: "LocalizableMacOS"), action: #selector(NSApplication.unhideAllApplications(_:)), keyEquivalent: "")
    private let quit = NSMenuItem(title: "quitBlueberries".localize(tableName: "LocalizableMacOS"), action: #selector(NSApplication.shared.terminate(_:)), keyEquivalent: "q")
    private let close = NSMenuItem(title: "close".localize(tableName: "LocalizableMacOS"), action: #selector(NSWindow.performClose(_:)), keyEquivalent: "w")
    private let undo = NSMenuItem(title: "undo".localize(tableName: "LocalizableMacOS"), action: #selector(UndoManager.undo), keyEquivalent: "z")
    private let redo = NSMenuItem(title: "redo".localize(tableName: "LocalizableMacOS"), action: #selector(UndoManager.redo), keyEquivalent: "Z")
    private let cut = NSMenuItem(title: "cut".localize(tableName: "LocalizableMacOS"), action: #selector(NSText.cut(_:)), keyEquivalent: "x")
    private let copy = NSMenuItem(title: "copy".localize(tableName: "LocalizableMacOS"), action: #selector(NSText.copy(_:)), keyEquivalent: "c")
    private let paste = NSMenuItem(title: "paste".localize(tableName: "LocalizableMacOS"), action: #selector(NSText.paste(_:)), keyEquivalent: "v")
    private let delete = NSMenuItem(title: "delete".localize(tableName: "LocalizableMacOS"), action: #selector(NSText.delete(_:)), keyEquivalent: "")
    private let selectAll = NSMenuItem(title: "selectAll".localize(tableName: "LocalizableMacOS"), action: #selector(NSText.selectAll(_:)), keyEquivalent: "a")
    private let minimize = NSMenuItem(title: "minimize".localize(tableName: "LocalizableMacOS"), action: #selector(NSWindow.miniaturize(_:)), keyEquivalent: "m")
    private let website = NSMenuItem(title: "website".localize(), action: #selector(openWebsite), keyEquivalent: "")
    private let privacyAndPolicy = NSMenuItem(title: "privacyAndPolicy".localize(), action: #selector(openPrivacyAndPolicy), keyEquivalent: "")
    
    init() {
        super.init(title: "CFBundleName".localize(tableName: "InfoPlist"))
        
        hideOthers.keyEquivalentModifierMask = [.command, .option]
        
        let flowMenu = NSMenuItem()
        flowMenu.submenu = NSMenu(title: "CFBundleName".localize(tableName: "InfoPlist"))
        flowMenu.submenu?.items = [aboutItem, NSMenuItem.separator(), hideFlow, hideOthers, showAll, NSMenuItem.separator(), quit]
        addItem(flowMenu)
        
        let fileMenu = NSMenuItem()
        fileMenu.submenu = NSMenu(title: "file".localize(tableName: "LocalizableMacOS"))
        fileMenu.submenu?.items = [close]
        addItem(fileMenu)
        
        let editMenu = NSMenuItem()
        editMenu.submenu = NSMenu(title: "edit".localize(tableName: "LocalizableMacOS"))
        editMenu.submenu?.items = [undo, redo, NSMenuItem.separator(), cut, copy, paste, delete, selectAll]
        addItem(editMenu)
        
        let windowMenu = NSMenuItem()
        windowMenu.submenu = NSMenu(title: "window".localize(tableName: "LocalizableMacOS"))
        windowMenu.submenu?.items = [minimize]
        addItem(windowMenu)
        
        let helpMenu = NSMenuItem()
        helpMenu.submenu = NSMenu(title: "help".localize(tableName: "LocalizableMacOS"))
        helpMenu.submenu?.items = [website, privacyAndPolicy]
        helpMenu.submenu?.items[0].target = self
        helpMenu.submenu?.items[1].target = self
        addItem(helpMenu)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc private func openWebsite() {
        guard let url = URL(string: "https://technologygoat.netlify.app/blueberries") else { return }
        NSWorkspace.shared.open(url)
    }
    
    @objc private func openPrivacyAndPolicy() {
        guard let url = URL(string: "https://technologygoat.netlify.app/blueberries#privacyAndPolicy") else { return }
        NSWorkspace.shared.open(url)
    }
}
