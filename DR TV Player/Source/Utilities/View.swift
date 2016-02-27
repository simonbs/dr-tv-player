//
//  View.swift
//  DR TV Player
//
//  Created by Simon Støvring on 27/02/2016.
//  Copyright © 2016 SimonBS. All rights reserved.
//

import Foundation
import AppKit
import SnapKit

/// Use in order to remove boilerplate when instantiating a NSView.
class View: NSView {
    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    /**
     Override to setup views, e.g. adding them to the view
     and setting up constriants.
     */
    func setup() { }

    /**
     Helper method to add a view to a container view.
     Automatically removes previous views in the container view
     and lays out the content view in the container view.
     Useful when a view has containers which each contain a view from
     another view controller.
     
     - parameter contentView:     Content view added to the container view.
     - parameter toContainerView: View that should contain the content view.
     */
    func addView(contentView: NSView, toContainerView containerView: NSView) {
        containerView.subviews.forEach { $0.removeFromSuperview() }
        containerView.addSubview(contentView)
        contentView.snp_makeConstraints { make in
            make.edges.equalTo(containerView)
        }
    }
}