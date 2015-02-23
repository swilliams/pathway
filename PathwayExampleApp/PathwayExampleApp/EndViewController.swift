//
//  EndViewController.swift
//  PathwayExampleApp
//
//  Created by Scott Williams on 2/23/15.
//  Copyright (c) 2015 Scott Williams. All rights reserved.
//

import UIKit

// The final View Controller in the delegate, where the information from the last two View Controllers is displayed.
class EndViewController: UIViewController {

    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let del = UIApplication.sharedApplication().delegate as? AppDelegate
        firstName.text = del?.stateMachine.firstName
        lastName.text = del?.stateMachine.lastName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
