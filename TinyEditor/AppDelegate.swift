//
//  AppDelegate.swift
//  TinyEditor
//
//  Created by 狩野正嗣 on 2020/08/05.
//  Copyright © 2020 Masatsugu Karino. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {


    @IBOutlet weak var bgColorMenu: NSMenu?
    @IBOutlet weak var textColorMenu: NSMenu?
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    // file-private: このファイルの中からしかアクセスできない関数
    fileprivate func configureBGColorsMenu(){
        AppColors.bgColors.forEach { (colorData) in
            let menuItem = NSMenuItem(title: colorData.name, action: #selector(handleBGColorSelection(_:)), keyEquivalent: "")
            bgColorMenu?.addItem(menuItem)
        }
            
    }
    
    @objc fileprivate func handleBGColorSelection(_ menuItem: NSMenuItem){
        let docController = NSDocumentController()
        guard let vc = docController.currentDocument?.windowControllers.first?.contentViewController as? ViewController else { return }
        vc.setBGColor(with: menuItem.title)
    }
    
    // 色変更のメッセージをすべてAppDelegateで受けているため、メッセージを発出したドキュメントをNSDocumentControllerのインスタンスを作成してcurrentDocument->windowController->first->conentViewControllerで得てViewControllerにキャストして利用するという迂遠な設計になっている。
    
    

}

