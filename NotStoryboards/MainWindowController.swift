//
//  MainWindowController.swift
//  NotStoryboards
//
//  Created by pandazheng on 1/30/16.
//  Copyright © 2016 pandazheng. All rights reserved.
//

import Cocoa
import ContactsUI

class MainWindowController: NSWindowController {
    
    convenience init() {
        self.init(windowNibName: "MainWindowController")
    }

    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        
        window?.titlebarAppearsTransparent = true
        window?.titleVisibility = .Hidden
        
        let splitVC = NSSplitViewController()
        let contactsListVC = ContactsListViewController()
        let contactVC = CNContactViewController()
        splitVC.addSplitViewItem(NSSplitViewItem(contentListWithViewController: contactsListVC))
        splitVC.addSplitViewItem(NSSplitViewItem(viewController: contactVC))
        
        window?.contentViewController = splitVC
    }
    
}
