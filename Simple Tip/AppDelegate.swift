//
//  AppDelegate.swift
//  Simple Tip
//
//  Created by Jeremy Evans on 11/19/15.
//  Copyright © 2015 Jeremy Evans. All rights reserved.
//

import UIKit
import Parse
import Bolts

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // Change status bar
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        // [Optional] Power your app with Local Datastore. For more info, go to
        // https://parse.com/docs/ios_guide#localdatastore/iOS
        //Parse.enableLocalDatastore()
        
        // Initialize Parse.
        Parse.setApplicationId("ktnzbiFl9rj03Ct1i1HI6G5PUSSy9vpxZMo5QHnX",
            clientKey: "kzuvPGWQTcLci42ijDpzIyw5t6419zRgclM02m8C")
        
        // [Optional] Track statistics around application opens.
        //PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
        
        
        // Use the product identifier from iTunes to register a handler.
        PFPurchase.addObserverForProduct("info.jeremyevans.Simple_Tip.remove_ads") {
            (transaction: SKPaymentTransaction?) -> Void in
            // Write business logic that should run once this product is purchased.
            //isPro = YES;
            let userDefaults = NSUserDefaults.standardUserDefaults()
            
            userDefaults.setBool(true, forKey: "proUser")
            userDefaults.synchronize()
        }
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

