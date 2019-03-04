//
//  SubscriptionsCell.swift
//  YouTubeClone
//
//  Created by Florentin on 04/03/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import UIKit

class SubscriptionsCell: FeedCell {
    
    
    override func fetchVideos() {
        
        ApiService.sharedInstance.fetchSubscriptionsFeed { (videos: [Video]) in
            
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
}
