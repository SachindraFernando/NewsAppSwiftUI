//
//  NavBarWithBackButtonWithTransparent.swift
//  NewsApp
//
//  Created by Sachindra Fernando on 2022-08-21.
//

import SwiftUI

struct NavBarWithBackButtonWithTransparent: View {
    var title: String
    var action: (() -> ())?
    
    var body: some View {
        return ZStack {
            Text(title)
                .font(NunitoBoldCustom(size: 16))
                .foregroundColor(Color.white)
            
            HStack {
                Image("arrow")
                    .padding(.all, 8)
                    .background(Color.gray)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .frame(width: 14, height: 14)
                    .onTapGesture {
                        action?()
                    }
                Spacer()
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 140)
        .frame(height: 220)
        .background(Color.black.opacity(0))
    }
}

struct NavBarWithBackButtonWithTransparent_Previews: PreviewProvider {
    static var previews: some View {
        NavBarWithBackButtonWithTransparent(title: "nnn")
    }
}
