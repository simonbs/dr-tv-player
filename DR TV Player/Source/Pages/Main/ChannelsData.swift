//
//  ChannelsData.swift
//  DR TV Player
//
//  Created by Simon Støvring on 27/02/2016.
//  Copyright © 2016 SimonBS. All rights reserved.
//

import Foundation
import AppKit

/**
 *  Representation of a channel that can be played.
 */
class Channel {
    /// Channel logo.
    let image: NSImage
    /// URL to be played.
    let url: NSURL
    
    init(image: NSImage, url: NSURL) {
        self.image = image
        self.url = url
    }
}

/// Manages the available channels.
class ChannelsData: NSObject, NSCollectionViewDataSource, NSCollectionViewDelegate, NSCollectionViewDelegateFlowLayout {
    /// Identifier for the channel item.
    private static let ItemIdentifier = "Channel"
    /// Attached collection view.
    private weak var collectionView: NSCollectionView?
    
    /// Channels to be displayed in the collection view.
    /// Automatically reloads the collection view when set.
    var channels: [Channel] = [] {
        didSet { collectionView?.reloadData() }
    }
    
    /// Called when a channel was selected.
    var didSelectChannel: (Channel -> Void)?
    
    /**
     Attaches the data to a collection view, thus performing any necessary
     configuration on the collection view.
     
     - parameter collectionView: Collection view do attach.
     */
    func attachToCollectionView(collectionView: NSCollectionView) {
        self.collectionView = collectionView
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerClass(ChannelCollectionViewItem.self, forItemWithIdentifier: ChannelsData.ItemIdentifier)
    }
    
    func collectionView(collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return channels.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: NSCollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: NSCollectionView, itemForRepresentedObjectAtIndexPath indexPath: NSIndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItemWithIdentifier(ChannelsData.ItemIdentifier, forIndexPath: indexPath)
        item.representedObject = channels[indexPath.item]
        return item
    }
    
    func collectionView(collectionView: NSCollectionView, willDisplayItem item: NSCollectionViewItem, forRepresentedObjectAtIndexPath indexPath: NSIndexPath) {
        guard let item = item as? ChannelCollectionViewItem else { return }
        item.contentView.imageView.image = channels[indexPath.item].image
    }
    
    func collectionView(collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> NSSize {
        return NSSize(width: collectionView.frame.width / CGFloat(channels.count), height: collectionView.bounds.height)
    }
    
    func collectionView(collectionView: NSCollectionView, didSelectItemsAtIndexPaths indexPaths: Set<NSIndexPath>) {
        if let indexPath = indexPaths.first {
            didSelectChannel?(channels[indexPath.item])
        }
    }
}