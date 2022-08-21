//
//  ButtonComponentView.swift
//  TestAuth
//
//  Created by Sachindra Fernando on 2022-08-20.
//

import SwiftUI

struct ButtonView: View {
    
    typealias ActionHandler = () -> Void
    
    let title: String
    let background: Color
    let foreground: Color
    let border: Color
    let handler: ActionHandler
    
    private let cornerRadius: CGFloat = 10
    
    internal init(title: String,
                  background: Color = Color("Primary"),
                  foreground: Color = .white,
                  border: Color = .clear,
                  handler: @escaping ButtonView.ActionHandler){
        self.title = title
        self.background = background
        self.foreground = foreground
        self.border = border
        self.handler = handler
    }
    
    var body: some View {
        Button(action: handler, label: {
            Text(title)
                .frame(maxWidth: .infinity, maxHeight: 50)
        })
            .background(background)
            .foregroundColor(foreground)
            .font(.system(size: 16, weight: .bold))
            .cornerRadius(cornerRadius)
            .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(border, lineWidth: 2)
            )
    }
}

struct ButtonComponentView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "ccc") { }
        .preview(with: "Secondary")
        
        ButtonView(title: "sec",
                   background: .clear,
                   foreground: .blue,
                   border: .blue) { }
                   .preview(with: "sssss")
    }
}
