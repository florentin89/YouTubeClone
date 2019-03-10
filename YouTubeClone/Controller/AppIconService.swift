//
//  AppIconService.swift
//  YouTubeClone
//
//  Created by Florentin on 09/03/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import UIKit

class AppIconService {
    
    let application = UIApplication.shared
    
    enum AppIcon: String {
        
        case darkAppIcon
        case lightAppIcon
        case originalAppIcon
    }
    
    func changeAppIcon(to appIcon: AppIcon){
        
        let appIconValue: String? = appIcon == .originalAppIcon ? nil : appIcon.rawValue
        application.setAlternateIconName(appIconValue)
    }
}
