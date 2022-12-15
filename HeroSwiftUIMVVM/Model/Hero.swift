//
//  Hero.swift
//  HeroSwiftUIMVVM
//
//  Created by Татьяна on 15.12.2022.
//

import Foundation

// MARK: - Hero
struct Hero: Codable {
    let id: Int
    let name: String
    let biography: Biography
    let work: Work
    let images: Images
}

// MARK: - Biography
struct Biography: Codable {
    let alterEgos: String
    let placeOfBirth: String
}

// MARK: - Images
struct Images: Codable {
    let lg: String
}

// MARK: - Work
struct Work: Codable {
    let occupation: String
}

extension Hero {
    static func getHero() -> Hero {
        Hero(id: 1,
             name: "A-Bomb",
             biography: Biography(alterEgos: "No alter egos found.",
                                  placeOfBirth: "Scarsdale, Arizona"),
             work: Work(occupation: "Musician, adventurer, author; formerly talk show host"),
             images: Images(lg: "https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/images/lg/1-a-bomb.jpg"))
    }
}
