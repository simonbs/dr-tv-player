//
//  DisabledScrollView.swift
//  DR TV Player
//
//  Created by Simon Støvring on 27/02/2016.
//  Copyright © 2016 SimonBS. All rights reserved.
//

import Foundation
import AppKitScripting

/// Scroll view which cannot be scrolled.
class DisabledScrollView: NSScrollView {
    override func scrollWheel(theEvent: NSEvent) { }
}