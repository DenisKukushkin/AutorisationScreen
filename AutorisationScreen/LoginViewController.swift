//
//  ViewController.swift
//  AutorisationScreen
//
//  Created by kukushkin-ds on 19.06.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let userName = "User"
    private let password = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    internal override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeScreenVC = segue.destination as? WelcomeViewController else { return }
            welcomeScreenVC.welcomeText = "Welcome, \(userName)!"
    }
    
    @IBAction func logInButtonAction() {
        if nameTextField.text != userName || passwordTextField.text != password {
            showAlert(with: "Invalid login ore password", and: "Please enter correct login and password")
            passwordTextField.text = ""
        }
    }
    
    
    @IBAction func forgotPasswordButtonAction() {
        showAlert(with: "Oops!", and: "Your password is Password 😎")
    }
    
    @IBAction func forgotNameButtonAction() {
        showAlert(with: "Oops!", and: "Your name is User 😁")
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        nameTextField.text = ""
        passwordTextField.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
}

private extension LoginViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


extension LoginViewController: UITextFieldDelegate {

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if nameTextField.text == "" {
            nameTextField.becomeFirstResponder()
        } else if passwordTextField.text == "" {
            passwordTextField.becomeFirstResponder()
        } else {
            logInButtonAction()
            performSegue(withIdentifier: "toWelcomeScreen", sender: nil)
        }
        return true
    }
}


