//
//  AppDelegate.swift
//  DataSource
//
//  Created by Bartosz Górka on 08/12/2022.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = SpotifyViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
}

