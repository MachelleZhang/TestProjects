//
//  AppDelegate.swift
//  CoreAnimation
//
//  Created by boco on 2018/6/25.
//  Copyright © 2018年 zhangle. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = .white
        self.window?.rootViewController = UINavigationController.init(rootViewController: TypeList())
        self.window?.makeKeyAndVisible()
        
        return true
    }

}

