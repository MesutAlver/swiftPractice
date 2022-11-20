//
//  ViewController.swift
//  foursquareClone
//
//  Created by mesut alver on 19.11.2022.
//

import UIKit
import Parse

class SignUpVC: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        
    }
    
    
    @IBAction func signInClicked(_ sender: Any) {
        
        if usernameTextField.text != "" && passwordTextField.text != "" {
            
            PFUser.logInWithUsername(inBackground: usernameTextField.text!, password: passwordTextField.text!) { user, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    // Segue
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                    
                    
                }
            }
            
            
        } else {
            makeAlert(titleInput: "Error", messageInput: "Username / Password ??")
        }
        
        
        
        
       
    }
    
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if usernameTextField.text != "" && passwordTextField.text != "" {
            
            let user = PFUser()
            user.username = usernameTextField.text!
            user.password = passwordTextField.text!
            
            user.signUpInBackground { succes, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error!")
                } else {
                    //Segue
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
                    
            }
            
        } else {
            makeAlert(titleInput: "Error", messageInput: "Username / Password ??")
            
        }
        
        
        
    }
    
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        
        alert.addAction(okButton)
        self.present(alert,animated: true)
    }
    

}

