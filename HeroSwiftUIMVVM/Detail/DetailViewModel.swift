//
//  DetailViewModel.swift
//  HeroSwiftUIMVVM
//
//  Created by Татьяна on 15.12.2022.
//

import Foundation

class DetailViewModel: ObservableObject, Identifiable {
    var name: String {
        hero.name
    }
    
    var imageData: Data {
        var imageData = Data()
        
        do {
            imageData = try NetworkManager.shared.fetchImage(from: hero.images.lg)
        } catch {
            print(error)
        }
        
        return imageData
    }
    
    var alterEgos: String {
        "Alter Egos: \(hero.biography.alterEgos)"
    }
    
    var placeOfBirth: String {
        "Place of Birth: \(hero.biography.placeOfBirth)"
    }
    
    var occupation: String {
        "Occupation: \(hero.work.occupation)"
    }
    
    @Published var isFavorite: Bool {
        didSet {
            DataManager.shared.setStatus(from: hero.id.formatted(), with: isFavorite)
        }
    }
    
    private let hero: Hero
    
    required init(hero: Hero) {
        self.hero = hero
        isFavorite = DataManager.shared.getStatus(from: hero.id.formatted())
    }
    
    func toggleFavoriteButton() {
        isFavorite.toggle()
    }
}
