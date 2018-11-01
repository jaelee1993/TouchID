//
//  ViewController.swift
//  TouchID
//
//  Created by Jae Lee on 10/31/18.
//  Copyright © 2018 Jae Lee. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func loginWithTouchId(_ sender:Any)
    {
        self.authenticateUserTouchID()
    }
    
    
    
    
    func authenticateUserTouchID() {
        
        let context : LAContext = LAContext()
        
        // Declare a NSError variable.
        
        let myLocalizedReasonString = "Authentication is needed to access your Home ViewController."
        
        var authError: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &authError) {
            
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: myLocalizedReasonString) { success, evaluateError in
                
                if success // IF TOUCH ID AUTHENTICATION IS SUCCESSFUL, NAVIGATE TO NEXT VIEW CONTROLLER
                {
                    
                    DispatchQueue.main.async{
                        
                        print("Authentication success by the system")
                        
                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                        
                        let homeVC = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                        
                        self.present(homeVC, animated: true, completion: nil)
                        
                    }
                    
                }
                    
                else // IF TOUCH ID AUTHENTICATION IS FAILED, PRINT ERROR MSG
                {
                    
                    if let error = evaluateError {
                        print(error.localizedDescription)
                    }
                    
                }
                
            }
            
        }
        
    }
    
    
    
    
    
    
    
}

