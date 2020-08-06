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
        textView.delegate = self as NSTextViewDelegate
    }
    
    func setBGColor(with name: String){
        textView.backgroundColor = AppColors.bgColors.filter { $0.name == name }.first?.color ?? NSColor.textBackgroundColor
    }
    
    func setTextColor(with name: String) {
        // Update the text color.
        textView.textColor = AppColors.textColors.filter { $0.name == name }.first?.color ?? NSColor.textColor
     
        // Update the cursor color!
        textView.insertionPointColor = textView.textColor ?? NSColor.textColor
    }
}

extension ViewController : NSTextViewDelegate {
    func textViewDidChangeSelection(_ notification: Notification) {
        (representedObject as? TinyNote)?.note = textView.string
    }
}

