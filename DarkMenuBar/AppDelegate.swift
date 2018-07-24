//
//  AppDelegate.swift
//  DarkMenuBar
//
//  Created by mzp on 2018/07/23.
//  Copyright © 2018 mzp. All rights reserved.
//

import Cocoa
import ServiceManagement

fileprivate let kLaunchAtLogin = "launchAtLogin"

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet weak var menu: NSMenu!

    @objc var darkMode = (SLSGetAppearanceThemeLegacy() == 1) {
        didSet {
            SLSSetAppearanceThemeLegacy(darkMode ? 1 : 0)
        }
    }

    @objc var launchAtLogin = UserDefaults.standard.bool(forKey: kLaunchAtLogin) {
        didSet {
            let launcherAppId = "jp.mzp.DarkMenuBar.LaunchAtLoginHelperApp"
            if SMLoginItemSetEnabled(launcherAppId as CFString, launchAtLogin) {
                let userDefaults = UserDefaults.standard
                userDefaults.set(launchAtLogin, forKey: kLaunchAtLogin)
                userDefaults.synchronize()
            }
        }
    }

    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let icon = NSImage(named: "MenuIcon")
        icon?.isTemplate = true // best for dark mode
        statusItem.button?.image = icon
        statusItem.menu = menu
    }

    @IBAction func quit(_ sender: NSMenuItem) {
        NSApplication.shared.terminate(self)
    }
}
