//
//  ViewController.swift
//  OurWeddingApp
//
//  Created by Mike Sabens on 6/26/16.
//  Copyright © 2016 TheNewThirty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var staticText: UILabel!
    
    let formatter = NSDateFormatter()
    
    let userCalendar = NSCalendar.currentCalendar()
    
    let requestedComponent: NSCalendarUnit = [
        NSCalendarUnit.Month,
        NSCalendarUnit.Day,
        NSCalendarUnit.Hour,
        NSCalendarUnit.Minute,
        NSCalendarUnit.Second
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateLabel.hidden = true
        staticText.hidden = true
        
        let timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(printTime), userInfo: nil, repeats: true)
        
        timer.fire()
        
        
        printTime()
    }
    
    func printTime() {
        formatter.dateFormat = "MM/dd/yy hh:mm:ss a"
        let startTime = NSDate()
        let endTime = formatter.dateFromString("08/20/16 12:00:00 a")
        
        let timeDifference = userCalendar.components(requestedComponent, fromDate: startTime, toDate: endTime!, options: [])
        
        dateLabel.text = "\(timeDifference.month) Month \(timeDifference.day) Days \(timeDifference.hour) Hours \n \(timeDifference.minute) Minutes, \(timeDifference.second) Seconds"
    }

    @IBAction func heartsPressed(sender: AnyObject) {
        dateLabel.hidden = false
        staticText.hidden = false
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

