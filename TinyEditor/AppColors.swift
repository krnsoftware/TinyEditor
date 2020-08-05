//
//  AppColors.swift
//  TinyEditor
//
//  Created by 狩野正嗣 on 2020/08/05.
//  Copyright © 2020 Masatsugu Karino. All rights reserved.
//

import Cocoa

struct AppColors {
    static let bgColors: [(name: String, color: NSColor)] = [
        ("Default", NSColor.textBackgroundColor),
        ("Blue", NSColor(named: "blue") ?? NSColor.black),
        ("Yellow", NSColor(named: "yellow") ?? NSColor.black),
        ("Pink", NSColor(named: "pink") ?? NSColor.black),
        ("Teal", NSColor(named: "teal") ?? NSColor.black)]
        // NSColor(named:)はnilを返すことがあるため、??で代わりにNSColor.blackを代入。
    static let textColors: [(name: String, color: NSColor)] = [
        ("Dark", NSColor.black),
        ("Light", NSColor.white)]
}
