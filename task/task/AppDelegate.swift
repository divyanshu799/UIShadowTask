//
//  AppDelegate.swift
//  task
//
//  Created by Apple User on 01/03/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    internal func application(_ application: UIApplication, shouldSaveSecureApplicationState coder: NSCoder) -> Bool {
        //coder.encode(11.0, forKey: "MyAppVersion")
        
       return true
    }
    internal func application(_ application: UIApplication, shouldRestoreSecureApplicationState coder: NSCoder) -> Bool {
   
//        let version = coder.decodeFloat(forKey: "MyAppVersion")
//          if version == 11.0 {
//             return true
          //}
           
        
          return true
        
    }
    
    
}

