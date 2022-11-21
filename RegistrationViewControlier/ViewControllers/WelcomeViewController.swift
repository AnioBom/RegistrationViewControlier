//
//  WelcomViewController.swift
//  RegistrationViewControlier
//
//  Created by mac on 8/12/22.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        welcomeLabel.text = "Welcome, \(user.person.fullName)!"
        
        
        
    }
    
}

    
