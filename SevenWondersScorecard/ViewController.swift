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
        
        for ix in nameArray {
            ix.delegate = self
        }
        
        for ix in milScoreArray {
            ix.delegate = self
        }

        for ix in tresScoreArray {
            ix.delegate = self
        }

        for ix in wonderScoreArray {
            ix.delegate = self
        }

        for ix in civilScoreArray {
            ix.delegate = self
        }
        
        for ix in commScoreArray {
            ix.delegate = self
        }

        for ix in guildScoreArray {
            ix.delegate = self
        }

        for ix in sciScoreArray {
            ix.delegate = self
        }
        
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
        for ix in milScoreArray {
            ix.backgroundColor = militaryBG
        }
        
        for ix in tresScoreArray {
            ix.backgroundColor = treasuryBG
        }
        
        for ix in civilScoreArray {
            ix.backgroundColor = civilBG
        }

        for ix in commScoreArray {
            ix.backgroundColor = commBG
        }

        for ix in guildScoreArray {
            ix.backgroundColor = guildBG
        }

        for ix in sciScoreArray {
            ix.backgroundColor = sciBG
        }
       
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

        // Check if any invalid (non-Integer) numbers/characters are present 
        // (Except in nameField)
        
        for arr in scoresheet {
            for ix in arr {
                // Scores to enter are 35 wide, but if it is empty we don't care to check it
                if ix.frame.width == 35 && ix.text != "" {
                    // If we can cast the text to an Integer, we are happy (do nothing)
                    if let _ = Int(ix.text!) {
                        //Do nothing
                    }
                    else {
                        print("There's an issue")
                        
                        // Pop up to notify user of error
                        let alert = UIAlertController(title: "Invalid Score", message: "Score values must be integers", preferredStyle: UIAlertControllerStyle.Alert)
                        let alertAction = UIAlertAction(title: "Fix it", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in }
                        alert.addAction(alertAction)
                        presentViewController(alert, animated: true) { () -> Void in }
                        
                        return false
                        
                    }
                }
            }
        }
        
        // Hide the keyboard.
        textField.resignFirstResponder()
        
        //Updates Scores
        refreshScores()
        
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
    
    
    // All of the scoresheet
    var scoresheet = [[UITextField]]()
    
    // Player Name Column
    @IBOutlet weak var playerNameLabel: UILabel!
    
    var nameArray = [UITextField]() {didSet {scoresheet.append(nameArray)}}
    @IBOutlet weak var p1Name: UITextField! {didSet {nameArray.append(p1Name)}}
    @IBOutlet weak var p2Name: UITextField! {didSet {nameArray.append(p2Name)}}
    @IBOutlet weak var p3Name: UITextField! {didSet {nameArray.append(p3Name)}}
    @IBOutlet weak var p4Name: UITextField! {didSet {nameArray.append(p4Name)}}
    @IBOutlet weak var p5Name: UITextField! {didSet {nameArray.append(p5Name)}}
    @IBOutlet weak var p6Name: UITextField! {didSet {nameArray.append(p6Name)}}
    @IBOutlet weak var p7Name: UITextField! {didSet {nameArray.append(p7Name)}}
    
    
    // Military Score Column
    var milScoreArray = [UITextField]()  {didSet {scoresheet.append(milScoreArray)}}
    @IBOutlet weak var p1MilScore: UITextField! {didSet {milScoreArray.append(p1MilScore)}}
    @IBOutlet weak var p2MilScore: UITextField! {didSet {milScoreArray.append(p2MilScore)}}
    @IBOutlet weak var p3MilScore: UITextField! {didSet {milScoreArray.append(p3MilScore)}}
    @IBOutlet weak var p4MilScore: UITextField! {didSet {milScoreArray.append(p4MilScore)}}
    @IBOutlet weak var p5MilScore: UITextField! {didSet {milScoreArray.append(p5MilScore)}}
    @IBOutlet weak var p6MilScore: UITextField! {didSet {milScoreArray.append(p6MilScore)}}
    @IBOutlet weak var p7MilScore: UITextField! {didSet {milScoreArray.append(p7MilScore)}}
    
    //Treasury Score Column
    var tresScoreArray = [UITextField]()  {didSet {scoresheet.append(tresScoreArray)}}
    @IBOutlet weak var p1TresScore: UITextField! {didSet {tresScoreArray.append(p1TresScore)}}
    @IBOutlet weak var p2TresScore: UITextField! {didSet {tresScoreArray.append(p2TresScore)}}
    @IBOutlet weak var p3TresScore: UITextField! {didSet {tresScoreArray.append(p3TresScore)}}
    @IBOutlet weak var p4TresScore: UITextField! {didSet {tresScoreArray.append(p4TresScore)}}
    @IBOutlet weak var p5TresScore: UITextField! {didSet {tresScoreArray.append(p5TresScore)}}
    @IBOutlet weak var p6TresScore: UITextField! {didSet {tresScoreArray.append(p6TresScore)}}
    @IBOutlet weak var p7TresScore: UITextField! {didSet {tresScoreArray.append(p7TresScore)}}
    
    // Wonder Score Column
    var wonderScoreArray = [UITextField]()  {didSet {scoresheet.append(wonderScoreArray)}}
    @IBOutlet weak var p1WonderScore: UITextField! {didSet {wonderScoreArray.append(p1WonderScore)}}
    @IBOutlet weak var p2WonderScore: UITextField! {didSet {wonderScoreArray.append(p2WonderScore)}}
    @IBOutlet weak var p3WonderScore: UITextField! {didSet {wonderScoreArray.append(p3WonderScore)}}
    @IBOutlet weak var p4WonderScore: UITextField! {didSet {wonderScoreArray.append(p4WonderScore)}}
    @IBOutlet weak var p5WonderScore: UITextField! {didSet {wonderScoreArray.append(p5WonderScore)}}
    @IBOutlet weak var p6WonderScore: UITextField! {didSet {wonderScoreArray.append(p6WonderScore)}}
    @IBOutlet weak var p7WonderScore: UITextField! {didSet {wonderScoreArray.append(p7WonderScore)}}
    
    // Civilian Score Column (Victory Points)
    var civilScoreArray = [UITextField]()  {didSet {scoresheet.append(civilScoreArray)}}
    @IBOutlet weak var p1CivilScore: UITextField! {didSet {civilScoreArray.append(p1CivilScore)}}
    @IBOutlet weak var p2CivilScore: UITextField! {didSet {civilScoreArray.append(p2CivilScore)}}
    @IBOutlet weak var p3CivilScore: UITextField! {didSet {civilScoreArray.append(p3CivilScore)}}
    @IBOutlet weak var p4CivilScore: UITextField! {didSet {civilScoreArray.append(p4CivilScore)}}
    @IBOutlet weak var p5CivilScore: UITextField! {didSet {civilScoreArray.append(p5CivilScore)}}
    @IBOutlet weak var p6CivilScore: UITextField! {didSet {civilScoreArray.append(p6CivilScore)}}
    @IBOutlet weak var p7CivilScore: UITextField! {didSet {civilScoreArray.append(p7CivilScore)}}
    
    // Commerical Score Column (Yellow Cards)
    var commScoreArray = [UITextField]() {didSet {scoresheet.append(commScoreArray)}}
    @IBOutlet weak var p1CommScore: UITextField! {didSet {commScoreArray.append(p1CommScore)}}
    @IBOutlet weak var p2CommScore: UITextField! {didSet {commScoreArray.append(p2CommScore)}}
    @IBOutlet weak var p3CommScore: UITextField! {didSet {commScoreArray.append(p3CommScore)}}
    @IBOutlet weak var p4CommScore: UITextField! {didSet {commScoreArray.append(p4CommScore)}}
    @IBOutlet weak var p5CommScore: UITextField! {didSet {commScoreArray.append(p5CommScore)}}
    @IBOutlet weak var p6CommScore: UITextField! {didSet {commScoreArray.append(p6CommScore)}}
    @IBOutlet weak var p7CommScore: UITextField! {didSet {commScoreArray.append(p7CommScore)}}
    
    // Guild Score Column
    var guildScoreArray = [UITextField]()  {didSet {scoresheet.append(guildScoreArray)}}
    @IBOutlet weak var p1GuildScore: UITextField! {didSet {guildScoreArray.append(p1GuildScore)}}
    @IBOutlet weak var p2GuildScore: UITextField! {didSet {guildScoreArray.append(p2GuildScore)}}
    @IBOutlet weak var p3GuildScore: UITextField! {didSet {guildScoreArray.append(p3GuildScore)}}
    @IBOutlet weak var p4GuildScore: UITextField! {didSet {guildScoreArray.append(p4GuildScore)}}
    @IBOutlet weak var p5GuildScore: UITextField! {didSet {guildScoreArray.append(p5GuildScore)}}
    @IBOutlet weak var p6GuildScore: UITextField! {didSet {guildScoreArray.append(p6GuildScore)}}
    @IBOutlet weak var p7GuildScore: UITextField! {didSet {guildScoreArray.append(p7GuildScore)}}
    
    // Science Score Column
    var sciScoreArray = [UITextField]() {didSet {scoresheet.append(sciScoreArray)}}
    @IBOutlet weak var p1SciScore: UITextField! {didSet {sciScoreArray.append(p1SciScore)}}
    @IBOutlet weak var p2SciScore: UITextField! {didSet {sciScoreArray.append(p2SciScore)}}
    @IBOutlet weak var p3SciScore: UITextField! {didSet {sciScoreArray.append(p3SciScore)}}
    @IBOutlet weak var p4SciScore: UITextField! {didSet {sciScoreArray.append(p4SciScore)}}
    @IBOutlet weak var p5SciScore: UITextField! {didSet {sciScoreArray.append(p5SciScore)}}
    @IBOutlet weak var p6SciScore: UITextField! {didSet {sciScoreArray.append(p6SciScore)}}
    @IBOutlet weak var p7SciScore: UITextField! {didSet {sciScoreArray.append(p7SciScore)}}
    
    // Total Score Column
    var totalScoreArray = [UITextField]()  {didSet {scoresheet.append(totalScoreArray)}}
    @IBOutlet weak var p1Total: UITextField! {didSet {totalScoreArray.append(p1Total)}}
    @IBOutlet weak var p2Total: UITextField! {didSet {totalScoreArray.append(p2Total)}}
    @IBOutlet weak var p3Total: UITextField! {didSet {totalScoreArray.append(p3Total)}}
    @IBOutlet weak var p4Total: UITextField! {didSet {totalScoreArray.append(p4Total)}}
    @IBOutlet weak var p5Total: UITextField! {didSet {totalScoreArray.append(p5Total)}}
    @IBOutlet weak var p6Total: UITextField! {didSet {totalScoreArray.append(p6Total)}}
    @IBOutlet weak var p7Total: UITextField! {didSet {totalScoreArray.append(p7Total)}}
    
    
    
}

