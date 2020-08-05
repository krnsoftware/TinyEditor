//
//  ViewController.swift
//  TinyEditor
//
//  Created by 狩野正嗣 on 2020/08/05.
//  Copyright © 2020 Masatsugu Karino. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var textView: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    override func viewWillAppear() {
        super .viewWillAppear()
        
        textView.font = NSFont.systemFont(ofSize: 17.0)
        textView.delegate = self as? NSTextViewDelegate
    }

}

extension ViewController : NSTextViewDelegate {
    func textViewDidChangeSelection(_ notification: Notification) {
        
    }
}

