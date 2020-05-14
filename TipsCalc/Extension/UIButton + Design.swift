//
//  UIButton + Design.swift
//  TipsCalc
//
//  Created by Dionte Silmon on 5/13/20.
//  Copyright © 2020 Dionte Silmon. All rights reserved.
//

import UIKit

extension UIButton {
    
    func designButtonBorder() {
        
        layer.cornerRadius = 30
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        layer.backgroundColor = UIColor.clear.cgColor
        
    }
    
}
