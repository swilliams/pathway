//
//  ViewControllerState.swift
//
//  Created by Scott Williams on 2/22/15.
//  Copyright (c) 2015 Scott Williams. All rights reserved.
//

import UIKit

class ViewControllerStateMachine {
    let states: [NavigationState]
    private var navController: UINavigationController

    init(navController: UINavigationController, states: [NavigationState]) {
        self.navController = navController
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

    func gotoNext(fromController controller: UIViewController) {
        var (currentState, nextState) = nextStateForController(controller)
        if let currentState = currentState {
            if currentState.respondsToSelector(Selector("shouldTransitionToNewState")) {
                let canTransition = (currentState as State).shouldTransitionToNewState!()
                if !canTransition {
                    handleStateError(currentState)
                    return
                }
            }
            if let nextState = nextState {
                (nextState as State).willTransitionToNewState?()
                navigateToNextState(nextState)
                (nextState as State).didTransitionToNewState?()
            }
        } else {
            assert(currentState != nil, "Could not load a current State for this controller")
        }
    }

    func navigateToNextState(nextState: NavigationState) {
        let nextController = nextState.createViewController()
        navController.pushViewController(nextController, animated: true)
    }

    func handleStateError(currentState: State) {
        println("cannot navigate to newState")
    }
}
