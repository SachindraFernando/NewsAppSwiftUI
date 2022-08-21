//
//  TabBarStyled.swift
//  NewsApp
//
//  Created by Sachindra Fernando on 2022-08-21.
//

import SwiftUI

struct TabBarStyled: View {
    
    @Binding var tabsInfo : [TabInfo]
    @Binding var selectedIndex : Int

    var body: some View {
        VStack{
            HStack{
                ForEach(tabsInfo, id: \.id){ tab in
                    Button(
                        action: {
                            selectedIndex = tab.id
                        }
                        , label: {
                            VStack(alignment:.center ,spacing: 5){
                                Image(tab.isSelected ? tab.imageActive : tab.imageInactive)
                                    .foregroundColor(tab.isSelected ? Color("Primary") : Color.gray)
                                    .frame(width: 26, height: 24)
                                    .shadow(color: Color.black.opacity(tab.isSelected ? 0.1 : 0), radius: 3, x: 0, y: 1)
                                    .padding(.top, 6)
                                Text(tab.title)
                                    //.font(Font.custom(tab.isSelected ? "Poppins-SemiBold" : "Poppins-Regular", size: 11))
                                    .foregroundColor(tab.isSelected ? Color.black : Color.gray)
                                    .foregroundColor(.gray)
                            }
                            .padding(.horizontal, 5)
                        }
                    )
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 39)
            .background(
                RoundedRectangle(cornerRadius: 40)
                    .foregroundColor(Color.white)
                    .shadow(color: Color.black.opacity(0.1), radius: 18, x: 0, y: 2)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.gray, lineWidth: 0.7)
                    .shadow(color: Color.black.opacity(0.22), radius: 3, x: 0, y: -1))
            .onChange(of: selectedIndex, perform: { _ in
                
                tabsInfo[selectedIndex].isSelected = true
                
                //inactive & active action
                for tabIn in tabsInfo {
                    if selectedIndex != tabIn.id{
                        tabsInfo[tabIn.id].isSelected = false
                    }
                }
            })
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 5)
    }
}

struct TabInfo{
    var id : Int
    var title : String
    var imageActive : String
    var imageInactive : String
    var isSelected: Bool
}
