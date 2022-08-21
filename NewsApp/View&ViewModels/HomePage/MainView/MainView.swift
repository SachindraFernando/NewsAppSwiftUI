//
//  MainView.swift
//  NewsApp
//
//  Created by Sachindra Fernando on 2022-08-21.
//

import SwiftUI

struct MainView: View {

    @State var isolationTab = 0
    @State var isShowAlert = false
    @State var isShowAssets = false
    @State var alertTitle = ""
    @State var alertMessage = ""
    @State var lockBoxID: Int? = nil
    @State var selectedIndex = 0
    @StateObject var mainVM = MainVM()
    @State var tabsInfo : [TabInfo] = [
        TabInfo(id: 0, title: "Home", imageActive: "home", imageInactive: "home", isSelected: true),
        TabInfo(id: 1, title: "Favourite", imageActive: "heart", imageInactive: "heart", isSelected: false),
        TabInfo(id: 2, title: "Profile", imageActive: "profile", imageInactive: "profile", isSelected: false)
    ]
    
    var body: some View {
        ZStack(alignment:.bottom) {
            VStack{
                Group{
                    switch selectedIndex {
                    case 0 :
                        HomeView(articles: Article.previewData)
                        
                    case 1:
                        FavouriteView()
                    case 2:
                        ProfileView()
                    default:
                        EmptyView()
                    
                    }
                }
            }
            if mainVM.tabBarShow {
                TabBarStyled(tabsInfo: $tabsInfo, selectedIndex: $selectedIndex)
            }
        }
        .environmentObject(mainVM)
    }

}
