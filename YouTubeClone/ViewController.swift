//
//  ViewController.swift
//  YouTubeClone
//
//  Created by Florentin on 18/02/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        collectionView.backgroundColor = UIColor.white
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: "cellID")
    }
    
    // Set the number of videos in the list
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    // Set the properties of each video cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
        
        return cell
    }
    
    // Set the space of each cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // Set the size for each Video Cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 200)
    }
    
}

// Customize the video Cell
class VideoCell: UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let thumbnnailImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        imageView.image = UIImage(named: "crazy_frog_axel_f")
        
        
        return imageView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        return view
    }()
    
    let userProfileImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.green
        return imageView
    }()
    
    let titleLabel: UILabel = {
        
        let label = UILabel()
        label.backgroundColor = UIColor.purple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitleTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.red
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    func setupViews(){
        addSubview(thumbnnailImageView)
        addSubview(separatorView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        
        // Horizontal constraints
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnnailImageView) // 16 pxl from left and 16 from right
        addConstraintsWithFormat(format: "H:|-16-[v0(44)]", views: userProfileImageView)
        
        // Vertical constraints
        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnnailImageView, userProfileImageView, separatorView) // 16 pxl left and 16 right and will be 1 pixel tall: [v2(1)]
        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
        
        
        // Top constraint for Title
        addConstraints([NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnnailImageView, attribute: .bottom, multiplier: 1, constant: 8)])
        
        // Left constraint for Title
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        
        // Right connstraint for Title
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnnailImageView, attribute: .right, multiplier: 1, constant: 0))
        
        // Height constraint for Title
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        
        
        // Top constraint for SubTitle
        addConstraints([NSLayoutConstraint(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 8)])
        
        // Left constraint for SubTitle
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        
        // Right connstraint for SubTitle
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .right, relatedBy: .equal, toItem: thumbnnailImageView, attribute: .right, multiplier: 1, constant: 0))
        
        // Height constraint for SubTitle
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIView{
    func addConstraintsWithFormat(format: String, views: UIView...){ // 2 param: one string and one array of UIViews
        
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
