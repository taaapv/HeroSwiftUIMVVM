//
//  DataManager.swift
//  HeroSwiftUIMVVM
//
//  Created by Татьяна on 15.12.2022.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    private let userDefaults = UserDefaults()
    
    private init() {}
    
    func setStatus(from key: String, with status: Bool) {
        userDefaults.set(status, forKey: key)
    }
    
    func getStatus(from key: String) -> Bool {
        userDefaults.bool(forKey: key)
    }
}
