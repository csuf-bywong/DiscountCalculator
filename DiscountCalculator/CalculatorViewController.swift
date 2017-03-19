//
//  CalculatorViewController.swift
//  MVC-Example
//
//  Created by Belinda Wong on 2/27/17.
//  Copyright © 2017 Belinda Wong. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {
    
    
    // MARK: Textfields
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var dollarsOffTextField: UITextField!
    @IBOutlet weak var discountTextField: UITextField!
    @IBOutlet weak var otherDiscountTextField: UITextField!
    @IBOutlet weak var taxTextField: UITextField!
    
    
    // MARK: variable initialization
    var price:Float = 0.0
    var dollarsOff:Float = 0.0
    var discount:Float = 0.0
    var otherDiscount:Float = 0.0
    var tax:Float = 0.0
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        // Make Swipe Gestures
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action:#selector(handleSwipe))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        view.addGestureRecognizer(swipeLeft)
        // handleSwipe is a function down below...
        // #selector() selects and executes that function
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Swipe Function
    func handleSwipe(_ sender:UIGestureRecognizer)
    {
        self.performSegue(withIdentifier: "showResults", sender: self)
    }
    
    // Enable unwinding other views
    @IBAction func unwindToCalc(segue:UIStoryboardSegue)
    {
    }
    
    
    // MARK: UILabels
    @IBOutlet weak var oLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    
    // Grab values of all text fields
    // MARK: Actions
    @IBAction func calculateButton(_ sender: UIButton)
    {
        // make the keyboard go away
        taxTextField.resignFirstResponder();
        
        // setting the variables made in this class equal to the numbers inside the text fields
        price = Float(priceTextField.text!)!
        dollarsOff = Float(dollarsOffTextField.text!)!
        discount = Float(discountTextField.text!)!
        otherDiscount = Float(otherDiscountTextField.text!)!
        tax = Float(taxTextField.text!)!
        
        // setting all the values in the shared instance with the values with the variables values in this class
        CalcData.price = price
        CalcData.dollarsOff = dollarsOff
        CalcData.discount = discount
        CalcData.otherDiscount = otherDiscount
        CalcData.tax = tax
        
        // creating some more variables
        let originalPrice:Float = price * (tax / 100) + price
        let discountPrice:Float = round(((price - dollarsOff) * (1 - discount / 100) * (1 - otherDiscount / 100) * (1 + tax / 100) + 0.05))
        let saved:Float = round((originalPrice - discountPrice) + 0.05)
        
        // setting more shared instance values
        CalcData.discountPrice = discountPrice
        CalcData.originalPrice = originalPrice
        CalcData.saved = saved
        
        // creating the text that would show under all the text fields
        let oString:String = String(originalPrice)
        oLabel.text = oString
        let dString:String = String(discountPrice)
        dLabel.text = dString
    }
    
    // a button that clears all the text fields and clears the text under the text fields as well
    // also resets the values in the shared instance
    @IBAction func clearButton(_ sender: UIButton)
    {
        priceTextField.text = ""
        dollarsOffTextField.text = ""
        discountTextField.text = ""
        otherDiscountTextField.text = ""
        taxTextField.text = ""
        oLabel.text = ""
        dLabel.text = ""
        CalcData.price = 0.0
        CalcData.dollarsOff = 0.0
        CalcData.discount = 0.0
        CalcData.otherDiscount = 0.0
        CalcData.tax = 0.0
        CalcData.discountPrice = 0.0
        CalcData.originalPrice = 0.0
        CalcData.saved = 0.0
    }
    
    
    // writing the little text at the bottom of the screen
    let text = "Swipe left to view graph"
    
    // allowing access to the shared instance
    let CalcData: DiscountCalc = DiscountCalc.shared
}
