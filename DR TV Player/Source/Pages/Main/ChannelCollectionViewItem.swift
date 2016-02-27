//
//  ChannelCollectionViewItem.swift
//  DR TV Player
//
//  Created by Simon Støvring on 27/02/2016.
//  Copyright © 2016 SimonBS. All rights reserved.
//

import Foundation
import AppKit
import SnapKit

class ChannelCollectionViewItemView: View {
    let imageView = NSImageView()
    var selected = false {
        didSet {
            needsDisplay = true
            displayIfNeeded()
        }
    }
    
    override func setup() {
        super.setup()
        addSubview(imageView)
        imageView.snp_makeConstraints { make in
            make.center.equalTo(self)
        }
    }
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
        
        let backgroundColor: NSColor = selected ? .drTvPlayerLightBackgroundColor() : .drTvPlayerBackgroundColor()
        backgroundColor.setFill()
        NSRectFill(dirtyRect)
    }
}

class ChannelCollectionViewItem: CollectionViewItem<ChannelCollectionViewItemView> {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var selected: Bool {
        didSet { contentView.selected = selected }
    }
}