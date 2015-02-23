//
//  PersonStateMachine.swift
//  PathwayExampleApp
//
//  Created by Scott Williams on 2/23/15.
//  Copyright (c) 2015 Scott Williams. All rights reserved.
//

import UIKit

class PersonStateMachine: ViewControllerStateMachine {
    var firstName: String = ""
    var lastName: String = ""

    init() {
        let del = UIApplication.sharedApplication().delegate as? AppDelegate
        let nav = del?.window?.rootViewController as UINavigationController
        let firstnameState = NavigationState(identifier: HomeViewController.self) {
            return HomeViewController(nibName: "HomeViewController", bundle: nil)
        }
        let lastnameState = NavigationState(identifier: LastNameViewController.self) {
            return LastNameViewController(nibName: "LastNameViewController", bundle: nil)
        }
        let finalState = NavigationState(identifier: EndViewController.self) {
            return EndViewController(nibName: "EndViewController", bundle: nil)
        }
        super.init(navController: nav, states: [firstnameState, lastnameState, finalState])
    }

}
