//
//  GradientColor.swift
//  Simple Tip
//
//  Created by Jeremy Evans on 11/20/15.
//  Copyright © 2015 Jeremy Evans. All rights reserved.
//

import Foundation
import UIKit

class GradientColor {
    
    let topColor = UIColor(red: 41/255, green: 128/255, blue: 185/255, alpha: 1.0).CGColor
    let bottomColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0).CGColor
    
    let gl: CAGradientLayer
    
    init() {
        gl = CAGradientLayer()
        gl.colors = [ topColor, bottomColor]
        gl.locations = [ 0.0, 1.0]
    }
    
}