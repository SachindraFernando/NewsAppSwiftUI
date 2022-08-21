//
//  RegisterView.swift
//  TestAuth
//
//  Created by Sachindra Fernando on 2022-08-20.
//

import SwiftUI

struct RegisterView: View {
    
    //MARK: - PROPERTIES
    @StateObject private var vm = RegistrationViewModelImpl(service: RegistrationServiceImpl())
    
    var body: some View {
        
        NavigationView{
            VStack(spacing: 32){
                
                //MARK: - EMAIL
                InputTextField(text: $vm.userDetails.email,
                               placeholder: "Email",
                               keyboardType: .emailAddress,
                               sfSymbol: "envelope")
                
                //MARK: - PASSWORD
                InputPasswordView(password: $vm.userDetails.password,
                                  placeholder: "Passord",
                                  sfSymbol: "lock")
                
                Divider()
                
                //MARK: - FIRST NAME
                InputTextField(text: $vm.userDetails.firstName,
                               placeholder: "First Name",
                               keyboardType: .default,
                               sfSymbol: "")
                
                //MARK: - LAST NAME
                InputTextField(text: $vm.userDetails.lastName,
                               placeholder: "Last Name",
                               keyboardType: .default,
                               sfSymbol: "")
                
                //MARK: - OCCUPATION
                InputTextField(text: $vm.userDetails.occupation,
                               placeholder: "Occupation",
                               keyboardType: .default,
                               sfSymbol: "")
                
                //MARK: - SIGNUP BUTTON
                ButtonView(title: "Sign Up"){
                    vm.register()
                }
            }
            .padding(.horizontal, 15)
            .navigationTitle("Register")
            .applyClose()
            
            //MARK: - ALERT
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
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
