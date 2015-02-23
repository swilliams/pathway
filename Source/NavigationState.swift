//
//  ViewControllerState.swift
//
//  Created by Scott Williams on 2/22/15.
//  Copyright (c) 2015 Scott Williams. All rights reserved.
//

import UIKit

typealias ViewControllerBuilder = (Void -> UIViewController)

class NavigationState : NSObject, State {
    var createViewController: ViewControllerBuilder
    var identifier: String

    init(identifier: UIViewController.Type, builder: ViewControllerBuilder) {
        self.createViewController = builder
        self.identifier = identifier.description()
    }
}