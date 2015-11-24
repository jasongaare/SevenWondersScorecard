//
//  ScienceCalcViewController.swift
//  SevenWondersScorecard
//
//  Created by Jason Gaare on 11/23/15.
//  Copyright © 2015 Jason Gaare. All rights reserved.
//

import UIKit

class ScienceCalcViewController: UIViewController, UIPickerViewDelegate {

    // MARK: Properties
    
    @IBOutlet weak var wheelSegment: UISegmentedControl!
    @IBOutlet weak var tabletSegment: UISegmentedControl!
    @IBOutlet weak var compassSegment: UISegmentedControl!
    @IBOutlet weak var calculatedScore: UITextField!
    @IBOutlet weak var namePicker: UIPickerView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        calcScore()
        populateNamePicker()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Actions
    @IBAction func segmentChanged(sender: UISegmentedControl) {
        calcScore()
    }
    
    
    
    
    // MARK: Calculations

    func calcScore() {
        
        
        //Get number of cards from segements
        var wheelCards = wheelSegment.selectedSegmentIndex
        var tabletCards = tabletSegment.selectedSegmentIndex
        var compassCards = compassSegment.selectedSegmentIndex
        
        //Initiate score
        var score = 0;
        
        //Add the squares of the card categories
        score += (wheelCards * wheelCards)
        score += (tabletCards * tabletCards)
        score += (compassCards * compassCards)
        
        //Add 7 points for each complete set.
        //While we have at least one of each card, we add 7 points and remove that complete set
        while wheelCards > 0 && tabletCards > 0 && compassCards > 0 {
            wheelCards--
            tabletCards--
            compassCards--
            score += 7
        }
        
        calculatedScore.text = "\(score)"
    }
    
    func populateNamePicker() {
        
        self.namePicker.
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
