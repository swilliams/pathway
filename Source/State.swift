//
//  State.swift
//
//  Created by Scott Williams on 2/22/15.
//  Copyright (c) 2015 Scott Williams. All rights reserved.
//

import Foundation

@objc protocol State {
    var identifier: String { get }

    optional func shouldTransitionToNewState() -> Bool
    optional func willTransitionToNewState()
    optional func didTransitionToNewState()
}
