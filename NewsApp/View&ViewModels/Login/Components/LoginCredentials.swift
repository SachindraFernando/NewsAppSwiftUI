//
//  LoginCredentials.swift
//  TestAuth
//
//  Created by Sachindra Fernando on 2022-08-20.
//

import Foundation

struct LoginCredentials{
    var email: String
    var password: String
}
extension LoginCredentials{
    static var new: LoginCredentials {
        LoginCredentials(email: "", password: "")
    }
}


