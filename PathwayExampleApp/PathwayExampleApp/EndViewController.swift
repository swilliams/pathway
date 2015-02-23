//
//  EndViewController.swift
//  PathwayExampleApp
//
//  Created by Scott Williams on 2/23/15.
//  Copyright (c) 2015 Scott Williams. All rights reserved.
//

import UIKit

class EndViewController: UIViewController {

    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let del = UIApplication.sharedApplication().delegate as? AppDelegate
        firstName.text = del?.stateMachine.firstName
        lastName.text = del?.stateMachine.lastName

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
