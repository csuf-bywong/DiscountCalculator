//
//  GraphView.swift
//  MVC-Example
//
//  Created by Belinda Wong on 3/6/17.
//  Copyright © 2017 Belinda Wong. All rights reserved.
//

import UIKit

// writes this for all of the contexts in the entire project
extension CGContext
{
    func setFillColor(_ hex:Int)
    {
        // Mask different values of the hex code
        // 0xFF0000 - Red
        // 0x00FF00 - Green
        // 0x0000FF - Blue
        
        // bit shifts this 16 places & masks it so we get the FF value
        // which gives us a value between 0 and 255
        // then divide it by 255 so we get a value between 0 and 1
        let redColor:CGFloat = CGFloat((hex >> 16) & 0xFF) / 255.0
        let greenColor:CGFloat = CGFloat((hex >> 8) & 0xFF) / 255.0
        let blueColor:CGFloat = CGFloat(hex & 0xFF) / 255.0
        
        setFillColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1.0)
    }
}

class GraphView: UIView
{
    
    // this is the singleton
    let CalcData: DiscountCalc = DiscountCalc.shared
    var discount = DiscountCalc.shared.discount
    
    override func draw(_ rect: CGRect)
    {
        // grabbed the context
        // the ! unwraps the optional value
        let context:CGContext = UIGraphicsGetCurrentContext()!
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let leftGuide:CGFloat = 16.0
        let rightGuide:CGFloat = screenWidth - 16.0
        let topGuide:CGFloat = 64.0 + 16.0 // 80.0
        //let botGuide:CGFloat = screenHeight - 16.0
        
        
        // Text attributes
        let textAttributes = [
            NSFontAttributeName: UIFont(name: "Helvetica Bold", size: 16.0)!,
            NSForegroundColorAttributeName: UIColor(red: 1.0, green: 1.0, blue:1.0, alpha: 1.0)
        ]
        
        
        // draw the rectangle for how much you saved
        let percent1 = CGFloat(CalcData.saved / CalcData.originalPrice)
        context.setFillColor(0xa0ffab)
        context.fill(CGRect(x:rightGuide / 2 + 16, y:topGuide, width:rightGuide / 2 - 16, height:(screenHeight - 96.0)*percent1))
        
        // write the content inside the rectangle
        let saved = "You saved"
        let saved2 = String(CalcData.saved)
        let saved3 = String(CalcData.saved / CalcData.originalPrice)
        saved.draw(at:CGPoint(x:rightGuide / 2 + 32, y:topGuide + 16), withAttributes: textAttributes)
        saved2.draw(at:CGPoint(x:rightGuide / 2 + 32, y:topGuide + 32) , withAttributes: textAttributes)
        saved3.draw(at:CGPoint(x:rightGuide / 2 + 32, y:topGuide + 48) , withAttributes: textAttributes)
        
        // draw the rectangle for what you pay
        let percent2 = CGFloat(CalcData.discountPrice / CalcData.originalPrice)
        context.setFillColor(0x84b1ff)
        context.fill(CGRect(x: rightGuide / 2 + 16, y: topGuide + (screenHeight - 96.0)*0.25, width: rightGuide / 2 - 16, height: (screenHeight - 96.0)*percent2))
        
        // write the content inside the rectangle
        let pay = "You Pay"
        let pay2 = String(CalcData.discountPrice)
        let pay3 = String(CalcData.discountPrice / CalcData.originalPrice)
        pay.draw(at:CGPoint(x: rightGuide / 2 + 32, y: (topGuide + (screenHeight - 96.0) * 0.25 + 16.0)), withAttributes: textAttributes)
        pay2.draw(at:CGPoint(x: rightGuide / 2 + 32, y: (topGuide + (screenHeight - 96) * 0.25 + 32)), withAttributes: textAttributes)
        pay3.draw(at:CGPoint(x: rightGuide / 2 + 32, y: (topGuide + (screenHeight - 96) * 0.25 + 48)), withAttributes: textAttributes)
        
        
        // draw the rectangle for original price
        context.setFillColor(0xfda66b)
        context.fill(CGRect(x:leftGuide, y:topGuide, width:(rightGuide / 2), height:(screenHeight - 96.0)*(percent1 + percent2)))
        // write the content inside the rectangle
        let oPrice = "Original Price"
        let oPrice2 = String(CalcData.originalPrice)
        oPrice.draw(at:CGPoint(x: leftGuide + 16, y: topGuide + 16), withAttributes: textAttributes)
        oPrice2.draw(at:CGPoint(x: leftGuide + 16, y: topGuide + 32), withAttributes: textAttributes)
    }
}
