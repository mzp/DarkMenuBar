//
//  AppDelegate.swift
//  DarkMenuBarLauncher
//
//  Created by mzp on 2018/07/23.
//  Copyright © 2018 mzp. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        defer { NSApp.terminate(nil) }
        guard let url = URL(string: "darkModeMenu://") else { return }
        NSWorkspace.shared.open(url)
    }
}

