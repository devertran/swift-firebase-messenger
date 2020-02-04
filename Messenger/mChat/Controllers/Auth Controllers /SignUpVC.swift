//
//  SignUpVC.swift
//  mChat
//
//  Created by Vitaliy Paliy on 11/16/19.
//  Copyright © 2019 PALIY. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController, UITextFieldDelegate {
    
    var signInVC: SignInVC!
    var backButton: AuthBackButton!
    var continueButton: AuthActionButton!
    var signUpView: SignUpView!
    
    var authNetworking: AuthNetworking!
    var authKeyboardHandler = AuthKeyboardHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        authKeyboardHandler.view = view
        authKeyboardHandler.notificationCenterHandler()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func setupUI() {
        view.backgroundColor = .white
        setupGradientView()
        setupRegisterView()
        setupContinueButton()
        setupBackButton()
    }
    
    func setupGradientView() {
        let _ = GradientLogoView(self, true)
    }
    
    func setupRegisterView() {
        signUpView = SignUpView(self)
    }
    
    func setupContinueButton() {
        continueButton = AuthActionButton("CONTINUE", self)
        view.addSubview(continueButton)
        continueButton.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
        continueButton.alpha = 0
        let constraints = [
            continueButton.centerXAnchor.constraint(equalTo: signUpView.centerXAnchor),
            continueButton.centerYAnchor.constraint(equalTo: signUpView.bottomAnchor),
            continueButton.heightAnchor.constraint(equalToConstant: 40),
            continueButton.widthAnchor.constraint(equalToConstant: 200)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
   func setupBackButton() {
        backButton = AuthBackButton(self)
        backButton.alpha = 0
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
    }
    
    @objc func backButtonPressed() {
        dismiss(animated: false) {
            self.signInVC.returnToSignInVC()
        }
    }
    
    func validateTF() -> String?{
        if signUpView.nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || signUpView.emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || signUpView.passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Make sure you fill in all fields."
        }
        
        let password = signUpView.passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let name = signUpView.nameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = signUpView.emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if password.count < 6 {
            return "Password should be at least 6 characters long."
        }
        
        if name.count > 30 {
            return "Your name exceeds a limit of 30 characters."
        }
        
        if email.count > 30 {
            return "Your email exceeds a limit of 30 characters."
        }
        
        if !email.isValidEmail {
            return "Wrong email address format."
        }
        
        return nil
    }
    
    @objc func continueButtonPressed() {
        signUpView.errorLabel.text = ""
        let validation = validateTF()
        if validation != nil {
            signUpView.errorLabel.text = validation
            return
        }
        let email = signUpView.emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        authNetworking = AuthNetworking(self)
        authNetworking.checkForExistingEmail(email) { (errorMessage) in
            guard errorMessage == nil else {
                self.signUpView.errorLabel.text = errorMessage
                return
            }
            self.goToNextController()
        }
    }
    
    func goToNextController(){
        let name = signUpView.nameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = signUpView.emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = signUpView.passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let controller = SelectProfileImageVC()
        controller.modalPresentationStyle = .fullScreen
        controller.name = name
        controller.email = email
        controller.password = password
        self.show(controller, sender: nil)
    }
    
}
