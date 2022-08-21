//
//  CarouselView.swift
//  NewsApp
//
//  Created by Sachindra Fernando on 2022-08-21.
//

import SwiftUI

struct CarouselView: View {
     
    @State var CurrentIndex : Int = 1
     
    var body: some View {
        VStack {
             
            //Carousel Slider
            TabView(selection: $CurrentIndex) {
                ForEach(1...3,id: \.self) {index in
                     
                    //Custom Scroll Effect
                    GeometryReader{proxy -> AnyView in
                         
                        let minX = proxy.frame(in: .global).minX
                         
                        let width = UIScreen.main.bounds.width
                         
                        let progress = -minX / (width * 2)
                         
                        var scale = progress > 0 ? 1 - progress : 1 + progress
                         
                        scale = scale < 0.7 ? 0.7 : scale
                         
                        return AnyView(
                            VStack{
                                Image("picture\(index)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.horizontal,10)
                                 
                                Text("Loren ipsum dlipsum")
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                                    //.background(Color.green)
                                    .padding()
                                 
                                Text("Loren ipsum, or dlipsum as is somtine know text usded in layoyt Loren ipsum, or dlipsum as is somtine know text usded in layoyt")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding(.horizontal)
                                     
                            }
                            .frame(maxHeight: .infinity, alignment: .center)
                            .scaleEffect(scale)
                        )
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
             
            //custom tab indicator
             
            CustomeTabIndicator(count: 3, current: $CurrentIndex)
                .padding(.vertical)
                .padding(.top)
             
            
        }
        .frame(maxWidth: .infinity, maxHeight: 250.0)
        .background(Color.blue).ignoresSafeArea()
    }
}
 
struct CustomeTabIndicator: View {
     
    var count: Int
    @Binding var current: Int
     
    var body: some View {
         
        HStack {
             
            HStack {
                ForEach(0..<count,id: \.self) { index in
                     
                    ZStack {
                        //image  index start from 1..
                        if (current - 1) == index {
                            Circle()
                                .fill(Color.green)
                        }
                        else {
                             
                            Circle()
                                .fill(Color.white)
                                .overlay(
                                    Circle()
                                        .stroke(Color.green, lineWidth: 1.5)
                                )
                        }
                    }
                    .frame(width: 10, height: 10)
                }
            }
        }
    }
}
