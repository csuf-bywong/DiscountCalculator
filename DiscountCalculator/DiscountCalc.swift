//
//  DiscountCalc.swift
//  DiscountCalculator
//
//  Created by Belinda Wong on 3/18/17.
//  Copyright © 2017 Belinda Wong. All rights reserved.
//

import Foundation

class DiscountCalc{
    
    // MARK: Properties
    var originalPrice:Float = 0.0
    var discount:Float = 0.0
    var discountPrice:Float = 0.0
    
    // MARK: Initializations
    init(_ discount:Float = 0.0){
        self.discount = discount
    }
    
    // MARK: Shared instance
    static let shared:DiscountCalc = DiscountCalc()
}
