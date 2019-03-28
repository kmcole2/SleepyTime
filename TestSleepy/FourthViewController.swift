//
//  FourthViewController.swift
//  TestSleepy
//
//  Created by Kelly Cole on 3/25/19.
//  Copyright © 2019 Kelly Cole. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    func calculateOverflow1(minute: Int) ->Int {
        if ((minute + 30) > 60){
            return 1;
        } else {
            return 0;
        }
    }
    
    func calculateMinute(minute: Int) ->Int {
        if ((minute - 14) < 0){
            return -1;
        }
        return 0;
    }
//        if ((minute - 14 + 30) > 60){
//            return 1
//        } else {
//            return 0;
//        }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calendar = Calendar.current
        var hour = calendar.component(.hour, from: selectedTime)
        var minutes = calendar.component(.minute, from: selectedTime)
        let seconds = calendar.component(.second, from: selectedTime)
        print("hours = \(hour):\(minutes):\(seconds)")

        if(isBedTime){
            InfoText.text = "BEDTIME, It takes the average person 14 minutes to fall asleep...  \n\n If you lie in bed at " + String(format: "%02d", hour ) + ":" + String(format: "%02d", minutes) + ", you should try and wake up at one of the following times:"
            minutes = minutes + 14
            TimeLabel1.text = "\( (hour+24+1 + calculateOverflow1(minute: minutes))%24 ):\(String(format: "%02d", (minutes + 30)%60))";
            TimeLabel2.text = "\( (hour+24+3)%24 ):\(String(format: "%02d", minutes))";
            TimeLabel3.text = "\( (hour+24+4 + calculateOverflow1(minute: minutes))%24 ):\(String(format: "%02d", (minutes + 30)%60))"
            TimeLabel4.text = "\( (hour+24+6)%24 ):\(String(format: "%02d", minutes))";
            TimeLabel5.text = "\( (hour+24+7 + calculateOverflow1(minute: minutes))%24 ):\(String(format: "%02d", (minutes + 30)%60))";
            TimeLabel6.text = "\( (hour+24+9)%24 ):\(String(format: "%02d", minutes))";
        } else {
            InfoText.text = "RISETIME,It takes the average person 14 minutes to fall asleep...  \n\n If you want to wake up at " + String(format: "%02d", hour ) + ":" + String(format: "%02d", minutes) + ", you should get in bed at one of the following times:"
            var underflow = 0;
            
            minutes = (minutes - 14)
            if(minutes < 0){
                underflow = -1;
                minutes = 60 + minutes
            }
//            minutes = (minutes - 14)
            TimeLabel6.text = "\( (hour+24-2 + underflow + calculateOverflow1(minute: minutes))%24 ):\(String(format: "%02d", (minutes + 60 - 30)%60))";
            TimeLabel5.text = "\( (hour+24-3 + underflow)%24 ):\(String(format: "%02d", minutes))";
            TimeLabel4.text = "\( (hour+24-5 + underflow + calculateOverflow1(minute: minutes))%24 ):\(String(format: "%02d", (minutes + 60 - 30)%60))";
            TimeLabel3.text = "\( (hour+24-6 + underflow)%24 ):\(String(format: "%02d", minutes))";
            TimeLabel2.text = "\( (hour+24-8 + underflow + calculateOverflow1(minute: minutes))%24 ):\(String(format: "%02d", (minutes + 60 - 30)%60))";
            TimeLabel1.text = "\( (hour+24-9 + underflow)%24 ):\(String(format: "%02d", minutes))";//////
        }
    }
    

    @IBOutlet weak var InfoText: UITextView!
    @IBOutlet weak var TimeLabel1: UILabel!
    @IBOutlet weak var TimeLabel2: UILabel!
    @IBOutlet weak var TimeLabel3: UILabel!
    @IBOutlet weak var TimeLabel4: UILabel!
    @IBOutlet weak var TimeLabel5: UILabel!
    @IBOutlet weak var TimeLabel6: UILabel!
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
