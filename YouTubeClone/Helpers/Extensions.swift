//
//  Extensions.swift
//  YouTubeClone
//
//  Created by Florentin on 20/02/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
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

let imageCache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView {
    
    var imageUrlString: String?
    
    func loadImageFromURL(urlString: String){
        
        imageUrlString = urlString
        
        guard let url = URL(string: urlString) else {return}
        
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage{
            
            self.image = imageFromCache
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return
            }
            DispatchQueue.main.async {
                
                let imageToCache = UIImage(data: dataResponse)
                
                if self.imageUrlString == urlString {
                    self.image = imageToCache
                }
                
                imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
                    
                self.image = imageToCache
            }
        }
        task.resume()
    }
}
