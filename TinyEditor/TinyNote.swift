//
//  TinyNote.swift
//  TinyEditor
//
//  Created by 狩野正嗣 on 2020/08/06.
//  Copyright © 2020 Masatsugu Karino. All rights reserved.
//

import Cocoa

class TinyNote: Codable {
    var note = ""
    var bgColorIndex: Int = 0
    var textColorIndex: Int = 1
    
    enum DocumentType: String, CaseIterable {
        case plainTextDocument = "Plain Text Document"
        case tinyEditorDocument = "TinyEditor Document"
        
        static func rawValueToCase(_ rawValue: String) -> DocumentType?  {
            for type in DocumentType.allCases {
                if type.rawValue == rawValue { return type }
            }
            return nil
        }
    }
    
    init() {
        
    }
    
    func getNoteAsJSON() -> Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(self)
    }
    
    func use(data: Data) -> Bool {
        let decoder = JSONDecoder()
        guard let decoded = try? decoder.decode(TinyNote.self, from: data) else { return false }
        note = decoded.note
        bgColorIndex = decoded.bgColorIndex
        textColorIndex = decoded.textColorIndex
        return true
    }
    
    func use(data: Data, ofType typeName: String) -> Bool {
        // rawValueToCaseがエラーをthrowしない関数のためguardには意味がない。
        guard let type = try? DocumentType.rawValueToCase(typeName)  else { return false }
        switch type {
        case DocumentType.plainTextDocument:
            if let text = String(data: data, encoding: .utf8){
                dump(text)
                note = text
                bgColorIndex = 0
                textColorIndex = 0
                return true
            }
        case DocumentType.tinyEditorDocument:
            return self.use(data: data)
        }
        return false
    }
}


