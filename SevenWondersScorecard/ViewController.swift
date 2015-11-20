//
//  ViewController.swift
//  SevenWondersScorecard
//
//  Created by Jason Gaare on 11/20/15.
//  Copyright © 2015 Jason Gaare. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties
    
    // Player Name Column
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var p1Name: UITextField!
    @IBOutlet weak var p2Name: UITextField!
    @IBOutlet weak var p3Name: UITextField!
    @IBOutlet weak var p4Name: UITextField!
    @IBOutlet weak var p5Name: UITextField!
    @IBOutlet weak var p6Name: UITextField!
    @IBOutlet weak var p7Name: UITextField!

    // Military Score Column
    @IBOutlet weak var p1MilScore: UITextField!
    @IBOutlet weak var p2MilScore: UITextField!
    @IBOutlet weak var p3MilScore: UITextField!
    @IBOutlet weak var p4MilScore: UITextField!
    @IBOutlet weak var p5MilScore: UITextField!
    @IBOutlet weak var p6MilScore: UITextField!
    @IBOutlet weak var p7MilScore: UITextField!
    
    
    
    
    // MARK: Standard Fuctions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setTextFieldDelegates()

        setBackgroundColors()
        
        populatePlayerNames()
        
        
        print("Successful Load")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Methods to initialize the UI


    func setTextFieldDelegates() {
        p1Name.delegate = self
        p2Name.delegate = self
        p3Name.delegate = self
        p4Name.delegate = self
        p5Name.delegate = self
        p6Name.delegate = self
        p7Name.delegate = self
        
        p1MilScore.delegate = self
        p2MilScore.delegate = self
        p3MilScore.delegate = self
        p4MilScore.delegate = self
        p5MilScore.delegate = self
        p6MilScore.delegate = self
        p7MilScore.delegate = self
    }
    
    func setBackgroundColors() {
        
        //Declare desired colors
        let militaryBG = UIColor(red: 0.789, green: 0.293, blue: 0.293, alpha: 0.8)
        
        //Set backgrounds
        p1MilScore.backgroundColor = militaryBG
        p2MilScore.backgroundColor = militaryBG
        p3MilScore.backgroundColor = militaryBG
        p4MilScore.backgroundColor = militaryBG
        p5MilScore.backgroundColor = militaryBG
        p6MilScore.backgroundColor = militaryBG
        p7MilScore.backgroundColor = militaryBG
        
        
    }
    
    func populatePlayerNames() {
        p1Name.text = "Jason"
        p2Name.text = "Erin"
        p3Name.text = "Evan"
        p4Name.text = "Amber"
        p5Name.text = "Nate"
        p6Name.text = "Jackie"
        p7Name.text = "Marshall"
    }

    // MARK: UITextDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        
        // Width of Int-only textFields are 35
        if Int(textField.frame.width) == 35 {
            print("Confirmed width")
            // If user input an Integer, things are a-okay
            if let _ = Int(textField.text!) {
                // Hide the keyboard.
                textField.resignFirstResponder()
                return true
            }
            else {
                print("There's an issue")
                
                // Pop up to notify user of error
                let alert = UIAlertController(title: "Invalid Score", message: "Score value must be an integer", preferredStyle: UIAlertControllerStyle.Alert)
                let alertAction = UIAlertAction(title: "Enter score again", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in }
                alert.addAction(alertAction)
                presentViewController(alert, animated: true) { () -> Void in }
                
                return false
            }
        }
    
        // If this is the player name, we are okay regardless
        
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    
    
    
    
}

