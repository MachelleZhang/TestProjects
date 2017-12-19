//
//  AppDelegate.swift
//  TransitionAnimation
//
//  Created by boco on 2017/12/14.
//  Copyright © 2017年 ZhangLe. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        let firstVC = FirstViewController()
        let navVC = UINavigationController.init(rootViewController: firstVC)
        self.window?.rootViewController = navVC
        self.window?.makeKeyAndVisible()
        return true
    }
    
}

