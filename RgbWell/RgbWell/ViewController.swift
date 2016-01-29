//
//  ViewController.swift
//  RgbWell
//
//  Created by pandazheng on 1/29/16.
//  Copyright © 2016 pandazheng. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var rSlider : NSSlider!
    @IBOutlet weak var gSlider : NSSlider!
    @IBOutlet weak var bSlider : NSSlider!
    @IBOutlet weak var colorWell : NSColorWell!
    
    var r : Float = 0.5
    var g : Float = 0.5
    var b : Float = 0.5
    
    let a = 1.0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        rSlider.floatValue = r
        gSlider.floatValue = g
        bSlider.floatValue = b
        adjustColor()
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func adjustRed(sender: NSSlider) {
        r = sender.floatValue
        adjustColor()
    }
    
    @IBAction func adjustGreen(sender: NSSlider) {
        g = sender.floatValue
        adjustColor()
    }
    
    @IBAction func adjustBlue(sender: NSSlider) {
        b = sender.floatValue
        adjustColor()
    }

    
    func adjustColor() {
        let newColor = NSColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: CGFloat(a))
        
        colorWell.color = newColor
    }
}

