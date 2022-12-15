//
//  HeroListView.swift
//  HeroSwiftUIMVVM
//
//  Created by Татьяна on 15.12.2022.
//

import SwiftUI

struct HeroListView: View {
    @StateObject private var viewModel = HeroListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.rows) { detailVM in
                NavigationLink(destination: DetailView(viewModel: detailVM)) {
                    RowView(viewModel: detailVM)
                }
            }
            .navigationTitle("Heroes")
        }
        .task {
            await viewModel.fetchHeroes()
        }
    }
}

struct HeroListView_Previews: PreviewProvider {
    static var previews: some View {
        HeroListView()
    }
}
