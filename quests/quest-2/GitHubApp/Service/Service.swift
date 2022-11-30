//
//  Service.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import Foundation
import UIKit

class Service {
    
    func fetchList(user: String, _ completion: @escaping ([Repository]) -> Void) {
        guard let url = URL(string: "https://api.github.com/users/\(user)/repos") else {
            return
        }
        
        
        URLSession.shared.dataTask(with: url) { data, res, err in
            guard err == nil, let data = data else {
                completion([])
                return
            }
            let jsonDecodable = JSONDecoder()
            let repository = try? jsonDecodable.decode([Repository].self, from: data)
            dump(repository)
            
            completion(repository ?? [])
        }.resume()
    }
    
}
