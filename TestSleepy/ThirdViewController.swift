///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  ThirdViewController.swift
//  TestSleepy
//
//  Created by Kelly Cole on 3/25/19.
//  Copyright © 2019 Kelly Cole. All rights reserved.
//
import UIKit
class ThirdViewController: UIViewController {
    
    var label1 = ""
    var label2 = ""
    var label3 = ""
    var label4 = ""
    var label5 = ""
    var label6 = ""
    
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var Button4: UIButton!
    @IBOutlet weak var Button5: UIButton!
    @IBOutlet weak var Button6: UIButton!
    
    @IBAction func Button1(_ sender: Any) {
        client.sendMessage(message: label1 + "\n")
    }
    
    @IBAction func Button2(_ sender: Any) {
        client.sendMessage(message: label2 + "\n")
    }
    
    @IBAction func Button3(_ sender: Any) {
        client.sendMessage(message: label3 + "\n")
    }
    
    @IBAction func Button4(_ sender: Any) {
        client.sendMessage(message: label4 + "\n")
    }
    
    @IBAction func Button5(_ sender: Any) {
        client.sendMessage(message: label5 + "\n")
    }
    
    @IBAction func Button6(_ sender: Any) {
        client.sendMessage(message: label6 + "\n")
    }
    
    @IBOutlet weak var View3Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        View3Label.lineBreakMode = NSLineBreakMode.byWordWrapping
        View3Label.numberOfLines = 0
        
        // Create a calendar, date and retrieve components
        var calendar = NSCalendar.current
        let date = NSDate()
        let unitFlags = Set<Calendar.Component>([.hour, .year, .minute])
        calendar.timeZone = TimeZone(identifier: "EST")!
        let components = calendar.dateComponents(unitFlags, from: date as Date)
        print("All Components : \(components)")
        
        // Retrieve components
        let hour = calendar.component(.hour, from: date as Date)
        let minutes = calendar.component(.minute, from: date as Date) + 14
        let seconds = calendar.component(.second, from: date as Date)
        
        func calculateOverflow1(minute: Int) ->Int {
            if ((minute + 30) > 60){
                return 1;
            } else {
                return 0;
            }
        }
        
        label1 = "\( (hour+24+1+1+calculateOverflow1(minute: minutes))%24 ):\(String(format: "%02d", (minutes + 30)%60))";
        label2 = "\( (hour+24+1+3)%24 ):\(String(format: "%02d", minutes))";
        label3 = "\( (hour+24+1+4+calculateOverflow1(minute: minutes))%24 ):\(String(format: "%02d", (minutes + 30)%60))"
        label4 = "\( (hour+24+1+6)%24 ):\(String(format: "%02d", minutes))";
        label5 = "\( (hour+24+1+7+calculateOverflow1(minute: minutes))%24 ):\(String(format: "%02d", (minutes + 30)%60))";
        label6 = "\( (hour+24+1+9)%24 ):\(String(format: "%02d", minutes))";
        
        Button1.setTitle(label1, for: .normal)
        Button2.setTitle(label2, for: .normal)
        Button3.setTitle(label3, for: .normal)
        Button4.setTitle(label4, for: .normal)
        Button5.setTitle(label5, for: .normal)
        Button6.setTitle(label6, for: .normal)
    }
}
