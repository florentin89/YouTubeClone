//
//  BaseCell.swift
//  YouTubeClone
//
//  Created by Florentin on 05/03/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import UIKit

// Create a base cell which will be 
class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(Constants.fatalErrorInit)
    }
    
    func setupViews(){
        
    }
}
