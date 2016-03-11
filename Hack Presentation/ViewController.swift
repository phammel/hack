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
    var timeLength = 0
    var numberOf = 0
    var timeRealLength = 0.0
    
    override func viewDidLoad()
    {
    super.viewDidLoad()
    }
    

    //-------------------------------------------------------------------------------------------

    @IBAction func starttapped(sender: AnyObject)
    {
        
        timeLength = (Int)(timeSlide.value)
        switch timeLength
        {
        case 1 :
            timeRealLength = 15
        case 2 :
            timeRealLength = 10
        case 3:
            timeRealLength = 9
        case 4:
            timeRealLength = 7
        case 5:
            timeRealLength = 5
        case 6:
            timeRealLength = 3
        case 7:
            timeRealLength = 1
        case 8:
            timeRealLength = 0.9
        case 9:
            timeRealLength = 0.5
        case 10:
            timeRealLength = 0.3
        default:
            timeRealLength = 0.1
        }
        
        //alert
        
        //create alert
        let alert = UIAlertController(title: "ALERT", message: "❗️❗️❗️❗️❗️", preferredStyle: UIAlertControllerStyle.Alert)
        
        //create button for alert
        let resetbutton = UIAlertAction(title: "Done", style: UIAlertActionStyle.Default, handler: {sender in
            
            //closes the alert
            self.dismissViewControllerAnimated(true, completion: nil)
            
            })
        
        
        //-----------
        counter = 0 // set timer for 0 since it hasnt vibrated once
        
        //create timer that after complete goes to vibrate function then repeats
        timer = NSTimer.scheduledTimerWithTimeInterval(timeRealLength, target: self, selector: "vibratePhoneAlert", userInfo: nil, repeats: true)
        //--------------
        
        alert.addAction(resetbutton) //adds button to alert
        presentViewController(alert, animated: true, completion: nil) //show alert 
        //end of alert
        

        
       
        
    }
    //---------------------------------------------------------
    //function that vibrates for alert
    func vibratePhoneAlert()
    {
        counter++  // increment counter because u will have vibrated
       
        // go to case number for how many times you have vibrated
        switch counter
        {
        case 1 ... 2:   //once vibrates twice will go to default
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        default:
            timer?.invalidate() //stops the timer from repeating
        }
     }

    //-------------------------------------------------------------------------------------------

    
    
    
    
    
    
}

