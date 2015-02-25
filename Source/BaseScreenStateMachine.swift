//
//  BaseScreenStateMachine.swift
//  PathwayExampleApp
//
//  Created by Scott Williams on 2/25/15.
//  Copyright (c) 2015 Scott Williams. All rights reserved.
//

import UIKit

class BaseScreenStateMachine: ScreenStateMachine {

    func nextStateForController(currentController: UIViewController) -> (currentState: NavigationState?, nextState: NavigationState?) {
        return (currentState: nil, nextState: nil)
    }

    func navigateToNextState(nextState: NavigationState) {
        assert(false, "Not defined")
    }

    func handleStateError(currentState: State) {
        println("cannot navigate to newState")
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

}
