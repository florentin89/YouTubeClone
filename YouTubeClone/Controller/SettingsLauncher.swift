//
//  SettingsLauncher.swift
//  YouTubeClone
//
//  Created by Florentin on 21/02/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import UIKit

class Settings: NSObject {
    
    let name: SettingsName
    let imageName: String
    
    init(name: SettingsName, imageName: String){
        self.name = name
        self.imageName = imageName
    }
}

enum SettingsName: String {
    case settings = "Settings"
    case terms = "Terms & privacy policy"
    case feedback = "Send Feedback"
    case help = "Help"
    case switchAccount = "Switch Account"
    case cancel = "Cancel"
}

class SettingsLauncher: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    override init() {
        super.init()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SettingsCell.self, forCellWithReuseIdentifier: Constants.cellID)
    }
    
    let blackView = UIView()
    let cellHeight: CGFloat = 50
    var homeController: HomeController?
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        return cv
    }()
    
    let settings: [Settings] = {
        let settingsSetting = Settings(name: .settings, imageName: Constants.settings)
        let termsPrivacySetting = Settings(name: .terms, imageName: Constants.privacy)
        let feedbackSettings = Settings(name: .feedback, imageName: Constants.feedback)
        let helpSettings = Settings(name: .help, imageName: Constants.help)
        let switchAccountSettings = Settings(name: .switchAccount, imageName: Constants.switchAccount)
        let cancelSetting = Settings(name: .cancel, imageName: Constants.cancel)
        
        return [settingsSetting, termsPrivacySetting, feedbackSettings, helpSettings, switchAccountSettings, cancelSetting]
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellID, for: indexPath) as! SettingsCell
        let setting = settings[indexPath.item]
        cell.setting = setting
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let setting = self.settings[indexPath.item]
        handleDismiss(setting: setting)
    }
    
    // Pop up a menu with animation when you press the More Button
    func showSettings(){
        
        if let window = UIApplication.shared.keyWindow{
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            window.addSubview(blackView)
            window.addSubview(collectionView)
            
            let height: CGFloat = CGFloat(settings.count) * cellHeight
            let y = window.frame.height - height
            
            collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 1
                self.collectionView.frame = CGRect(x: 0, y: y, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
            }, completion: nil)
        }
    }
    
    // dismiss the More Menu with animation
    @objc func handleDismiss(setting: Settings) {
        UIView.animate(withDuration: 0.5, animations: {
            self.blackView.alpha = 0
            if let window = UIApplication.shared.keyWindow {
                self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
            }
        }, completion: { (_) in
            if setting.name != .cancel {
                self.homeController?.showControllerForSetting(setting: setting)
            }
        })
    }
}
