//
//  DetailView.swift
//  HeroSwiftUIMVVM
//
//  Created by Татьяна on 15.12.2022.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: DetailViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text(viewModel.name)
                .font(.largeTitle)
            ZStack {
                HeroImageView(imageData: viewModel.imageData,
                              imageSize: CGSize(width: 230,
                                                height: 180),
                              cornerRadius: 30,
                              shadowIsOn: true)
                FavoriteButton(action: viewModel.toggleFavoriteButton, isFavorite: viewModel.isFavorite)
            }
            VStack(alignment: .leading, spacing: 30) {
                
                Text(viewModel.alterEgos)
                Text(viewModel.placeOfBirth)
                Text(viewModel.occupation)
            }
            Spacer()
            
        }
    }
}

struct FavoriteButton: View {
    var action: () -> Void
    var isFavorite: Bool
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(isFavorite ? .red : .gray)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: DetailViewModel(hero: Hero.getHero()))
    }
}
