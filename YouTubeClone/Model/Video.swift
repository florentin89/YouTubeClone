//
//  VideoModel.swift
//  YouTubeClone
//
//  Created by Florentin on 21/02/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import UIKit

class Video: NSObject {
    
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: NSNumber?
    var uploadDate: NSDate?
    
    var channel: Channel?
}

class Channel: NSObject {
    
    var name: String?
    var profileImageName: String?
}
