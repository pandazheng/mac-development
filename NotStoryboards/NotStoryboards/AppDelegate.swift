//
//  AppDelegate.swift
//  NotStoryboards
//
//  Created by pandazheng on 1/30/16.
//  Copyright © 2016 pandazheng. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let mainWindowController = MainWindowController()


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        mainWindowController.showWindow(nil)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

