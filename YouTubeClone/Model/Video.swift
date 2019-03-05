//
//  VideoModel.swift
//  YouTubeClone
//
//  Created by Florentin on 21/02/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import UIKit

struct Video: Decodable {
    
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: Int?
    var uploadDate: Date?
    var duration: Int?
    var numberOfLikes: Int?
    var channel: Channel?
}

struct Channel: Decodable {
    var name: String?
    var profileImageName: String?
}
