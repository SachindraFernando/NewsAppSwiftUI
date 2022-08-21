//
//  ProfileView.swift
//  NewsApp
//
//  Created by Sachindra Fernando on 2022-08-21.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var sessionService: SessionServiceImpl
    
    var body: some View {
        ZStack {
            
            VStack {
                GeometryReader { geometry in
                    
                    ScrollView(.vertical , showsIndicators: false) {
                        
                        VStack(alignment: .center, spacing: 20) {
                            
                            //MARK: - SEARCH BAR
                            
                                
                            //MARK: - HEADER
                            HStack{
                                Text("Profile")
                                    .font(NunitoBoldCustom(size: 20))
                                    .foregroundColor(Color("Primary"))
                                Spacer()
                                
                            }
                            
                            .padding(.leading,16)
                            .padding(.trailing,16)
                            
                            
                            VStack(alignment: .leading, spacing: 16){
                                VStack(alignment: .leading, spacing: 16){
                                    Text("First Name : \(sessionService.userDetails?.firstName ?? "")")
                                    Text("Last Name : \(sessionService.userDetails?.lastName ?? "")")
                                    Text("Occupation : \(sessionService.userDetails?.occupation ?? "")")
                                }
                                
                                ButtonView(title: "Logout",
                                           background: Color("White"),
                                           foreground: Color("Primary"),
                                           border: Color("Primary")){
                                    sessionService.logout()
                                }
                            }
                            .padding(.horizontal, 16)
                           
                            
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

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(SessionServiceImpl())
    }
}
