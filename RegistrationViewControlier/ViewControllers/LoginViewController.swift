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
    
    private let user = User.getUserData()
    
    // MARK: - Group of override methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBar = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBar.viewControllers else { return }
        
        viewControllers.forEach { viewController in
            if let welcomVC = viewController as? WelcomeViewController {
                welcomVC.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                guard  let userInfoVC = navigationVC.topViewController as? InformationViewController else { return }
                userInfoVC.user = user
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    //MARK: - main buttons
    
    @IBAction func logInPressed() {
        guard nameTF.text == user.login, passwordTF.text == user.password else {
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
        ? showAlert(title: "Oops!", message: "Your name is \(user.login)!")
        :showAlert(title: "Oops!", message: "Your password is \(user.password)")
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


private func configerateTextFields() {
    nameTF.delegate = self
    passwordTF.delegate = self
  }
}

//MARK: - KeyBoard

extension LoginViewController {
    private func registerKeyboardNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardDidHideNotification,
                                               object: nil)
    }
    
    @objc private func keyboardWillShow(_ notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y == 0 {
                view.frame.origin.y -= keyboardSize.height - 200
            }
        }
    }
    
    @objc private func keyboardWillHide(_ notification: NSNotification) {
        if view.frame.origin.y != 0 {
            view.frame.origin.y = 0
        }
}
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

