//
//  AppDelegate.swift
//  DR TV Player
//
//  Created by Simon Støvring on 27/02/2016.
//  Copyright © 2016 SimonBS. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    private var window: NSWindow?

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        window = NSWindow(contentViewController: MainViewController())
        window?.collectionBehavior = .FullScreenPrimary
        window?.makeKeyAndOrderFront(NSApp)
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool {
        return true
    }
}

