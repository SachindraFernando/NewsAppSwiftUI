//
//  ArticleListView.swift
//  NewsApp
//
//  Created by Sachindra Fernando on 2022-08-21.
//

import SwiftUI

struct ArticleListView: View {
    
    let articles: [Article]
    @State private var selectedArticle: Article?
    
    var body: some View {
        List {
            ForEach(articles) { article in
                ArticleRowView(article: article)
                    .onTapGesture {
                        selectedArticle = article
                    }
            }
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            
        }
        .listStyle(.plain)
        
    }
}

struct ArticleListView_Previews: PreviewProvider {
   
    static var previews: some View {
        NavigationView {
            ArticleListView(articles: Article.previewData)
                
        }
    }
}
