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
    
//    @IBAction func GoingNowClick(_ sender: Any) {

//    }
    
    @IBAction func GoingNowClicked(_ sender: Any) {
        print("TestSegue")
        performSegue(withIdentifier: "TestSegue", sender: sender);
    }
    
    @IBAction func PickATimeClicked(_ sender: Any) {
        print("PickTimeClick")
        performSegue(withIdentifier: "PickTimeClick", sender: sender);
    }
    

    //    @IBAction func GoingNow(_ sender: Any) {
//        println("Pan segue from mainVC to Life Lists did run")
//
//    }
    
//    override func performSegue(withIdentifier identifier: String, sender: Any?) {
//        print("segue - \GoingNowClick")
//
//        if let destinationViewController = segue.destination as? GoingNowClick {
//            if let button = sender as? UIButton {
//                secondViewController.<buttonIndex> = button.tag
//                // Note: add/define var buttonIndex: Int = 0 in <YourDestinationViewController> and print there in viewDidLoad.
//            }
//            
//        }
//    }


}

