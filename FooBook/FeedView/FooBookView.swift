//
//  FooBookView.swift
//  FooBook
//
//  Created by Shankar B S on 01/03/20.
//  Copyright © 2020 Slicode. All rights reserved.
//

import Foundation
import UIKit

//In this calss we are creating the FeedView
//in code insted of xib file

enum ButtonIcon: String {
    case ellipsis = "ellipsis"
    case camera   = "camera"
    case thumb    = "hand.thumbsup.fill"
    case info     = "info.circle"
    case none     = ""
}

enum Anchor {
    case top(value: CGFloat)
    case left(value: CGFloat)
    case bottom(value: CGFloat)
    case right(value: CGFloat)
}


class FooBookView: UIView {
    
    
    var baseStackView: UIStackView! //Base stack view to hold the all the sections
    let leftStandardMargin: CGFloat = 20.0 // some standard left margin
    
    //UI components we need to update
    //Profile info
    var profileImageView: UIImageView?
    var nameLabel: UILabel?
    var dateLabel: UILabel?
    
    //Text Part
    var subTitleLabel: UILabel?
    
    //Image view part
    var feedImageView: UIImageView?
    
    //Comments view part
    var likeLabel: UILabel?
    var commentsLabel: UILabel?
    var sharesLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //1
        setupFeedUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //2
    func setupFeedUI() {
        //create base stack vertical view
        baseStackView = createStackView(of: .vertical, with: .fill, spacing: 0.0)
        self.addSubview(baseStackView)
        baseStackView.translatesAutoresizingMaskIntoConstraints = false
        pin(subView: baseStackView, to: self, topMargin: 0.0, leftMargin: 0.0, bottomMargin: 0.0, rightMargin: 0.0)
       
        //suggested for you
        setupSuggestedForYou()
        
        //seperator
        createSeperator()
        
        //Profile info view
        createProfileInfoView()
        
        //Text section
        createTextSection()
        
        //Image view
        createFeedImageViewSection()
        
        //Comments
        createCommentViewSection()
        
        //Seperator 2
        createSeperatorWithGap()
        
        //Actions
        createActionsViewSections()
    }
    
    //MARK: Data updaters
    func updateWith(feed: FeedModel) {
        profileImageView?.image = UIImage(named: feed.profileImageName)
        dateLabel?.text = feed.dateString
        nameLabel?.text = feed.name
        
        subTitleLabel?.text = feed.subTitle
        feedImageView?.image = UIImage(named: feed.feedImageName)
        
        likeLabel?.text = feed.likes
        commentsLabel?.text = feed.comments
        sharesLabel?.text = feed.shares
    }
    
    
    //Suggested For you section
    func setupSuggestedForYou() {
        //creating views
        let view = createEmptyView()
        let horizontalStackView = createStackView(of: .horizontal, with: .fill, spacing: 0.0)
        
        let textLabel = createLabel(with: .black, fontSize: 17.0)
        let eclipseButton = createButton(with: .clear, fontSize: 17.0, isBold: false, withIcon: .ellipsis)
        
        textLabel.text = "SUGGESTED FOR YOU"
        
        //adding to stack view
        horizontalStackView.addArrangedSubview(textLabel)
        horizontalStackView.addArrangedSubview(eclipseButton)
        
        view.addSubview(horizontalStackView)
        
        //adding constraints
        set(view: eclipseButton, withFixedHeight: 50)
        set(view: eclipseButton, withFixedWidth: 50)
        pin(subView: horizontalStackView, to: view, topMargin: 0.0, leftMargin: leftStandardMargin, bottomMargin: 0.0, rightMargin: 0.0)
        
        //Finally adding to base stack view.
        baseStackView.addArrangedSubview(view)
    }
    
    //MARK: Seperator
    func createSeperator() {
        //create a empty view
        let seperatorView = createEmptyView()
        seperatorView.backgroundColor = UIColor.gray
        baseStackView.addArrangedSubview(seperatorView)
        set(view: seperatorView, withFixedHeight: 1.0)
        pin(subView: seperatorView, to: baseStackView, withSide: [.left(value: 0.0), .right(value: 0.0)])
    }
    
    //MARK: Profile Info view
    func createProfileInfoView() {
        //this view is added to base stack view
        let profileHolderView = createEmptyView()
        
        //this stack view is holder for image and labels stack view
        let horizontalStackView = createStackView(of: .horizontal, with: .fill, spacing: 8.0)
        
        //1
        //create profile image part
        self.profileImageView = UIImageView()
        self.profileImageView?.translatesAutoresizingMaskIntoConstraints = false
        if let imageView = self.profileImageView {
            set(view: imageView, withFixedHeight: 68)
            set(view: imageView, withFixedWidth: 60)
            horizontalStackView.addArrangedSubview(imageView)
        }
        
        //2
        //create labels part
        let labelsHolderView = createEmptyView()
        let verticalStackView = createStackView(of: .vertical, with: .fillEqually, spacing: 0.0)
        self.nameLabel = createLabel(with: .black, fontSize: 20.0, isBold: true, allignment: .left)
        self.dateLabel = createLabel(with: .black, fontSize: 18, isBold: false, allignment: .left)
        
        self.nameLabel?.text = "name to set"
        self.dateLabel?.text = "date to set"
        
        if let aNameLabel = self.nameLabel, let aDateLabel = self.dateLabel {
            verticalStackView.addArrangedSubview(aNameLabel)
            verticalStackView.addArrangedSubview(aDateLabel)
        }
        labelsHolderView.addSubview(verticalStackView)
        pin(subView: verticalStackView, to: labelsHolderView, topMargin: 10, leftMargin: 10, bottomMargin: -10, rightMargin: 0)
        
        //3
        //finally add the labels holder view to horizontal stack view
        horizontalStackView.addArrangedSubview(labelsHolderView)
        profileHolderView.addSubview(horizontalStackView)
        pin(subView: horizontalStackView, to: profileHolderView, topMargin: 10, leftMargin: leftStandardMargin, bottomMargin: 0, rightMargin: 0)
        
        baseStackView.addArrangedSubview(profileHolderView)
    }
    
    //MARK: Text section of UI
    func createTextSection() {
        //1
        let textHolderView = createEmptyView()
        self.subTitleLabel = createLabel(with: .black, fontSize: 17, isBold: false, allignment: .natural)
        self.subTitleLabel?.text = "sub title text goes here"
        self.subTitleLabel?.numberOfLines = 0
        if let label = self.subTitleLabel {
            textHolderView.addSubview(label)
            pin(subView: label, to: textHolderView, topMargin: 5, leftMargin: leftStandardMargin, bottomMargin: 0, rightMargin: 0)
        }
        
        self.baseStackView.addArrangedSubview(textHolderView)
        
    }
    
    //MARK: Image section part
    func createFeedImageViewSection() {
        let imageHolderView = createEmptyView()
        self.feedImageView = UIImageView()
        self.feedImageView?.translatesAutoresizingMaskIntoConstraints = false
        if let feedImgView = self.feedImageView {
            set(view: feedImgView, withFixedHeight: 300)
            imageHolderView.addSubview(feedImgView)
            pin(subView: feedImgView, to: imageHolderView, topMargin: 0, leftMargin: leftStandardMargin, bottomMargin: 0, rightMargin: -leftStandardMargin)
        }
        self.baseStackView.addArrangedSubview(imageHolderView)
    }
    
    //MARK: Comments section
    func createCommentViewSection() {
        let commentsHolderView = createEmptyView()
        set(view: commentsHolderView, withFixedHeight: 55)
        
        let horizontalStackView = createStackView(of: .horizontal, with: .fillEqually, spacing: 0)
        
        
        self.likeLabel = createLabel(with: .black, fontSize: 17.0, isBold: false, allignment: .center)
        self.commentsLabel = createLabel(with: .orange, fontSize: 17.0, isBold: false, allignment: .center)
        self.sharesLabel = createLabel(with: .gray, fontSize: 17.0, isBold: false, allignment: .center)
        
        self.likeLabel?.text = "Likes count"
        self.commentsLabel?.text = "Comments count"
        self.sharesLabel?.text = "Shares count"
        
        if let likeLbl = self.likeLabel, let commentsLbl = self.commentsLabel, let sharesLbl = self.sharesLabel {
            horizontalStackView.addArrangedSubview(likeLbl)
            horizontalStackView.addArrangedSubview(commentsLbl)
            horizontalStackView.addArrangedSubview(sharesLbl)
            
            commentsHolderView.addSubview(horizontalStackView)
            pin(subView: horizontalStackView, to: commentsHolderView, topMargin: 0, leftMargin: 0, bottomMargin: 0, rightMargin: 0)
        }
        baseStackView.addArrangedSubview(commentsHolderView)
    }
    
    //MARK: Seperator Part two
    func createSeperatorWithGap() {
        let emptyView = createEmptyView()
        emptyView.backgroundColor = .lightGray
        baseStackView.addArrangedSubview(emptyView)
        set(view: emptyView, withFixedHeight: 1.0)
        pin(subView: emptyView, to: baseStackView, withSide: [.left(value: 20.0), .right(value: -20)])
        
    }
    
    //MARK: Actions part
    func createActionsViewSections() {
        let actionsHolderView = createEmptyView()
        set(view: actionsHolderView, withFixedHeight: 55)
        
        let horizontalStackView = createStackView(of: .horizontal, with: .fillEqually, spacing: 0)
        
        let captureButton = createButton(with: .black, fontSize: 17, isBold: true, withIcon: .camera)
        let likeButton = createButton(with: .black, fontSize: 17, isBold: true, withIcon: .thumb)
        let infoButton = createButton(with: .black, fontSize: 17, isBold: true, withIcon: .info)
        
        
        captureButton.setTitle("Capture", for: .normal)
        likeButton.setTitle("Like Me", for: .normal)
        infoButton.setTitle("Info", for: .normal)
        
        let titleInsects = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        captureButton.titleEdgeInsets = titleInsects
        likeButton.titleEdgeInsets = titleInsects
        infoButton.titleEdgeInsets = titleInsects
       
        horizontalStackView.addArrangedSubview(captureButton)
        horizontalStackView.addArrangedSubview(likeButton)
        horizontalStackView.addArrangedSubview(infoButton)
            
        actionsHolderView.addSubview(horizontalStackView)
        pin(subView: horizontalStackView, to: actionsHolderView, topMargin: 0, leftMargin: 0, bottomMargin: 0, rightMargin: 0)
        
        baseStackView.addArrangedSubview(actionsHolderView)
    }
    
    //MARK: Stack view Helpers
    func createStackView(of type:NSLayoutConstraint.Axis,   with distributon: UIStackView.Distribution, spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.distribution = distributon
        stackView.axis = type
        stackView.spacing = spacing
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    //MARK: Constraints helpers
    func pin(subView: UIView, to superView: UIView, topMargin: CGFloat = 0.0, leftMargin: CGFloat = 0.0, bottomMargin: CGFloat = 0.0, rightMargin: CGFloat = 0.0) {
        subView.topAnchor.constraint(equalTo: superView.topAnchor , constant: topMargin).isActive = true
        subView.leftAnchor.constraint(equalTo: superView.leftAnchor, constant: leftMargin).isActive = true
        subView.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: bottomMargin).isActive = true
        subView.rightAnchor.constraint(equalTo: superView.rightAnchor, constant: rightMargin).isActive = true
    }
    
    //MARK: This will add given constraints with values
    func pin(subView: UIView, to superView: UIView, withSide anchors:[Anchor]) {
        for anchor in anchors {
            switch anchor {
            case .top(let value):
                subView.topAnchor.constraint(equalTo: superView.topAnchor , constant: value).isActive = true
            case .left(let value):
                subView.leftAnchor.constraint(equalTo: superView.leftAnchor, constant: value).isActive = true
            case .bottom(let value):
                subView.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: value).isActive = true
            case .right(let value):
                subView.rightAnchor.constraint(equalTo: superView.rightAnchor, constant: value).isActive = true
                
            }
        }
    }
    
    
    func set(view: UIView, withFixedWidth width: CGFloat) {
        view.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func set(view: UIView, withFixedHeight height: CGFloat) {
        view.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    //MARK: UI helpers
    func createLabel(with textColor: UIColor, fontSize: CGFloat, isBold: Bool = false, allignment: NSTextAlignment = .left) -> UILabel {
        let label = UILabel()
        let font = isBold ? UIFont.boldSystemFont(ofSize: fontSize) : UIFont.systemFont(ofSize: fontSize)
        label.textColor = textColor
        label.font = font
        label.textAlignment = allignment
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func createButton(with textColor: UIColor, fontSize: CGFloat, isBold: Bool = false, withIcon icon: ButtonIcon = .none) -> UIButton {
        let button = UIButton()
        button.setTitleColor(textColor, for: .normal)
        button.titleLabel?.font = isBold ? UIFont.boldSystemFont(ofSize: fontSize) : UIFont.systemFont(ofSize: fontSize)
        button.titleLabel?.textColor = textColor
        button.setImage(UIImage(systemName: icon.rawValue), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    func createEmptyView() -> UIView {
        let emptyView = UIView()
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        return emptyView
    }
    
}
