//
//  StateMachineLogic.swift
//  PathwayExampleApp
//
//  Created by Scott Williams on 2/25/15.
//  Copyright (c) 2015 Scott Williams. All rights reserved.
//

import UIKit

protocol StateMachineLogic {
    func nextStateForController(currentController: UIViewController) -> (currentState: NavigationState?, nextState: NavigationState?)
}

