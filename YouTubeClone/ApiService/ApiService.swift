//
//  ApiService.swift
//  YouTubeClone
//
//  Created by Florentin on 03/03/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import UIKit

class ApiService: NSObject {
    
    static let sharedInstance = ApiService()
    let baseUrl = Constants.baseUrlJSON
    
    // Get videos from different API's using this general method
    func fetchFeedForUrlString(urlString: String, completion: @escaping ([Video]) -> ()){
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print(error)
                    return
                }
                guard let data = data else { return }
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    completion(try decoder.decode([Video].self, from: data))
                } catch let jsonError { print(Constants.failedDecode, jsonError) }
            }
            }.resume()
    }
    
    func fetchVideos(completion: @escaping ([Video]) -> ()){
        fetchFeedForUrlString(urlString: Constants.baseUrlJSON + Constants.homeJSON, completion: completion)
    }
    
    func fetchTrendingFeed(completion: @escaping ([Video]) -> ()){
        fetchFeedForUrlString(urlString: Constants.baseUrlJSON + Constants.trendingJSON, completion: completion)
    }
    
    func fetchSubscriptionsFeed(completion: @escaping ([Video]) -> ()){
        fetchFeedForUrlString(urlString: Constants.baseUrlJSON + Constants.subscriptionsJSON, completion: completion)
    }
}
