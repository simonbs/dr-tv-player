//
//  CollectionView.swift
//  DR TV Player
//
//  Created by Simon Støvring on 27/02/2016.
//  Copyright © 2016 SimonBS. All rights reserved.
//

import Foundation
import AppKit

/// Use in order to remove boilerplate when instantiating a NSViewController.
/// Automatically sets the collection view layout and provides a layout property
/// that returns the collection view layout casted to the correct type.
class CollectionView<Layout: NSCollectionViewLayout>: NSCollectionView {
    /// Background color of the collection view.
    var backgroundColor: NSColor?
    
    // Whether or not the keyboard should ignore keyboard commands.
    var disableKeyboardCommands = false
    
    /// Collection view layout set during instantiation.
    var layout: Layout {
        return collectionViewLayout as! Layout
    }
    
    init() {
        super.init(frame: .zero)
        collectionViewLayout = Layout()
    }
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
        
        if let backgroundColor = backgroundColor {
            backgroundColor.setFill()
            NSRectFill(dirtyRect)
        }
    }
    
    override func keyDown(theEvent: NSEvent) {
        if !disableKeyboardCommands {
            super.keyDown(theEvent)
        }
    }
    
    override func keyUp(theEvent: NSEvent) {
        if !disableKeyboardCommands {
            super.keyUp(theEvent)
        }
    }
}