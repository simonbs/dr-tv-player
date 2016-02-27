//
//  PlayerViewController.swift
//  DR TV Player
//
//  Created by Simon Støvring on 27/02/2016.
//  Copyright © 2016 SimonBS. All rights reserved.
//

import Foundation
import AppKit
import AVKit
import AVFoundation

/// Manages the player.
class PlayerViewController: ViewController<PlayerView> {
    private let player = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.playerView.player = player
    }
    
    func playURL(url: NSURL) {
        let playerItem = AVPlayerItem(URL: url)
        player.replaceCurrentItemWithPlayerItem(playerItem)
        player.play()
    }
}