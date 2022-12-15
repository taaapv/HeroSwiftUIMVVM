//
//  HeroListViewModel.swift
//  HeroSwiftUIMVVM
//
//  Created by Татьяна on 15.12.2022.
//

import Foundation

class HeroListViewModel: ObservableObject {
    @Published var rows: [DetailViewModel] = []
    
    func fetchHeroes() async {
        do {
            let heroes = try await NetworkManager.shared.fetchData()
            heroes.forEach { [unowned self] hero in
                let detailVM = DetailViewModel(hero: hero)
                DispatchQueue.main.async {
                    self.rows.append(detailVM)
                }
            }
        } catch {
            print(error)
        }
    }
}
