//
//  TermsAndPrivacy.swift
//  YouTubeClone
//
//  Created by Florentin on 09/03/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import UIKit

class TermsAndPrivacyController: UIViewController {
    
    var termsAndPrivacyView: TermsAndPrivacyView {return self.view as! TermsAndPrivacyView}
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        self.view = TermsAndPrivacyView(frame: UIScreen.main.bounds)
    }
}

class TermsAndPrivacyView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        self.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(Constants.fatalErrorInit)
    }
    
    func setupViews(){
        
        self.addSubview(termsAndPrivacyTextView)
    }
    
    func setupConstraints(){
        
        setupTermsTextViewConstraints()
    }
    
    fileprivate func setupTermsTextViewConstraints(){
    
        termsAndPrivacyTextView.translatesAutoresizingMaskIntoConstraints = false
        termsAndPrivacyTextView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        termsAndPrivacyTextView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        termsAndPrivacyTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        termsAndPrivacyTextView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 10).isActive = true
    }
    
    let termsAndPrivacyTextView: UITextView = {
        
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = Constants.termsAndPrivacyText
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        view.font = UIFont.boldSystemFont(ofSize: 24)
        view.textAlignment = .center
        view.isEditable = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.isSelectable = true

        return view
    }()
}
