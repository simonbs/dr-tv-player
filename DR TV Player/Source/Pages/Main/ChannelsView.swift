//
//  ChannelsView.swift
//  DR TV Player
//
//  Created by Simon Støvring on 27/02/2016.
//  Copyright © 2016 SimonBS. All rights reserved.
//

import Foundation
import AppKit
import SnapKit

/// Contains channels menu items
class ChannelsView: View {
    private let scrollView = DisabledScrollView()    
    let collectionView = CollectionView<NSCollectionViewFlowLayout>()
    
    override func setup() {
        super.setup()
        
        scrollView.documentView = collectionView
        
        collectionView.backgroundColor = .drTvPlayerBackgroundColor()
        collectionView.selectable = true
        collectionView.disableKeyboardCommands = true
        collectionView.layout.scrollDirection = .Horizontal
        collectionView.layout.minimumInteritemSpacing = 0
        collectionView.layout.minimumLineSpacing = 0
        collectionView.layout.sectionInset = NSEdgeInsetsZero
        
        addSubview(scrollView)
    
        scrollView.snp_makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        collectionView.snp_makeConstraints { make in
            make.edges.equalTo(scrollView)
        }
    }
}