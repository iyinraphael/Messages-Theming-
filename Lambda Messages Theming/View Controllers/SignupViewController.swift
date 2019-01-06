//
//  SignupViewController.swift
//  UIAppearanceAndAnimation
//
//  Created by Spencer Curtis on 8/20/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        styleSignupButton()
        
        view.backgroundColor = Appearance.backgroundGray
        
        guard AuthenticationHelper.currentUser != nil else { return }
        
        performSegue(withIdentifier: "ViewMessageList", sender: nil)
    }
    
    @IBAction func signUp(_ sender: Any) {
        guard let username = usernameTextField.text else { return }
        
        AuthenticationHelper.setCurrentUser(to: username)
        
        performSegue(withIdentifier: "ViewMessageList", sender: nil)
    }
    
    func styleSignupButton(){
        signupButton.backgroundColor = Appearance.lambdaRed
        let cornerRadius = max(signupButton.frame.width, signupButton.frame.height) / 8.0
        signupButton.setTitle("Add", for: .normal)
        signupButton.setTitleColor(.white, for: .normal)
        signupButton.layer.cornerRadius = cornerRadius
    }
    
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
}
