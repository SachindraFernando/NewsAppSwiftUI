//
//  TabCard.swift
//  NewsApp
//
//  Created by Sachindra Fernando on 2022-08-21.
//

import SwiftUI

struct TabCard: View {
    var title: String
    var foreColor: String
    var backColor: String
    var borderColor: String
    var action: (() -> ())
    
    var body: some View {
        VStack{
            Button(action: {
                action()
            }) {
                HStack {
                    
                    Text(title)
                        .font(NunitoRegularCustom(size: 12))
                }
                
                .foregroundColor(Color(foreColor))
                .padding()
                .frame(height: 36)
                .cornerRadius(8)
                .background(
                    ZStack {
                        RoundedRectangle (cornerRadius: 30).fill(Color(backColor))
                        RoundedRectangle (cornerRadius: 30).stroke(Color(borderColor),lineWidth: 1)
                    })
//                .frame(height: 36)
//                .padding(.horizontal)
//                .foregroundColor(Color(foreColor))
//                .background(Color(backColor))
//                .cornerRadius(40)
            }
        }
    }
}

struct TabCard_Previews: PreviewProvider {
    static var previews: some View {
        TabCard(title: "jvvvvvvjj", foreColor: "Primary", backColor: "White", borderColor: "Secondary", action: {})
    }
}
