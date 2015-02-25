//
//  ScreenStateMachine.swift
//  PathwayExampleApp
//
//  Created by Scott Williams on 2/25/15.
//  Copyright (c) 2015 Scott Williams. All rights reserved.
//

import UIKit

protocol ScreenStateMachine {
    func nextStateForController(currentController: UIViewController) -> (currentState: NavigationState?, nextState: NavigationState?)
    func gotoNext(fromController controller: UIViewController)
    func navigateToNextState(nextState: NavigationState)
    func handleStateError(currentState: State)
}