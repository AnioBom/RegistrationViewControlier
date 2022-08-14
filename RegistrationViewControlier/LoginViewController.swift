//
//  ViewController.swift
//  RegistrationViewControlier
//
//  Created by mac on 8/12/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var textName: UITextField!
    @IBOutlet var textPassword: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    //MARK: - Additionals buttons
    @IBAction func forgotNamePressed() {
        guard let messageText1 = textName.text, !messageText1.isEmpty else {
            showAlert(with: "Your name is User", and: "🌸")
            return
        }
    }
    
    @IBAction func forgotPasswordPressed() {
        guard let massageText2 = textPassword.text, !massageText2.isEmpty else {
            showAlert(with: "Your password is password", and: "🌸")
            return
        }
    }
    
    
    /*
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        guard let logOutSegue = segue.source as? WelcomViewController else { return }
        
    }
     */

}
// MARK: - UIAlertController
extension LoginViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
}


