//
//  ViewController.swift
//  SpeakDemo
//
//  Created by pandazheng on 1/29/16.
//  Copyright © 2016 pandazheng. All rights reserved.
//

import Cocoa

class ViewController: NSViewController , NSSpeechSynthesizerDelegate , NSWindowDelegate , NSTableViewDataSource , NSTableViewDelegate {
    
    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var speakButton : NSButton!
    @IBOutlet weak var stopButton : NSButton!
    @IBOutlet weak var tableView: NSTableView!
    
    let speechSynth : NSSpeechSynthesizer = NSSpeechSynthesizer()
    
    let voices = NSSpeechSynthesizer.availableVoices()
    
    var isStarted : Bool = false {
        didSet {
            updateButtons()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateButtons()
        speechSynth.delegate = self
        let defaultVoice = NSSpeechSynthesizer.defaultVoice()
        if let defaultRow = voices.indexOf(defaultVoice) {
            let indices = NSIndexSet(index: defaultRow)
            tableView.selectRowIndexes(indices, byExtendingSelection: false)
            tableView.scrollRowToVisible(defaultRow)
        }
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
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
    
    func voiceNameForIdentifier(identifier: String) -> String? {
        let attributes = NSSpeechSynthesizer.attributesForVoice(identifier)
        return attributes[NSVoiceName] as? String
    }
    
    //Mark: NSSpeechSynthesizerDelegate
    func speechSynthesizer(sender: NSSpeechSynthesizer, didFinishSpeaking finishedSpeaking: Bool) {
        isStarted = false
        print("finishedSpeaking = \(finishedSpeaking)")
    }
    
    //Mark: NSWindowDelegate
    func windowShouldClose(sender: AnyObject) -> Bool {
        return !isStarted
    }
    
    //Mark : NSTableViewDelegate
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return voices.count
    }
    
    func tableView(tableView: NSTableView, objectValueForTableColumn tableColumn: NSTableColumn?, row: Int) -> AnyObject? {
        let voice = voices[row]
        let voiceName = voiceNameForIdentifier(voice)
        return voiceName
    }
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cellView = tableView.makeViewWithIdentifier("cell", owner: self) as! NSTableCellView
        
        cellView.textField?.stringValue = self.voices[row] 
        
        return cellView
    }
    
    func tableViewSelectionDidChange(notification: NSNotification) {
        let row = tableView.selectedRow
        
        if row == -1 {
            speechSynth.setVoice(nil)
            return
        }
        
        let voice = voices[row]
        speechSynth.setVoice(voice)
    }

}

