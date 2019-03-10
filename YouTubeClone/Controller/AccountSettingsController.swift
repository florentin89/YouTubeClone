//
//  AccountSettingsController.swift
//  YouTubeClone
//
//  Created by Florentin on 09/03/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import UIKit

class AccountSettingsController: UIViewController {
    
    var accountSettingsView: AccountSettingsView { return self.view as! AccountSettingsView}
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = AccountSettingsView(frame: UIScreen.main.bounds)
    }
}

class AccountSettingsView: UIView{
    
    let appIconService = AppIconService()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        self.backgroundColor = UIColor.white
        setupViews()
        setupConstraints()
        addActions()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(Constants.fatalErrorInit)
    }
    
    func setupViews() {
        
        self.addSubview(contentView)
        contentView.addSubview(selectIconLaben)
        contentView.addSubview(darkIconButton)
        contentView.addSubview(lightIconButton)
        contentView.addSubview(originalIconButton)
    }
    
    func setupConstraints(){
        
        setupContentViewConstraints()
        setupIconButtonsConstranints()
    }
    
    fileprivate func setupContentViewConstraints(){
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        contentView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        contentView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
    
    fileprivate func setupIconButtonsConstranints() {
        
        selectIconLaben.translatesAutoresizingMaskIntoConstraints = false
        selectIconLaben.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20)
        selectIconLaben.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        darkIconButton.translatesAutoresizingMaskIntoConstraints = false
        darkIconButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        darkIconButton.topAnchor.constraint(equalTo: self.selectIconLaben.bottomAnchor, constant: 20).isActive = true
        darkIconButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        darkIconButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        lightIconButton.translatesAutoresizingMaskIntoConstraints = false
        lightIconButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        lightIconButton.topAnchor.constraint(equalTo: self.darkIconButton.bottomAnchor, constant: 20).isActive = true
        lightIconButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        lightIconButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        originalIconButton.translatesAutoresizingMaskIntoConstraints = false
        originalIconButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        originalIconButton.topAnchor.constraint(equalTo: self.lightIconButton.bottomAnchor, constant: 20).isActive = true
        originalIconButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        originalIconButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func addActions(){
        
        darkIconButton.addTarget(self, action: #selector(self.handleDarkIconBtn), for: .touchUpInside)
        lightIconButton.addTarget(self, action: #selector(self.handleLightIconBtn), for: .touchUpInside)
        originalIconButton.addTarget(self, action: #selector(self.handleOriginalIconBtn), for: .touchUpInside)
    }
    
    let contentView: UIView = {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    let selectIconLaben: UILabel = {
        
        let label = UILabel()
        label.text = Constants.selectAnIcon
        label.textColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textAlignment = .center
        
        return label
    }()
    
    let darkIconButton: UIButton = {
        
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: Constants.darkIconName), for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle(Constants.darkIconTitle, for: .normal)
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    let lightIconButton: UIButton = {
        
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: Constants.lightIconName), for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle(Constants.lightIconTitle, for: .normal)
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let originalIconButton: UIButton = {
        
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: Constants.originalIconName), for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle(Constants.originalIconTitle, for: .normal)
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    @objc func handleDarkIconBtn(){
        
        appIconService.changeAppIcon(to: .darkAppIcon)
    }
    
    @objc func handleLightIconBtn() {
        
        appIconService.changeAppIcon(to: .lightAppIcon)
    }
    
    @objc func handleOriginalIconBtn() {
        
        appIconService.changeAppIcon(to: .originalAppIcon)
    }
}
