//
//  ViewController.swift
//  FaceRecognitionProject
//
//  Created by mesut alver on 11.11.2022.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    // kullanıcının yüzü yada parmak izi ile erişim sağlamak
    @IBAction func singIngClicked(_ sender: Any) {
        
        
        let authContext = LAContext()
        
        var error: NSError?
        
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it you?") { success, error in
                if success == true {
                    //successfull auth
                    
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    }
                    
                }else {
                    DispatchQueue.main.async {
                        self.myLabel.text = "Error"
                    }
                    
                }
            }
        }
        
        
        
    }
    
    
}

