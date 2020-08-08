//
//  String.swift
//  TinyEditor
//
//  Created by Masatsugu Karino on 2020/08/09.
//  Copyright © 2020 Masatsugu Karino. All rights reserved.
//

import Cocoa

extension String {
    
    
    static func detectCharacterEncoding(_ data: Data) -> String.Encoding? {
        let japaneseTextEncodings: [String.Encoding] = [
            String.Encoding.shiftJIS,
            String.Encoding.iso2022JP,
            String.Encoding.japaneseEUC,
            String.Encoding.utf8,
            String.Encoding.utf16,
            String.Encoding.utf32
        ]
        
        var maxCount = 0
        var maxEncoding = String.Encoding.utf8
        for encoding in japaneseTextEncodings {
            if let string = String(data: data, encoding: encoding){
                print(encoding)
                let count = string.count
                print(count)
                if maxCount < count {
                    maxCount = count
                    maxEncoding = encoding
                }
            }
        }
        if maxCount > 0 { return maxEncoding }
        
        return nil
    }
}


