//
//  ViewControllerState.swift
//
//  Created by Scott Williams on 2/22/15.
//  Copyright (c) 2015 Scott Williams. All rights reserved.
//

import UIKit

class ViewControllerStateMachine {
    let stateMachineLogic: StateMachineLogic
    private var navController: UINavigationController

    init(navController: UINavigationController, stateMachineLogic: StateMachineLogic) {
        self.navController = navController
        self.stateMachineLogic = stateMachineLogic
    }

    func gotoNext(fromController controller: UIViewController) {
        var (currentState, nextState) = stateMachineLogic.nextStateForController(controller)
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
