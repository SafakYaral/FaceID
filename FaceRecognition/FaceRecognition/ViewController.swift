//
//  ViewController.swift
//  FaceRecognition
//
//  Created by Safak Yaral on 9.11.2024.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func signButton(_ sender: AnyObject) {
        
        let authContext = LAContext()
        
        var error: NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Please authenticate yourself") {
                success, error in
                
                if success {
                    
                        DispatchQueue.main.async { //Dispatch bu yüz okuma ve parmak izini mainde yapmamız lazım.
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    }
                       
                    
                }else{
                    DispatchQueue.main.async {
                        self.myLabel.text = "Authentication failed" 
                    }
                }
            }
        }
        
    }
    
}

