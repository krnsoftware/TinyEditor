//
//  Document.swift
//  TinyEditor
//
//  Created by 狩野正嗣 on 2020/08/05.
//  Copyright © 2020 Masatsugu Karino. All rights reserved.
//

import Cocoa

class Document: NSDocument {
    var didReadData = false
    var content = TinyNote()
    
    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }

    override class var autosavesInPlace: Bool {
        return true
    }

    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Document Window Controller")) as! NSWindowController
        self.addWindowController(windowController)
        
        windowController.contentViewController?.representedObject = content
    }

    override func data(ofType typeName: String) throws -> Data {
        // Insert code here to write your document to data of the specified type, throwing an error in case of failure.
        // Alternatively, you could remove this method and override fileWrapper(ofType:), write(to:ofType:), or write(to:ofType:for:originalContentsURL:) instead.
        if typeName == "TinyEditor Document" {
            if let noteData = content.getNoteAsJSON() {
                return noteData
            }
        } else if typeName == "Plain Text Document" {
            if let data = content.note.data(using: .utf8) {
                return data
            }
        }
        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }

    override func read(from data: Data, ofType typeName: String) throws {
        // Insert code here to read your document from the given data of the specified type, throwing an error in case of failure.
        // Alternatively, you could remove this method and override read(from:ofType:) instead.
        // If you do, you should also override isEntireFileLoaded to return false if the contents are lazily loaded.
        
        // Plain Text Document
        // Name: Plain Text Document
        // Identifier: public.plain-text
        // Mime Types: text/plain
        // 上記の状態では"public.plain-text"を返す。
        // Identifierを空白とすると、"Plain Text Document"を返す。
        // Nameを""とすると、""を返す。
        
        dump(fileType) // fileTypeはtypeNameと同じ値を返す様子。
        if content.use(data: data, ofType: typeName){
            didReadData = true
            return
        }
        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }


}

