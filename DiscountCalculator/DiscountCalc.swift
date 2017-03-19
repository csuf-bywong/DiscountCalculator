//
//  DiscountCalc.swift
//  MVC-Example
//
//  Created by Belinda Wong on 3/13/17.
//  Copyright © 2017 Belinda Wong. All rights reserved.
//  The model for the two views to access
//  All variables and their values will be stored here to access and use


import Foundation

// Make a class for the singleton
class DiscountCalc
{
    
    // MARK: Properties
    var price:Float = 0.0
    var dollarsOff:Float = 0.0
    var discount:Float = 0.0
    var otherDiscount:Float = 0.0
    var tax:Float = 0.0
    var originalPrice:Float = 0.0
    var discountPrice:Float = 0.0
    var saved:Float = 0.0
    
    // MARK: Initialization
    init(_ price:Float = 0.0, _ dollarsOff:Float = 0.0, _ discount:Float = 0.0, _ otherDiscount:Float = 0.0, _ tax:Float = 0.0)
    {
        self.price = price
        self.dollarsOff = dollarsOff
        self.discount = discount
        self.otherDiscount = otherDiscount
        self.tax = tax
        setOriginalPrice()
        setDiscountPrice()
        setSaved()
    }
    
    // MARK: setters
    func setOriginalPrice() {
        self.originalPrice = self.price * (self.tax / 100) + self.price
    }
    
    func setDiscountPrice() {
        self.discountPrice = price - ( price * (discount / 100) + price * (otherDiscount / 100)) + (price * (tax / 100 ))
    }
    
    func setSaved() {
        self.saved = originalPrice - discountPrice
    }
    func getOriginalPrice() -> Float {
        return originalPrice
    }
    
    // MARK: Shared instance
    static let shared:DiscountCalc = DiscountCalc()
}
