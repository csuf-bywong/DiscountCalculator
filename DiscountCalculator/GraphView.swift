//
//  GraphView.swift
//  DiscountCalculator
//
//  Created by Belinda Wong on 3/18/17.
//  Copyright © 2017 Belinda Wong. All rights reserved.
//

import UIKit

// writes this for all of the contexts in the entire project
extension CGContext{
    func setFillColor(_ hex:Int){
        // Mask different values of the hex code
        // 0xFF0000 - Red
        // 0x00FF00 - Green
        // 0x0000FF - Blue
        
        // bit shifts this 16 places & masks it so we get the FF value
        // which gives us a value between 0 & 250
        // then divide it by 255 so we get a value between 0 & 1
        let  redColor:CGFloat = CGFloat((hex >> 16) & 0xFF) / 255.0
        let greenColor:CGFloat = CGFloat((hex >> 8 ) &  0xFF) / 255.0
        let blueColor:CGFloat = CGFloat(hex & 0xFF) / 255.0
        
        setFillColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1.0)
    }
}

class GraphView: UIView {
    let CalcData: DiscountCalc = DiscountCalc.shared
    
    override func draw(_ rect: CGRect){
        let context:CGContext = UIGraphicsGetCurrentContext()!
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let leftGuide:CGFloat = 16.0
        let topGuide:CGFloat = 64.0 + 16.0
        
        context.setFillColor(0x845160)
        context.fill(CGRect(x:leftGuide, y:topGuide, width:screenWidth - 32.0, height:screenHeight - 96.0))
        
        // Draw text
        let myText = "Cyan Box"
        let subText = "Baby blue..."
        
        // Text attributes
        let textAttributes = [
            NSFontAttributeName: UIFont(name: "Helvetica Bold", size: 16.0)!,
            NSForegroundColorAttributeName: UIColor(red: 1.0, green: 1.0, blue:1.0, alpha: 1.0)
        ]
        
        let myTextPos:CGPoint = CGPoint(x: leftGuide + 16.0, y: topGuide + 16.0)
        
        myText.draw(at: myTextPos, withAttributes: textAttributes)
        subText.draw(at: CGPoint(x: leftGuide + 16.0, y: topGuide + 32.0), withAttributes: textAttributes)
    }
}
