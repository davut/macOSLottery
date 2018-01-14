//
//  ViewController.swift
//  Lottery
//
//  Created by djepbarov on 7.12.2017.
//  Copyright © 2017 djepbarov. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    var allNames = ""
    @IBOutlet var textView: NSTextView!
    @IBOutlet weak var resultLbl: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func lotteryBtnPressed(_ sender: NSButton) {
        allNames = textView.string
        var names = allNames.components(separatedBy: "\n")
        let random = Int(arc4random_uniform(UInt32(names.count)))
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
            self.resultLbl.stringValue = "3"
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.resultLbl.stringValue = "2"
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.resultLbl.stringValue = "1"
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.resultLbl.stringValue = names[random]
            names.remove(at: random)
            self.allNames = names.joined(separator: "\n")
            self.textView.string = self.allNames
        }
    }
}

