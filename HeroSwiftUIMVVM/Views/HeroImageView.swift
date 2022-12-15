//
//  HeroImageView.swift
//  HeroSwiftUIMVVM
//
//  Created by Татьяна on 15.12.2022.
//

import SwiftUI

struct HeroImageView: View {
    let imageData: Data
    let imageSize: CGSize
    let cornerRadius: CGFloat
    let shadowIsOn: Bool
    
    var body: some View {
        getImage(from: imageData)
            .resizable()
            .frame(width: imageSize.width,
                   height: imageSize.height)
            .cornerRadius(cornerRadius)
            .shadow(radius: shadowIsOn ? 10 : 0)
    }
    
    private func getImage(from data: Data) -> Image {
        guard let uiImage = UIImage(data: data) else {
            return Image(systemName: "xmark.shield")
        }
        let image = Image(uiImage: uiImage)
        return image
    }
}

struct HeroImageView_Previews: PreviewProvider {
    static var previews: some View {
        HeroImageView(imageData: Data(),
                      imageSize: CGSize(width: 230, height: 180),
                      cornerRadius: 30,
                      shadowIsOn: true)
    }
}
