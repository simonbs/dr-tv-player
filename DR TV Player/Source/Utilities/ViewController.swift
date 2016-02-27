//
//  ViewController.swift
//  DR TV Player
//
//  Created by Simon Støvring on 27/02/2016.
//  Copyright © 2016 SimonBS. All rights reserved.
//

import Foundation
import AppKit

/// Use in order to remove boilerplate when instantiating a NSViewController.
/// Automatically sets the view and provides a contentView that returns the
/// view casted to the correct type.
class ViewController<View: NSView>: NSViewController {
    /// View instantiated in loadView.
    var contentView: View {
        return view as! View
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)!
    }
    
    override func loadView() {
        view = View()
    }
}