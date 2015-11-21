//
//  ViewController.swift
//  SevenWondersScorecard
//
//  Created by Jason Gaare on 11/20/15.
//  Copyright © 2015 Jason Gaare. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    // MARK: Standard Fuctions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setTextFieldDelegates()

        setBackgroundColors()
        
        populatePlayerNames()
        
        refreshScores()
        
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
        
        p1TresScore.delegate = self
        p2TresScore.delegate = self
        p3TresScore.delegate = self
        p4TresScore.delegate = self
        p5TresScore.delegate = self
        p6TresScore.delegate = self
        p7TresScore.delegate = self
        
        p1WonderScore.delegate = self
        p2WonderScore.delegate = self
        p3WonderScore.delegate = self
        p4WonderScore.delegate = self
        p5WonderScore.delegate = self
        p6WonderScore.delegate = self
        p7WonderScore.delegate = self
        
        p1CivilScore.delegate = self
        p2CivilScore.delegate = self
        p3CivilScore.delegate = self
        p4CivilScore.delegate = self
        p5CivilScore.delegate = self
        p6CivilScore.delegate = self
        p7CivilScore.delegate = self
        
        p1CommScore.delegate = self
        p2CommScore.delegate = self
        p3CommScore.delegate = self
        p4CommScore.delegate = self
        p5CommScore.delegate = self
        p6CommScore.delegate = self
        p7CommScore.delegate = self
        
        p1GuildScore.delegate = self
        p2GuildScore.delegate = self
        p3GuildScore.delegate = self
        p4GuildScore.delegate = self
        p5GuildScore.delegate = self
        p6GuildScore.delegate = self
        p7GuildScore.delegate = self
        
        p1SciScore.delegate = self
        p2SciScore.delegate = self
        p3SciScore.delegate = self
        p4SciScore.delegate = self
        p5SciScore.delegate = self
        p6SciScore.delegate = self
        p7SciScore.delegate = self
        
        
    }
    
    func setBackgroundColors() {
        
        //Declare desired colors
        let militaryBG = UIColor(red: 0.789, green: 0.293, blue: 0.293, alpha: 0.8)
        let treasuryBG = UIColor(red: 0.926, green: 0.832, blue: 0.164, alpha: 0.35)
        let civilBG = UIColor(red: 0, green: 0.086, blue: 1, alpha: 0.35)
        let commBG = UIColor(red: 0.992, green: 0.51, blue: 0.055, alpha: 0.35)
        let guildBG = UIColor(red: 0.224, green: 0.067, blue: 0.365, alpha: 0.35)
        let sciBG = UIColor(red: 0.067, green: 0.435, blue: 0.149, alpha: 0.35)
        
        //Set backgrounds
        p1MilScore.backgroundColor = militaryBG
        p2MilScore.backgroundColor = militaryBG
        p3MilScore.backgroundColor = militaryBG
        p4MilScore.backgroundColor = militaryBG
        p5MilScore.backgroundColor = militaryBG
        p6MilScore.backgroundColor = militaryBG
        p7MilScore.backgroundColor = militaryBG
        
        p1TresScore.backgroundColor = treasuryBG
        p2TresScore.backgroundColor = treasuryBG
        p3TresScore.backgroundColor = treasuryBG
        p4TresScore.backgroundColor = treasuryBG
        p5TresScore.backgroundColor = treasuryBG
        p6TresScore.backgroundColor = treasuryBG
        p7TresScore.backgroundColor = treasuryBG
        
        p1CivilScore.backgroundColor = civilBG
        p2CivilScore.backgroundColor = civilBG
        p3CivilScore.backgroundColor = civilBG
        p4CivilScore.backgroundColor = civilBG
        p5CivilScore.backgroundColor = civilBG
        p6CivilScore.backgroundColor = civilBG
        p7CivilScore.backgroundColor = civilBG
        
        p1CommScore.backgroundColor = commBG
        p2CommScore.backgroundColor = commBG
        p3CommScore.backgroundColor = commBG
        p4CommScore.backgroundColor = commBG
        p5CommScore.backgroundColor = commBG
        p6CommScore.backgroundColor = commBG
        p7CommScore.backgroundColor = commBG
        
        p1GuildScore.backgroundColor = guildBG
        p2GuildScore.backgroundColor = guildBG
        p3GuildScore.backgroundColor = guildBG
        p4GuildScore.backgroundColor = guildBG
        p5GuildScore.backgroundColor = guildBG
        p6GuildScore.backgroundColor = guildBG
        p7GuildScore.backgroundColor = guildBG
        
        p1SciScore.backgroundColor = sciBG
        p2SciScore.backgroundColor = sciBG
        p3SciScore.backgroundColor = sciBG
        p4SciScore.backgroundColor = sciBG
        p5SciScore.backgroundColor = sciBG
        p6SciScore.backgroundColor = sciBG
        p7SciScore.backgroundColor = sciBG
        
        
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
            
            // If user input an Integer, things are a-okay
            if let _ = Int(textField.text!) {
                
                // Hide the keyboard.
                textField.resignFirstResponder()
                
                //Updates Scores
                refreshScores()
                
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
    
    
    func refreshScores() {
        
        //Calculate player 1 score
        var p1score: Int = 0
        //If there is an integer in the textField, add it to the score
        if let x = Int(p1MilScore.text!) {
            p1score += x
        }
        if let x = Int(p1TresScore.text!) {
            p1score += x
        }
        if let x = Int(p1WonderScore.text!) {
            p1score += x
        }
        if let x = Int(p1CivilScore.text!) {
            p1score += x
        }
        if let x = Int(p1CommScore.text!) {
            p1score += x
        }
        if let x = Int(p1GuildScore.text!) {
            p1score += x
        }
        if let x = Int(p1SciScore.text!) {
            p1score += x
        }
        p1Total.text = "\(p1score)"
        
        //Calculate player 2 score
        var p2score: Int = 0
        //If there is an integer in the textField, add it to the score
        if let x = Int(p2MilScore.text!) {
            p2score += x
        }
        if let x = Int(p2TresScore.text!) {
            p2score += x
        }
        if let x = Int(p2WonderScore.text!) {
            p2score += x
        }
        if let x = Int(p2CivilScore.text!) {
            p2score += x
        }
        if let x = Int(p2CommScore.text!) {
            p2score += x
        }
        if let x = Int(p2GuildScore.text!) {
            p2score += x
        }
        if let x = Int(p2SciScore.text!) {
            p2score += x
        }
        p2Total.text = "\(p2score)"
        
        //Calculate player 3 score
        var p3score: Int = 0
        //If there is an integer in the textField, add it to the score
        if let x = Int(p3MilScore.text!) {
            p3score += x
        }
        if let x = Int(p3TresScore.text!) {
            p3score += x
        }
        if let x = Int(p3WonderScore.text!) {
            p3score += x
        }
        if let x = Int(p3CivilScore.text!) {
            p3score += x
        }
        if let x = Int(p3CommScore.text!) {
            p3score += x
        }
        if let x = Int(p3GuildScore.text!) {
            p3score += x
        }
        if let x = Int(p3SciScore.text!) {
            p3score += x
        }
        p3Total.text = "\(p3score)"
        
        //Calculate player 4 score
        var p4score: Int = 0
        //If there is an integer in the textField, add it to the score
        if let x = Int(p4MilScore.text!) {
            p4score += x
        }
        if let x = Int(p4TresScore.text!) {
            p4score += x
        }
        if let x = Int(p4WonderScore.text!) {
            p4score += x
        }
        if let x = Int(p4CivilScore.text!) {
            p4score += x
        }
        if let x = Int(p4CommScore.text!) {
            p4score += x
        }
        if let x = Int(p4GuildScore.text!) {
            p4score += x
        }
        if let x = Int(p4SciScore.text!) {
            p4score += x
        }
        p4Total.text = "\(p4score)"
        
        //Calculate player 5 score
        var p5score: Int = 0
        //If there is an integer in the textField, add it to the score
        if let x = Int(p5MilScore.text!) {
            p5score += x
        }
        if let x = Int(p5TresScore.text!) {
            p5score += x
        }
        if let x = Int(p5WonderScore.text!) {
            p5score += x
        }
        if let x = Int(p5CivilScore.text!) {
            p5score += x
        }
        if let x = Int(p5CommScore.text!) {
            p5score += x
        }
        if let x = Int(p5GuildScore.text!) {
            p5score += x
        }
        if let x = Int(p5SciScore.text!) {
            p5score += x
        }
        p5Total.text = "\(p5score)"
        
        //Calculate player 6 score
        var p6score: Int = 0
        //If there is an integer in the textField, add it to the score
        if let x = Int(p6MilScore.text!) {
            p6score += x
        }
        if let x = Int(p6TresScore.text!) {
            p6score += x
        }
        if let x = Int(p6WonderScore.text!) {
            p6score += x
        }
        if let x = Int(p6CivilScore.text!) {
            p6score += x
        }
        if let x = Int(p6CommScore.text!) {
            p6score += x
        }
        if let x = Int(p6GuildScore.text!) {
            p6score += x
        }
        if let x = Int(p6SciScore.text!) {
            p6score += x
        }
        p6Total.text = "\(p6score)"
        
        //Calculate player 7 score
        var p7score: Int = 0
        //If there is an integer in the textField, add it to the score
        if let x = Int(p7MilScore.text!) {
            p7score += x
        }
        if let x = Int(p7TresScore.text!) {
            p7score += x
        }
        if let x = Int(p7WonderScore.text!) {
            p7score += x
        }
        if let x = Int(p7CivilScore.text!) {
            p7score += x
        }
        if let x = Int(p7CommScore.text!) {
            p7score += x
        }
        if let x = Int(p7GuildScore.text!) {
            p7score += x
        }
        if let x = Int(p7SciScore.text!) {
            p7score += x
        }
        p7Total.text = "\(p7score)"
    }
    
    
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
    
    //Treasury Score Column
    @IBOutlet weak var p1TresScore: UITextField!
    @IBOutlet weak var p2TresScore: UITextField!
    @IBOutlet weak var p3TresScore: UITextField!
    @IBOutlet weak var p4TresScore: UITextField!
    @IBOutlet weak var p5TresScore: UITextField!
    @IBOutlet weak var p6TresScore: UITextField!
    @IBOutlet weak var p7TresScore: UITextField!
    
    // Wonder Score Column
    @IBOutlet weak var p1WonderScore: UITextField!
    @IBOutlet weak var p2WonderScore: UITextField!
    @IBOutlet weak var p3WonderScore: UITextField!
    @IBOutlet weak var p4WonderScore: UITextField!
    @IBOutlet weak var p5WonderScore: UITextField!
    @IBOutlet weak var p6WonderScore: UITextField!
    @IBOutlet weak var p7WonderScore: UITextField!
    
    // Civilian Score Column (Victory Points)
    @IBOutlet weak var p1CivilScore: UITextField!
    @IBOutlet weak var p2CivilScore: UITextField!
    @IBOutlet weak var p3CivilScore: UITextField!
    @IBOutlet weak var p4CivilScore: UITextField!
    @IBOutlet weak var p5CivilScore: UITextField!
    @IBOutlet weak var p6CivilScore: UITextField!
    @IBOutlet weak var p7CivilScore: UITextField!
    
    // Commerical Score Column (Yellow Cards)
    @IBOutlet weak var p1CommScore: UITextField!
    @IBOutlet weak var p2CommScore: UITextField!
    @IBOutlet weak var p3CommScore: UITextField!
    @IBOutlet weak var p4CommScore: UITextField!
    @IBOutlet weak var p5CommScore: UITextField!
    @IBOutlet weak var p6CommScore: UITextField!
    @IBOutlet weak var p7CommScore: UITextField!
    
    // Guild Score Column
    @IBOutlet weak var p1GuildScore: UITextField!
    @IBOutlet weak var p2GuildScore: UITextField!
    @IBOutlet weak var p3GuildScore: UITextField!
    @IBOutlet weak var p4GuildScore: UITextField!
    @IBOutlet weak var p5GuildScore: UITextField!
    @IBOutlet weak var p6GuildScore: UITextField!
    @IBOutlet weak var p7GuildScore: UITextField!
    
    // Science Score Column
    @IBOutlet weak var p1SciScore: UITextField!
    @IBOutlet weak var p2SciScore: UITextField!
    @IBOutlet weak var p3SciScore: UITextField!
    @IBOutlet weak var p4SciScore: UITextField!
    @IBOutlet weak var p5SciScore: UITextField!
    @IBOutlet weak var p6SciScore: UITextField!
    @IBOutlet weak var p7SciScore: UITextField!
    
    // Total Score Column
    @IBOutlet weak var p1Total: UITextField!
    @IBOutlet weak var p2Total: UITextField!
    @IBOutlet weak var p3Total: UITextField!
    @IBOutlet weak var p4Total: UITextField!
    @IBOutlet weak var p5Total: UITextField!
    @IBOutlet weak var p6Total: UITextField!
    @IBOutlet weak var p7Total: UITextField!
    
}

