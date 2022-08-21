//
//  HomeView.swift
//  NewsApp
//
//  Created by Sachindra Fernando on 2022-08-21.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - PROPERITY
    @StateObject var vm = HomeVM()
    let articles: [Article]

    //MARK: - BODY
    
    var body: some View {
        ZStack {
            Color.white
            VStack {
                GeometryReader { geometry in
                    
                    ScrollView(.vertical , showsIndicators: false) {
                        
                        VStack(alignment: .center, spacing: 20) {
                            //MARK: - SEARCH BAR
                            HStack{
                                VStack{
                                    HStack{
                                        TextField("Search", text: $vm.searchText )
                                            .font(NunitoRegularCustom(size: 17))
                                        .foregroundColor(.gray)
                                        Spacer()
                                        Image("search")
                                    }
                                    .padding()
                                }
                                .background(Color.white)
                                .cornerRadius(22)
                                .padding(.leading,16)
                                .padding(.trailing,16)
                                .shadow(radius: 10)

                                Image("notification")
                                    .padding(8)
                                    .background(Color("Primary"))
                                    .clipShape(Circle())
                                    .foregroundColor(.white)
                            }
                            .padding(.top,45)
                            .padding(.leading,16)
                            .padding(.trailing,16)
                            
                            //MARK: - HEADER
                            HStack{
                                Text("Latest News")
                                    .font(NunitoBoldCustom(size: 20))
                                    .foregroundColor(.black)
                                Spacer()

                                Text("See All")
                                    .font(NunitoRegularCustom(size: 14))
                                    .foregroundColor(.blue)
                                Image("arrowForward")
                                    .foregroundColor(.blue)
                            }

                            .padding(.leading,16)
                            .padding(.trailing,16)
                            
                            //MARK: - CAROUSEL
                            
                            CarouselView(article: Article.previewData[4])
                                    .padding(.leading,16)
                                    .padding(.trailing,16)
                            
                            
                            
                            //MARK: - TABS
                            HStack{
                                TabCard(title: "Health", foreColor: "White", backColor: "Primary", borderColor: "Primary", action: {})
                                TabCard(title: "Health", foreColor: "Primary", backColor: "White", borderColor: "Primary", action: {})
                                TabCard(title: "Health", foreColor: "Primary", backColor: "White", borderColor: "Primary", action: {})
                            }
                            
                            //MARK: - NEWS ITEMS
                            List {
                                        ForEach(articles) { article in
                                            ArticleRowView(article: article)

                                        }
                                        .listRowInsets(.init(top: 0, leading: 6, bottom: 6, trailing: 6))

                                    }
                                    .listStyle(.plain)
                            
                            Spacer()
                            
                        }//:VStack
                        .frame(minHeight: geometry.size.height)
                    }//:ScrollView
                    
                    
                    .frame(width: geometry.size.width)
                }//:GeometryReader
            }//:VStack
            .padding(.bottom, 50)
            
        }//:ZStack
        
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)
       
    }
}

//MARK: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
       
        
        HomeView(articles: Article.previewData)
    }
}
