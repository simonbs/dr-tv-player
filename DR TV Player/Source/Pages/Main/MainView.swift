//
//  Mainv.swift
//  DR TV Player
//
//  Created by Simon Støvring on 27/02/2016.
//  Copyright © 2016 SimonBS. All rights reserved.
//

import Foundation
import AppKit
import SnapKit

/// Main view. Presented when the application is opened.
class MainView: View {
    /// Height of the channels menu
    private static let ChannelsMenuHeight: CGFloat = 80
    /// Minimum width of the player
    private static let MinimumPlayerWidth: CGFloat = 720
    
    /// View containing the channels content view.
    private let channelsContainerView = NSView()
    /// View containing the player content view.
    private let playerContainerView = NSView()
    
    /// Height constraint of the player container.
    private var playerContainerHeightConstraint: Constraint?
    
    override func setup() {
        super.setup()
        
        channelsContainerView.layer?.backgroundColor = NSColor.drTvPlayerBackgroundColor().CGColor

        addSubview(channelsContainerView)
        addSubview(playerContainerView)
        
        channelsContainerView.snp_makeConstraints { make in
            make.top.equalTo(self)
            make.leading.equalTo(self)
            make.trailing.equalTo(self)
            make.height.equalTo(MainView.ChannelsMenuHeight)
        }
        
        playerContainerView.snp_makeConstraints { make in
            make.top.equalTo(self).offset(MainView.ChannelsMenuHeight)
            make.leading.equalTo(self)
            make.trailing.equalTo(self)
            make.bottom.equalTo(self)
            make.width.greaterThanOrEqualTo(MainView.MinimumPlayerWidth)
            playerContainerHeightConstraint = make.height.equalTo(playerContainerView.snp_width).multipliedBy(0.5625).constraint // 9 / 16 = 9.5625
        }
    }
    
    /**
     Shows the channels menu.
     */
    func showChannels() {
        channelsContainerView.hidden = false
        playerContainerHeightConstraint?.install()
        playerContainerView.snp_updateConstraints { make in
            make.top.equalTo(self).offset(MainView.ChannelsMenuHeight)
        }
    }
    
    /**
     Hides the channels menu.
     */
    func hideChannels() {
        channelsContainerView.hidden = true
        playerContainerHeightConstraint?.uninstall()
        playerContainerView.snp_updateConstraints { make in
            make.top.equalTo(self)
        }
    }
    
    /**
     Add and layout the channels menu view.
     
     - parameter view: Channels menu view.
     */
    func addChannelsView(view: NSView) {
        addView(view, toContainerView: channelsContainerView)
    }
    
    /**
     Add and layout the player view.
     
     - parameter view: Player view.
     */
    func addPlayerView(view: NSView) {
        addView(view, toContainerView: playerContainerView)
    }
}