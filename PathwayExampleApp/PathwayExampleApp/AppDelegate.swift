//
//  AppDelegate.swift
//  PathwayExampleApp
//
//  Created by Scott Williams on 2/23/15.
//  Copyright (c) 2015 Scott Williams. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // The stateMachine is stored on the AppDelegate here. It could be a singleton, or some other mechanism entirely.
    lazy var stateMachine: PersonStateMachine = {
        return PersonStateMachine()
    }()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let firstController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let navController = UINavigationController(rootViewController: firstController)
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
        return true
    }
}

