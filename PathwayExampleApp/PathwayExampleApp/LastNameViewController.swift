//
//  LastNameViewController.swift
//  PathwayExampleApp
//
//  Created by Scott Williams on 2/23/15.
//  Copyright (c) 2015 Scott Williams. All rights reserved.
//

import UIKit

// The second View Controller in the path.
class LastNameViewController: UIViewController {

    @IBOutlet weak var lastnameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextTapped(sender: AnyObject) {
        let del = UIApplication.sharedApplication().delegate as? AppDelegate
        del?.stateMachine.lastName = lastnameField.text
        del?.stateMachine.gotoNext(fromController: self)
    }
}
