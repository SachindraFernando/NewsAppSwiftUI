//
//  RoundedView.swift
//  NewsApp
//
//  Created by Sachindra Fernando on 2022-08-21.
//
import SwiftUI

struct RoundedView: Shape {
    
    var radius: Int = 25
    var edges: UIRectCorner = [.bottomRight,.topRight]

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: edges, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct RoundedView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedView()
    }
}
