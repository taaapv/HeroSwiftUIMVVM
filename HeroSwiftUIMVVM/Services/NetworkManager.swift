//
//  NetworkManager.swift
//  HeroSwiftUIMVVM
//
//  Created by Татьяна on 15.12.2022.
//

import Foundation

enum Link: String {
    case heroes = "https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/all.json"
}

enum NetworkError: Error {
    case noData
    case invaridUrl
}

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func fetchData() async throws -> [Hero] {
        guard let url = URL(string: Link.heroes.rawValue) else {
            throw NetworkError.invaridUrl
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        guard let heroes = try? JSONDecoder().decode([Hero].self, from: data) else {
            throw NetworkError.noData
        }
        
        return heroes
    }
    
    func fetchImage(from url: String) throws -> Data {
        guard let imageUrl = URL(string: url) else {
            throw NetworkError.invaridUrl
        }
        
        guard let imageData = try? Data(contentsOf: imageUrl) else {
            throw NetworkError.noData
        }
        
        return imageData
    }
}
