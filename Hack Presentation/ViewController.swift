//
//  ViewController.swift
//  Hack Presentation
//
//  Created by Phammel on 3/9/16.
//  Copyright © 2016 Phammel. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {


    
    @IBOutlet weak var timeSlide: UISlider!
    @IBOutlet weak var numberSlider: UISlider!
    
    
    var counter = 0 //counter for how many times you vibrate
    var timer : NSTimer?     //timer
    var timeLength = 0    // temp var to hold value from slider
    var numberOf = 0   //number of times to vibrate Vibrate
    var timeRealLength = 0.0 //how long in between Vibrations
    
    override func viewDidLoad()
    {
    super.viewDidLoad()
    }
    

    //-------------------------------------------------------------------------------------------

    @IBAction func starttapped(sender: AnyObject)
    {
    
        //set timelength to int value
        timeLength = (Int)(timeSlide.value)
        
        
        //case switch to pick length between vibrations
        
        switch timeLength
        {
        case 1 :
            timeRealLength = 0.1
        case 2 :
            timeRealLength = 0.6
        case 3:
            timeRealLength = 1
        case 4:
            timeRealLength = 2
        case 5:
            timeRealLength = 3
        case 6:
            timeRealLength = 4
        case 7:
            timeRealLength = 5
        case 8:
            timeRealLength = 6
        case 9:
            timeRealLength = 7
        case 10:
            timeRealLength = 8
        default:
            timeRealLength = 0.5
        }
        
        //alert
        
        //create alert
        let alert = UIAlertController(title: "ALERT", message: "❗️❗️❗️❗️❗️", preferredStyle: UIAlertControllerStyle.Alert)
        
        //create button for alert
        let resetbutton = UIAlertAction(title: "Done", style: UIAlertActionStyle.Default, handler: {sender in
            
        //closes the alert when tap done button
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
            
            })
        
        
        //-----------
          timer = nil  // reset timer
        
        counter = 0 // set timer for 0 since it hasnt vibrated once
        
        //create timer that after complete goes to vibrate function then repeats
        
        timer = NSTimer.scheduledTimerWithTimeInterval(timeRealLength, target: self, selector: "vibratePhoneAlert", userInfo: nil, repeats: true)
        
        //--------------
        
        alert.addAction(resetbutton) //adds button to alert
        presentViewController(alert, animated: true, completion: nil) //show alert 
        
        
        
        
      


        
       
        
    }
    //---------------------------------------------------------
    //function that vibrates for alert
    func vibratePhoneAlert()
    {
        counter++  // increment counter because u will have vibrated
       
        numberOf = (Int)(numberSlider.value) //set the number of times to vibrate to an int
        
       //  go to case number for how many times you have vibrated
        
        switch counter
        {
        case 1 ... numberOf:   //once vibrates twice will go to default
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate) //vibrate phone
        default:
            timer?.invalidate() //stops the timer from repeating once gone through all the cases
        }
}

    //-------------------------------------------------------------------------------------------

    
    
    
    
    
    
}

