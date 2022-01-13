//
//  UserRegistrationModel.swift
//  LoginTest
//
//  Created by User on 13/1/2022.
//

import Foundation
@testable import VT6002CEM_217109054

struct UserRegistrationModel {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
extension UserRegistrationModel {
    func isValidFirstName() -> Bool {
        return firstName.count > 1
    }
    
    func isValidLastName() -> Bool {
        return lastName.count > 1
    }
    func isValidEmail() -> Bool {
        return email.contains("@") && email.contains(".")
    }
    func isValidPasswordLength() -> Bool {
        return password.count >= 8 && password.count <= 16
    }
    
    func isValidPassword() -> Bool {
        return isValidPasswordLength()
    }
    
    func isDataValid() -> Bool {
        return isValidFirstName() && isValidLastName() && isValidEmail() && isValidPasswordLength()
        
    }
}
