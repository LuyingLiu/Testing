//
//  AppDelegate.swift
//  L3
//
//  Created by Yana Sang on 10/7/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)

        // Change the window's root view controller to be a UINavigationController.
        // This way, we can push new view controllers onto our navigation stack
        // and use multiple ViewControllers across our app.
        // The navigation controller must start off with a beginning view controller, or the root.
        // We want the root view controller to display our ViewController.
        window?.rootViewController = UINavigationController(rootViewController: ViewController())

        window?.makeKeyAndVisible()
        
        return true
    }

}

