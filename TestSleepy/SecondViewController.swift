//
//  SecondViewController.swift
//  TestSleepy
//
//  Created by Kelly Cole on 3/24/19.
//  Copyright © 2019 Kelly Cole. All rights reserved.
//

import UIKit

var selectedTime = Date();
var isBedTime = false;
class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func indexChanged(_ sender: Any) {
        print("segmented Control changed")
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
//            textLabel.text = "First Segment Selected"
            isBedTime = false
        case 1:
//            textLabel.text = "Second Segment Selected"
            isBedTime = true
        default:
            break
        }
    }

    @IBAction func Submit(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
    
        var strDate = dateFormatter.string(from: timePicker.date)
//        textLabel.text = strDate
        selectedTime = timePicker.date
        print(isBedTime);
    }
    // if RISE TIME, then CLOCK TIME -14min -3hr*x
    // if BED TIME, then +14 min, + 3hr*x
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
