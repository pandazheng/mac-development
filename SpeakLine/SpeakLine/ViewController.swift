//
//  ViewController.swift
//  SpeakLine
//
//  Created by pandazheng on 1/29/16.
//  Copyright © 2016 pandazheng. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSWindowDelegate , NSSpeechSynthesizerDelegate{
    
    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var speakButton: NSButton!
    @IBOutlet weak var stopButton: NSButton!
    
    let speechSynth : NSSpeechSynthesizer = NSSpeechSynthesizer()
    
    var isStarted : Bool = false {
        didSet {
            updateButtons()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func speakIt(sender: NSButton) {
        let string = textField.stringValue
        if string.isEmpty {
            print("string from \(textField) is empty")
        } else {
            speechSynth.startSpeakingString(string)
            isStarted = true
        }
    }
    
    @IBAction func stopIt(sender: NSButton) {
        speechSynth.stopSpeaking()
        isStarted = false
    }
    
    func updateButtons() {
        if isStarted {
            speakButton.enabled = false
            stopButton.enabled = true
        } else {
            speakButton.enabled = true
            stopButton.enabled = false
        }
    }
    
    //Mark NSSpeechSynthesizerDelegate
    func speechSynthesizer(sender: NSSpeechSynthesizer, didFinishSpeaking finishedSpeaking: Bool) {
        isStarted = false
        print("finishedSpeaking=\(finishedSpeaking)")
    }
    
    
    //Mark NSWindowDelegate
    func windowShouldClose(sender: AnyObject) -> Bool {
        if isStarted {
            return !isStarted
        } else {
            return isStarted
        }
    }


}

