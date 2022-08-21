//
//  NewsItemCard.swift
//  NewsApp
//
//  Created by Sachindra Fernando on 2022-08-21.
//

import SwiftUI

struct ArticleRowView: View {
    
    let article: Article
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ZStack{
                AsyncImage(url: article.imageURL) { phase in
                    switch phase {
                    case .empty:
                        HStack {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                        
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        
                    case .failure:
                        HStack {
                            Spacer()
                            Image(systemName: "photo")
                                .imageScale(.large)
                            Spacer()
                        }
                        
                        
                    @unknown default:
                        fatalError()
                    }
                }
                .frame(minHeight: 200, maxHeight: 300)
                .background(Color.gray.opacity(0.3))
                .clipped()
                
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(article.title)
                        .foregroundColor(Color.white)
                        .font(.headline)
                        .lineLimit(3)
                    
                    
                    HStack {
                        Text(article.captionText)
                            .lineLimit(1)
                            .foregroundColor(Color.white)
                            .font(.caption)
                        
                        HStack{
                            
                        }.frame(width: 90)
                        
                        Text(article.dateText)
                            .lineLimit(1)
                            .foregroundColor(Color.white)
                            .font(.caption)
                            
                    }.padding(.top, 80)
                }
                .padding([.horizontal, .bottom])
            }
            
           
            
           
            
        }
        .cornerRadius(10)
    }
}

extension View {
    
    func presentShareSheet(url: URL) {
        let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?
            .keyWindow?
            .rootViewController?
            .present(activityVC, animated: true)
    }
    
}

struct ArticleRowView_Previews: PreviewProvider {

    static var previews: some View {
        NavigationView {
            List {
                ArticleRowView(article: .previewData[0])
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            .listStyle(.plain)
        }
    }
}
