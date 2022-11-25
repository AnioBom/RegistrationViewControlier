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
    let job: Company
    let hobbies: String
    let description: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
        
    
    static func getPerson() -> Person {
        Person(
            name: "Albina",
            surname: "Petrenko",
            photo: "IMG_1713",
            job: Company.getCompany(),
            hobbies: "Workout, learning foreign languages ( French & English )",
            description: """
            Even though I have a medical education, I really like my job as a developer and I am always learn something new. In addition to work, I like to go to gym and study foreign languages. At the moment I'm learning English and French, both languages at an intermediate level.
            """
        )
    }
}

struct Company {
    let title: String
    let jobTitle: JobTitle
    let department: Department
    
    static func getCompany() -> Company {
        Company(
            title: "Apple",
            jobTitle: .it,
            department: .it
        )
    }
}

enum JobTitle: String {
    case ceo = "CEO"
    case it = " IT"
}

enum Department: String {
    case management = "Management"
    case marketing = "Marketing"
    case it = "Mobile development"
}
