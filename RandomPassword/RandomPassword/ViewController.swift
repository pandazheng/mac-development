//
//  ViewController.swift
//  RandomPassword
//
//  Created by pandazheng on 1/28/16.
//  Copyright © 2016 pandazheng. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var textField: NSTextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    
    @IBAction func generatePassword(sender: AnyObject) {
        let length = 8
        let password = generateRandomString(length)
        textField.stringValue = password
    }
    
}

