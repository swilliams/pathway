//
//  HomeViewController.swift
//  PathwayExampleApp
//
//  Created by Scott Williams on 2/23/15.
//  Copyright (c) 2015 Scott Williams. All rights reserved.
//

import UIKit

// The first ViewController in the path, where you enter your First Name.
class HomeViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextTapped(sender: AnyObject) {
        let del = UIApplication.sharedApplication().delegate as? AppDelegate
        del?.stateMachine.firstName = nameField.text
        del?.stateMachine.gotoNext(fromController: self)
    }
}
