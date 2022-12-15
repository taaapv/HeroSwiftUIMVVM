//
//  RowView.swift
//  HeroSwiftUIMVVM
//
//  Created by Татьяна on 15.12.2022.
//

import SwiftUI

struct RowView: View {
    var viewModel: DetailViewModel
    
    var body: some View {
        HStack {
            HeroImageView(imageData: viewModel.imageData,
                          imageSize: CGSize(width: 130, height: 100),
                          cornerRadius: 10,
                          shadowIsOn: false)
            Text(viewModel.name)
            Spacer()
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(viewModel: DetailViewModel(hero: Hero.getHero()))
    }
}
