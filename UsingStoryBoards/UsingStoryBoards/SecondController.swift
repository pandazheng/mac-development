//
//  SecondController.swift
//  UsingStoryBoards
//
//  Created by pandazheng on 1/30/16.
//  Copyright © 2016 pandazheng. All rights reserved.
//

import Cocoa

class SecondController: NSViewController {
    
    @IBOutlet weak var box : NSBox!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBAction func dismiss(sender : AnyObject) {
        self.dismissController(self)
    }
    
    override func viewWillAppear() {
        box.fillColor = self.representedObject as! NSColor
    }
    
}
