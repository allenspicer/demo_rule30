//
//  ColorPickerView.swift
//  Demo_Rule30
//
//  Created by Allen Spicer on 5/3/18.
//  Copyright © 2018 rule30Demo. All rights reserved.
//

import UIKit

@objc protocol colorDelegate{
    @objc optional func setColors(color:UIColor)
}

class ColorPickerView: UIView {
    var currentSelectionX: CGFloat = 0;
    var selectedColor: UIColor!
    var delegate: colorDelegate!
    
    override func draw(_ rect: CGRect) {
        UIColor.black.set()
        var tempYPlace = self.currentSelectionX;
        
        //if user selects outside of bounds we use edge value
        if (tempYPlace < CGFloat (0.0)) {
            tempYPlace = CGFloat (0.0);
        } else if (tempYPlace >= self.frame.size.width) {
            tempYPlace = self.frame.size.width - 1.0;
        }
        
        // fill the view with color of hue proportaional to location
        let width = Int(self.frame.size.width)
        for i in 0 ..< width {
            UIColor(hue:CGFloat (i)/self.frame.size.width, saturation: 1.0, brightness: 1.0, alpha: 1.0).set()
            let temp = CGRect(x:CGFloat(i), y:0, width:50.0, height:self.frame.size.height);
            UIRectFill(temp);
        }
    }
    
    
    func updateColor(touch: UITouch){
        //get color at x coordinate location of touch
        currentSelectionX = (touch.location(in: self).x)
        selectedColor = UIColor(hue: (currentSelectionX / self.frame.size.width), saturation: 1.0, brightness: 1.0, alpha: 1.0)
        if let delegate = self.delegate {
            delegate.setColors!(color: selectedColor)
            self.setNeedsDisplay()
        }
    }
}


extension ColorPickerView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch =  touches.first
        updateColor(touch: touch!)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch =  touches.first
        updateColor(touch: touch!)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch =  touches.first
        updateColor(touch: touch!)
    }
}

