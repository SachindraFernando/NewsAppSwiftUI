//
//  FavouriteView.swift
//  NewsApp
//
//  Created by Sachindra Fernando on 2022-08-21.
//

import SwiftUI

struct FavouriteView: View {
    
    @EnvironmentObject var vmF: FavouriteVM
    @State var searchText: String = ""
    
    var body: some View {
        let articles = self.articles
        
        NavigationView {
            ArticleListView(articles: articles)
                .padding(.bottom)
                .overlay(overlayView(isEmpty: articles.isEmpty))
                .navigationTitle("Favorite Articles")
                
        }
        
        .searchable(text: $searchText)
    }
    
    private var articles: [Article] {
        if searchText.isEmpty {
            return vmF.bookmarks
        }
        return vmF.bookmarks
            .filter {
                $0.title.lowercased().contains(searchText.lowercased()) ||
                $0.descriptionText.lowercased().contains(searchText.lowercased())
            }
    }
    
    @ViewBuilder
    func overlayView(isEmpty: Bool) -> some View {
        if isEmpty {
            EmptyPlaceholderView(text: "No favorite articles", image: Image(systemName: "bookmark"))
        }
    }
}

struct FavouriteView_Previews: PreviewProvider {
    
    @StateObject static var vmF = FavouriteVM.shared

    static var previews: some View {
        FavouriteView()
            .environmentObject(vmF)
    }
}
