//
//  FooBookTableCell.swift
//  FooBook
//
//  Created by Shankar B S on 09/02/20.
//  Copyright © 2020 Slicode. All rights reserved.
//

import Foundation
import UIKit

class FooBookTableCell: UITableViewCell {
    private var fooBookView: FooBookView?
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        setupSubView()
        setupConstraints()
    }
    
    private func setupSubView() {
        fooBookView = FooBookView()
        if let feedView = fooBookView {
            feedView.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(feedView)
        }
        
    }
    
    private func setupConstraints() {
        if let feedView = fooBookView {
            feedView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            feedView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
            feedView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
            feedView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        }
    }
    
    public func updateCellWith(feed: FeedModel) {
        fooBookView?.updateWith(feed: feed)
    }
}
