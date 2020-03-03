//
//  AppDelegate.swift
//  MonthlyBudget
//
//  Created by Anders Strand-Holm Vinther on 14/01/2020.
//  Copyright © 2020 ashvpps. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        IQKeyboardManager.shared.enable = true
        
        return true
    }
    
}

