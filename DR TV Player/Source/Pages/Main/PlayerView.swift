//
//  PlayerView.swift
//  DR TV Player
//
//  Created by Simon Støvring on 27/02/2016.
//  Copyright © 2016 SimonBS. All rights reserved.
//

import Foundation
import AppKit
import SnapKit
import AVKit

/// Contains the player.
class PlayerView: View {
    let playerView = AVPlayerView()
    
    override func setup() {
        super.setup()
        addSubview(playerView)
        playerView.snp_makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
        NSColor.redColor().setFill()
        NSRectFill(dirtyRect)
    }
}