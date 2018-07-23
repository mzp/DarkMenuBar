//
//  AppDelegate.swift
//  DarkMenuBar
//
//  Created by mzp on 2018/07/23.
//  Copyright © 2018 mzp. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet weak var menu: NSMenu!

    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.button?.title = "DarkMode"
        statusItem.menu = menu
    }

    @IBAction func quit(_ sender: NSMenuItem) {
        NSApplication.shared.terminate(self)
    }
}

