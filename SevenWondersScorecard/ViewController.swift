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

    
    
    // MARK: Standard Fuctions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        p1Name.delegate = self
        p2Name.delegate = self
        p3Name.delegate = self
        p4Name.delegate = self
        p5Name.delegate = self
        p6Name.delegate = self
        p7Name.delegate = self

        populateNames()
        
        print("Successful Load")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func populateNames() {
        p1Name.text = "Jason"
        p2Name.text = "Erin"
        p3Name.text = "Evan"
        p4Name.text = "Amber"
        p5Name.text = "Nate"
        p6Name.text = "Jackie"
        p7Name.text = "Marshall"
    }

    // MARK: UITextDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    
    
    
    
}

