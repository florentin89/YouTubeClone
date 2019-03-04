//
//  VideoCell.swift
//  YouTubeClone
//
//  Created by Florentin on 20/02/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        
    }
}

// Customize the video Cell
class VideoCell: BaseCell {
    
    var video: Video? {
        
        didSet{
            titleLabel.text = video?.title
            
            setupThumbnailImage()
            setupProfileImage()
            
            if let channelName = video?.channel?.name, let numberOfViews = video?.numberOfViews {
                
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                
                let subtitleText = "\(channelName) • \(numberFormatter.string(from: numberOfViews)!) • 9  years ago"
                subtitleTextView.text = subtitleText
                
            }
            
            //measure title text
            if let title = video?.title {
                let size = CGSize(width: frame.width - 16 - 44 - 8 - 16,height: 1000)
                let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
                let estimatedRect = NSString(string: title).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
                
                if estimatedRect.size.height > 20 {
                    titleLabelHeightConstraint?.constant = 44
                } else {
                    titleLabelHeightConstraint?.constant = 20
                }
            }
        }
    }
    
    func setupProfileImage(){
        if let profileImageURL = video?.channel?.profileImageName {
            userProfileImageView.loadImageFromURL(urlString: profileImageURL)
        }
    }
    
    func setupThumbnailImage(){
        if let thumbnailImageURL = video?.thumbnailImageName {
            thumbnnailImageView.loadImageFromURL(urlString: thumbnailImageURL)
        }
    }
    
    let thumbnnailImageView: CustomImageView = {
        
        let imageView = CustomImageView()
        imageView.backgroundColor = UIColor.white
        imageView.image = UIImage(named: "crazy_frog_axel_f")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let userProfileImageView: CustomImageView = {
        
        let imageView = CustomImageView()
        imageView.backgroundColor = UIColor.white
        imageView.image = UIImage(named: "crazy_frog_profile_picture")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 22 // to make the avatar bound
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    let titleLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Katy Perry - Roar"
        label.numberOfLines = 0
        return label
    }()
    
    let subtitleTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Katy Perry • 2,755,418,109 views • 5 years ago"
        textView.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return textView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return view
    }()
    
    var titleLabelHeightConstraint: NSLayoutConstraint?
    
    override func setupViews(){
        addSubview(thumbnnailImageView)
        addSubview(separatorView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        
        // Horizontal constraints for app
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnnailImageView) // 16 pxl from left and 16 from right
        addConstraintsWithFormat(format: "H:|-16-[v0(44)]", views: userProfileImageView)
        
        // Vertical constraints for app
        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-36-[v2(1)]|", views: thumbnnailImageView, userProfileImageView, separatorView) // 16 pxl from top, 8 pxl to avatar, 44 pxl the avatar, 36 pxl from avatar to separator line, 1 pxl the separator line
        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
        
        
        // Top constraint for Title
        addConstraints([NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnnailImageView, attribute: .bottom, multiplier: 1, constant: 4)])
        
        // Left constraint for Title
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        
        // Right connstraint for Title
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnnailImageView, attribute: .right, multiplier: 1, constant: 0))
        
        // Height constraint for Title
        titleLabelHeightConstraint = NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 44)
        addConstraint(titleLabelHeightConstraint!)
        
        
        // Top constraint for SubTitle
        addConstraints([NSLayoutConstraint(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 8)])
        
        // Left constraint for SubTitle
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 4))
        
        // Right connstraint for SubTitle
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .right, relatedBy: .equal, toItem: thumbnnailImageView, attribute: .right, multiplier: 1, constant: 0))
        
        // Height constraint for SubTitle
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
        
    }
}
