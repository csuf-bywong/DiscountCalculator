//
//  ResultsViewController.swift
//  DiscountCalculator
//
//  Created by Belinda Wong on 3/18/17.
//  Copyright © 2017 Belinda Wong. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add Swipe Right Gesture
        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        view.addGestureRecognizer(swipeRight)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be received.
    }
    
    // Swipe function
    func handleSwipe(_ sender:UIGestureRecognizer){
        self.performSegue(withIdentifier: "unwindToCalc" , sender: self)
    }
}
