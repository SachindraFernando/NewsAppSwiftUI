//
//  LoginView.swift
//  TestAuth
//
//  Created by Sachindra Fernando on 2022-08-20.
//

import SwiftUI

struct LoginView: View {
    
    //MARK: - PROPERTIES
    @State private var showRegistration = false
    @StateObject private var vm = LoginViewModelImpl(service: LoginServiceImpl())
    
    var body: some View {
        VStack(spacing: 16){
            
            //MARK: - EMAIL
            InputTextField(text: $vm.credentials.email,
                           placeholder: "Email",
                           keyboardType: .emailAddress,
                           sfSymbol: "envelope")
            
            //MARK: - PASSWORD
            InputPasswordView(password: $vm.credentials.password,
                              placeholder: "Passord",
                              sfSymbol: "lock")
            
            
            VStack(spacing: 16){
                
                //MARK: - LOGIN BUTTON
                ButtonView(title: "Login",
                           background: Color("Primary"),
                           foreground: Color("White"),
                           border: Color("Primary")){
                    vm.login()
                }
                
                //MARK: - SIGNUP BUTTON
                ButtonView(title: "Register",
                           background: .clear,
                           foreground: Color("Primary"),
                           border: Color("Primary")){
                    showRegistration.toggle()
                }
                           .sheet(isPresented: $showRegistration,
                                  content: {
                               RegisterView()
                           })
            }
        }
        .padding(.horizontal, 15)
        .navigationTitle("Login")
        .alert(isPresented: $vm.hasError, content: {
            if case .failed(let error) = vm.state {
                return Alert(
                    title: Text("Error"),
                    message: Text(error.localizedDescription))
            }else{
                return Alert(title: Text("Error"),
                             message: Text("Something went wrong"))
            }
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
