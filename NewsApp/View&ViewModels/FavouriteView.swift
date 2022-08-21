//
//  FavouriteView.swift
//  NewsApp
//
//  Created by Sachindra Fernando on 2022-08-21.
//

import SwiftUI

struct FavouriteView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            Image("news")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                NavBarWithBackButtonWithTransparent(title: "") {
                    presentationMode.wrappedValue.dismiss()
                }
                
                
                GeometryReader { geometry in
                    ScrollView(.vertical , showsIndicators: false) {
                        
                        VStack {
                          Text("kuhdcigsdocusdhglodsh khbksdugcud")
                        } //:VStack
                        .frame(minHeight: geometry.size.height)
                        .padding(.horizontal, 16)
                        
                    } //:ScrollView
                    .frame(width: geometry.size.width)
                    .background(Color.white
                        .clipShape(RoundedView(radius: 16, edges: [.topLeft,.topRight]))
                        .edgesIgnoringSafeArea(.bottom)
                    )
                } //: GeometryReader

            }
            
        }
    }
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
    }
}
