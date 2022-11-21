//
//  User.swift
//  RegistrationViewControlier
//
//  Created by mac on 8/22/22.
//

import Foundation


struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUserData() -> User {
        User(login: "1", password: "1", person: Person.getPerson())
    }
}

struct Person {
    let name: String
    let surname: String
    let photo: String
    let age: String
    let gender: Gender
    let job: String
    let hobbies: String
    let description: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person {
        Person(
            name: "Tom",
            surname: "Harvi",
            photo: "",
            age: "30",
            gender: Gender.man,
            job: "Manadger",
            hobbies: "swimming, shopping",
            description: """
            I was born in a southern city, graduated from a prestigious university and found a promising job
            """
        )
    }
}

enum Gender: String {
    case man = "man"
    case femail = "female"
    case na = "N/A"
}

