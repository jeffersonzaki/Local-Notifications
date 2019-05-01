//
//  ViewController.swift
//  LocalNotifications
//
//  Created by Zaki Jefferson on 12/6/18.
//  Copyright © 2018 Zaki Jefferson. All rights reserved.
//

import UIKit
// call the notification to access all classes that's needed
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //reference to the notification center
        let center = UNUserNotificationCenter.current()
        
        //step1: ask user for permission
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
        }
        
        //step2: Create the notification content
        let content = UNMutableNotificationContent()
        content.title = "Hey I'm a Notification!"
        content.body = "Look at me!"
        
        //step3: create a trigger (when the notification should show)
        
        //differnet types but using a date and time trigger
        let date = Date().addingTimeInterval(10)
        
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
       let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        //step4: create the request
        
        //creating the identifier/ID
        let uuidString = UUID().uuidString
        
       let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        //step5: Register the request
        center.add(request) { (error) in
            //check the error parameter and handle any errors
        }
    }


}

