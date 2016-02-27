//
//  MainViewController.swift
//  DR TV Player
//
//  Created by Simon Støvring on 27/02/2016.
//  Copyright © 2016 SimonBS. All rights reserved.
//

import Foundation
import AppKit

/// Handles communication between the channels menu and the player.
class MainViewController: ViewController<MainView> {
    /// Controller displaying and managing the channels menu.
    private let channelsController = ChannelsViewController()
    /// Controller displaying and managing the player.
    private let playerController = PlayerViewController()
    
    override init() {
        super.init()
        title = NSRunningApplication.currentApplication().localizedName
        channelsController.data.didSelectChannel = { [weak self] in self?.playChannel($0) }
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "willEnterFullScreen:", name: NSWindowWillEnterFullScreenNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "willExitFullScreen:", name: NSWindowWillExitFullScreenNotification, object: nil)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func loadView() {
        view = MainView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewController(channelsController)
        addChildViewController(playerController)
        
        contentView.addChannelsView(channelsController.contentView)
        contentView.addPlayerView(playerController.contentView)
        
        selectAndPlayFirstChannel()
    }
    
    /**
     Finds the first available channel, selects it and starts playback.
     */
    private func selectAndPlayFirstChannel() {
        if let channel = channelsController.data.channels.first {
            let indexPath = NSIndexPath(forItem: 0, inSection: 0)
            channelsController.contentView.collectionView.selectItemsAtIndexPaths([ indexPath ], scrollPosition: .None)
            playChannel(channel)
        }
    }
    
    /**
     Plays the specified channel.
     
     - parameter channel: Channel to play.
     */
    private func playChannel(channel: Channel) {
        playerController.playURL(channel.url)
    }
    
    /**
     Invoked when the window will enter the full screen.
     
     - parameter notification: Received notification.
     */
    dynamic private func willEnterFullScreen(notification: NSNotification) {
        contentView.hideChannels()
    }
    
    /**
     Invoked when the window will exit the full screen.
     
     - parameter notification: Received notification.
     */
    dynamic private func willExitFullScreen(notification: NSNotification) {
        contentView.showChannels()
    }
}