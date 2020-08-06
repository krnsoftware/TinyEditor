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
}


