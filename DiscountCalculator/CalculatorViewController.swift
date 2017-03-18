//
//  CalculatorViewController.swift
//  DiscountCalculator
//
//  Created by Belinda Wong on 3/18/17.
//  Copyright © 2017 Belinda Wong. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make Swipe Gestures
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        view.addGestureRecognizer(swipeLeft)
        // handleSwipe is a function down below
        // #selector() selects and executes that function
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Swipe Function
    func handleSwipe(_ sender:UIGestureRecognizer){
        self.performSegue(withIdentifier: "showResults", sender: self)
    }
    
    // Enable unwinding other views
    @IBAction func unwindToCalc(segue:UIStoryboardSegue){
        
    }
    
    // Grab values of all text fields
}
