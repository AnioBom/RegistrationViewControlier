//
//  BiographyViewController.swift
//  RegistrationViewControlier
//
//  Created by mac on 11/21/22.
//

import UIKit

class BiographyViewController: UIViewController {
    
    @IBOutlet var userBioTV: UITextView!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        userBioTV.backgroundColor = .clear
        userBioTV.textColor = .white
        navigationItem.title = "\(user.person.fullName) Biography"
        userBioTV.text = user.person.description

    }
    
}
