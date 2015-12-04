//
//  ScienceCalcViewController.swift
//  SevenWondersScorecard
//
//  Created by Jason Gaare on 11/23/15.
//  Copyright © 2015 Jason Gaare. All rights reserved.
//

import UIKit

class ScienceCalcViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // MARK: Properties
    
    @IBOutlet weak var wheelSegment: UISegmentedControl!
    @IBOutlet weak var tabletSegment: UISegmentedControl!
    @IBOutlet weak var compassSegment: UISegmentedControl!
    @IBOutlet weak var calculatedScore: UITextField!
    @IBOutlet weak var namePicker: UIPickerView!
    @IBOutlet weak var assignScore: UIButton!
    @IBOutlet weak var returnButton: UIButton!
    
    var pickerData : [String] = [String]()
    var currentlySelected = 0
    
    // Initialized in segue from ViewController
    var nameArrayFromScorecard : [UITextField] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.namePicker.delegate = self
        self.namePicker.dataSource = self
        
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
    
    @IBAction func returnButtonClicked(sender: UIButton) {
        
        dismissViewControllerAnimated(true, completion: nil)
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
    
    
    // MARK: Picker Things
    
    func populateNamePicker() {
        
        for ix in nameArrayFromScorecard {
            //If there is no name, we need to put a filler
            if ix.text == "" {
                pickerData.append("Player \(ix.tag)")
            }
            //Else, fill in the name
            else {
                pickerData.append(ix.text!)
            }
        }
    }
    
    
    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // Catpure the picker view selection
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        self.currentlySelected = row
    }
    
    
    
    // MARK: Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    }
    

}
