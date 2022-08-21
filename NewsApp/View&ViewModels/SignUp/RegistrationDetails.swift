//
//  RegistrationDetails.swift
//  TestAuth
//
//  Created by Sachindra Fernando on 2022-08-20.
//

import Foundation

struct RegistrationDetails {
    var email: String
    var password: String
    var firstName: String
    var lastName: String
    var occupation: String
}

extension RegistrationDetails{
    static var new: RegistrationDetails {
        RegistrationDetails(email: "",
                            password: "",
                            firstName: "",
                            lastName: "",
                            occupation: "")
    }
}

