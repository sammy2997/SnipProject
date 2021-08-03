//
//  AppDelegate.swift
//  SnipProject
//
//  Created by King on 26/07/2021.
//

import UIKit

/// STEP 4 - import notifications to both app Delegate and main view Controller
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        /// PUSH NOTIFICATIONS - Step 1
        ///1.  pop a dialog box to ask user for permission.
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
        (granted, error) in
        guard granted else { return }
        DispatchQueue.main.async {
        UIApplication.shared.registerForRemoteNotifications()
        }
        }
        
        return true
    }
    
    
    
    // new added
    
    let notificationDelegate = SampleNotificationDelegate()
    func configureNotification() {
        if #available(iOS 10.0, *) {
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options:[.badge, .alert, .sound]){ (granted, error) in }
            center.delegate = notificationDelegate
            let openAction = UNNotificationAction(identifier: "OpenNotification", title: NSLocalizedString("Abrir", comment: ""), options: UNNotificationActionOptions.foreground)
            let deafultCategory = UNNotificationCategory(identifier: "CustomSamplePush", actions: [openAction], intentIdentifiers: [], options: [])
            center.setNotificationCategories(Set([deafultCategory]))
        } else {
            UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil))
        }
        UIApplication.shared.registerForRemoteNotifications()
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

    /// PUSH NOTIFICATIONS step 2
    /// 2. Add these 3 functions to register app with APN
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    // 1. Convert device token to string
        let tokenParts = deviceToken.map { data -> String in
        return String(format: "%02.2hhx", data)
    }
        let token = tokenParts.joined()
    // 2. Print device token to use for PNs payloads
        print("Device Token: \(token)")
        let bundleID = Bundle.main.bundleIdentifier;
        print("Bundle ID: \(token) \(bundleID)");
    // 3. Save the token to local storeage and post to app server to generate Push Notification. ...
    }
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("failed to register for remote notifications: \(error.localizedDescription)")
    }
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        print("Received push notification: \(userInfo)")
        let aps = userInfo["aps"] as! [String: Any]
        print("\(aps)")
    }
    
    /// STEP 3 - enable background task with remote push & push service
    /// Remote notifications in Background modes in Signing & capabilities (add capability) of project.
    /// also add push notifications for push service
}

