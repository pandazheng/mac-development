//
//  ViewController.swift
//  UsingStoryBoards
//
//  Created by pandazheng on 1/29/16.
//  Copyright © 2016 pandazheng. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var well : NSColorWell!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    override func prepareForSegue(segue: NSStoryboardSegue, sender: AnyObject?) {
        let second = segue.destinationController as! SecondController
        second.representedObject = well.color
    }
}

