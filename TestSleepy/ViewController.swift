//
//  ViewController.swift
//  TestSleepy
//
//  Created by Kelly Cole on 3/24/19.
//  Copyright © 2019 Kelly Cole. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func GoingNowClicked(_ sender: Any) {
        print("TestSegue")
        performSegue(withIdentifier: "TestSegue", sender: sender);
    }
    
    @IBAction func PickATimeClicked(_ sender: Any) {
        print("PickTimeClick")
        performSegue(withIdentifier: "PickTimeClick", sender: sender);
    }
}

