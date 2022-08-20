//
//  ViewController.swift
//  RegistrationViewControlier
//
//  Created by mac on 8/12/22.
//

import UIKit

final class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var nameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private let user = "User"
    private let password = "Password"
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
        self.nameTF.delegate = self
        self.passwordTF.delegate = self
        
    }
    
    
    // MARK: - Group of override methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.user = user
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    //MARK: - main buttons
    
    @IBAction func logInPressed() {
        guard nameTF.text == user, passwordTF.text == password else {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: passwordTF
            )
        return
    }
        performSegue(withIdentifier: "openWelcomeVC", sender: nil)
    }
    
    //MARK: - Additional buttons
    
    @IBAction func forgotRegisterDate(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops!", message: "Your name is \(user)!")
        :showAlert(title: "Oops!", message: "Your password is \(password)")
    }
    
    //MARK: - go to the next screen
    
    @IBAction func unwindSgue(segue: UIStoryboardSegue) {
        nameTF.text = ""
        passwordTF.text = ""
    }
    
    //MARK: - Alert
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}
