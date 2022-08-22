//
//  User.swift
//  RegistrationViewControlier
//
//  Created by mac on 8/22/22.
//

import Foundation



struct UserModel {
    let name: String
    let surname: String
    let age: Int
    let gender: SexType
    let profetional: String
    let hobbies: String
}
enum SexType: String {
    case male
    case female
}


