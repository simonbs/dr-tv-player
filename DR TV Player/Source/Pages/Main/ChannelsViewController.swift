//
//  ChannelsViewController.swift
//  DR TV Player
//
//  Created by Simon Støvring on 27/02/2016.
//  Copyright © 2016 SimonBS. All rights reserved.
//

import Foundation
import AppKit

/// Manages the channels menu
class ChannelsViewController: ViewController<ChannelsView> {
    /// Data attached to the collection view in the content view.
    /// Manages the channels.
    let data = ChannelsData()
    
    override init() {
        super.init()
        data.channels = [
            Channel(image: NSImage(named: "dr1")!, url: NSURL(string: "http://dr01-lh.akamaihd.net/i/dr01_0@147054/master.m3u8?b=100-2000")!),
            Channel(image: NSImage(named: "dr2")!, url: NSURL(string: "http://dr02-lh.akamaihd.net/i/dr02_0@147055/master.m3u8?b=100-2000")!),
            Channel(image: NSImage(named: "dr3")!, url: NSURL(string: "http://dr03-lh.akamaihd.net/i/dr03_0@147056/master.m3u8")!),
            Channel(image: NSImage(named: "drk")!, url: NSURL(string: "http://dr04-lh.akamaihd.net/i/dr04_0@147057/master.m3u8?b=100-1600")!),
            Channel(image: NSImage(named: "ultra")!, url: NSURL(string: "http://dr06-lh.akamaihd.net/i/dr06_0@147059/master.m3u8?b=100-1600")!),
            Channel(image: NSImage(named: "ramasjang")!, url: NSURL(string: "http://dr05-lh.akamaihd.net/i/dr05_0@147058/master.m3u8?b=100-1600")!)
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data.attachToCollectionView(contentView.collectionView)
    }
    
    override func viewDidLayout() {
        super.viewDidLayout()
        contentView.collectionView.layout.invalidateLayout()
    }
}