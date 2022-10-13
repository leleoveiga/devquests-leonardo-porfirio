//
//  Service.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import Foundation

struct Service {

    func fetchList(_ completion: @escaping ([String]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, qos: .userInitiated) {
            completion(["Repository 1", "Repository 2", "Repository 3"])
        }
    }
}
