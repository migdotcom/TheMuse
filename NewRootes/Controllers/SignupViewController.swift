//
//  SignupViewController.swift
//  NewRootes
//
//  Created by Alvaro Sanchez on 2/22/20.
//  Copyright © 2020 Alvaro Sanchez. All rights reserved.
//

import UIKit
import Firebase

class SignupViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("puto")
    }
    
    
    
    
    @IBAction func signupPressed(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text{
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let e = error{
                print(e.localizedDescription)
            }else{
                //Navigate to chat view controller
                self.performSegue(withIdentifier: K.registerSegue, sender: self)
            }
            
            }
        }
    }
    
}
