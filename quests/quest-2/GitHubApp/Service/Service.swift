//
//  Service.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import Foundation

class Service {
    

    func fetchList(user: String, _ completion: @escaping ([String]) -> Void) {
        let url = URL(string: "https://api.github.com/users/\(user)/repos")!
        
        URLSession.shared.dataTask(with: url) { data, res, err in
            guard err == nil, let data = data else {
                completion([])
                return
            }
            let jsonDecodable = JSONDecoder()
            let repository = try? jsonDecodable.decode([Repository].self, from: data)
            dump(repository)
            
            completion([])
        }.resume()
        
    }
    
    func fetchUser(user: String, _ completion: @escaping (User?) -> Void) {
        let url = URL(string: "https://api.github.com/users/\(user)")!
        
        URLSession.shared.dataTask(with: url) { data, res, err in
            guard err == nil, let data else {
                completion(nil)
                return
            }
            
            let jsonDecodable = JSONDecoder()
            let user = try? jsonDecodable.decode(User.self, from: data)
            completion(user)
        }.resume()
    }
}
