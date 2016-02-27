//
//  Colors.swift
//  DR TV Player
//
//  Created by Simon Støvring on 27/02/2016.
//  Copyright © 2016 SimonBS. All rights reserved.
//

import Foundation
import AppKit

extension NSColor {
    static func drTvPlayerBackgroundColor() -> NSColor {
        return NSColor(hex: 0x262626)
    }
    
    static func drTvPlayerLightBackgroundColor() -> NSColor {
        return NSColor(hex: 0x4d4d4d)
    }
}

extension NSColor {
    convenience init(hex: Int, alpha: Float = 1) {
        self.init(
            red: CGFloat((hex >> 16) & 0xff) / 255.0,
            green: CGFloat((hex >> 8) & 0xff) / 255.0,
            blue: CGFloat(hex & 0xff) / 255.0,
            alpha: CGFloat(alpha))
    }
}