//
//  LinearStateMachineLogic.swift
//  PathwayExampleApp
//
//  Created by Scott Williams on 2/25/15.
//  Copyright (c) 2015 Scott Williams. All rights reserved.
//

import UIKit

class LinearStateMachineLogic : StateMachineLogic {
    let states: [NavigationState]

    init(states: [NavigationState]) {
        self.states = states
    }

    // Finds the next State in line to be displayed. Loops through the `states` array for the currentState, then prepares the next one for launch.
    // This is not private, so it can be overriden to use different logic to determine what state should be next.
    func nextStateForController(currentController: UIViewController) -> (currentState: NavigationState?, nextState: NavigationState?) {
        var currentControllerIdentifier = currentController.dynamicType.description()
        var currentState: NavigationState?
        var nextState: NavigationState?
        var nextIndex: Int?

        for idx: Int in 0...states.count {
            let state = states[idx]
            if state.identifier == currentControllerIdentifier {
                currentState = state
                nextIndex = idx + 1
                break
            }
        }
        if nextIndex == nil { // currentState was not found
            return (nil, nil)
        }
        if nextIndex >= states.count { // currentState is at the end of the line
            return (currentState, nil)
        }
        nextState = states[nextIndex!]
        return (currentState, nextState)
    }
}