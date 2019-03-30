//
//  ThirdViewController.swift
//  TestSleepy
//
//  Created by Kelly Cole on 3/25/19.
//  Copyright © 2019 Kelly Cole. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    let client  = Client()
    
    @IBAction func TestButtonOnClicked(_ sender: Any) {
        client.sendMessage(message: "testMessage\n")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //set up network connection
        client.setupNetworkCommunication()
        // Do any additional setup after loading the view.
        // *** Create date ***
        let date = NSDate()
        
        // *** create calendar object ***
        var calendar = NSCalendar.current
        
        // *** Get components using current Local & Timezone ***
        print(calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date as Date))
        
        // *** define calendar components to use as well Timezone to UTC ***
        let unitFlags = Set<Calendar.Component>([.hour, .year, .minute])
        calendar.timeZone = TimeZone(identifier: "UTC")!
        
        // *** Get All components from date ***
        let components = calendar.dateComponents(unitFlags, from: date as Date)
        print("All Components : \(components)")
        
        // *** Get Individual components from date ***
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
        
        Label1.text = "\( (hour+24-4+1+calculateOverflow1(minute: minutes))%24 ):\(String(format: "%02d", (minutes + 30)%60))";
        Label2.text = "\( (hour+24-4+3)%24 ):\(String(format: "%02d", minutes))";
        Label3.text = "\( (hour+24-4+4+calculateOverflow1(minute: minutes))%24 ):\(String(format: "%02d", (minutes + 30)%60))"
        Label4.text = "\( (hour+24-4+6)%24 ):\(String(format: "%02d", minutes))";
        Label5.text = "\( (hour+24-4+7+calculateOverflow1(minute: minutes))%24 ):\(String(format: "%02d", (minutes + 30)%60))";
        Label6.text = "\( (hour+24-4+9)%24 ):\(String(format: "%02d", minutes))";

        
    }
    
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label3: UILabel!
    @IBOutlet weak var Label4: UILabel!
    @IBOutlet weak var Label5: UILabel!
    @IBOutlet weak var Label6: UILabel!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
