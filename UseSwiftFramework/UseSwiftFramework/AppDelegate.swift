//
//  AppDelegate.swift
//  UseSwiftFramework
//
//  Created by pandazheng on 1/30/16.
//  Copyright © 2016 pandazheng. All rights reserved.
//

import Cocoa
import LoggingFramework

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        NSLog("This is our NSLog")
        Logging.testClassMethod()
        let log = Logging()
        log.testMethod()
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

