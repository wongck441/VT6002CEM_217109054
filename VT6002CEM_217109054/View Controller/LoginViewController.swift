//
//  LoginViewController.swift
//  VT6002CEM_217109054
//
//  Created by User on 3/1/2022.
//

import UIKit
import Firebase
import FirebaseAuth
import LocalAuthentication

class LoginViewController: UIViewController {

    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var LoginButton: UIButton!
    
    @IBOutlet weak var ErrorLabel: UILabel!
    
    override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
            
            setUpElements()
        }
        
        func setUpElements() {
            
            // Hide the error label
            ErrorLabel.alpha = 0
            
            // Style the elements
            Utilities.styleTextField(EmailTextField)
            Utilities.styleTextField(PasswordTextField)
            Utilities.styleFilledButton(LoginButton)
            
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func LoginTapped(_ sender: Any) {
        // TODO: Validate Text Fields
                
                // Create cleaned versions of the text field
                let email = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let password = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                
                // Signing in the user
                Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                    
                    if error != nil {
                        // Couldn't sign in
                       // self.ErrorLabel.text = error!.localizedDescription
                       // self.ErrorLabel.alpha = 1
                        self.present(Service.createAlertController(title: "Error", message: error!.localizedDescription), animated:true ,completion: nil)
                        return
                    }
                    else {
                        
                        let MainTabController = self.storyboard?.instantiateViewController(withIdentifier: "MainTabController") as! MainTabController
                                        self.present(MainTabController, animated: true,completion: nil)
                       // self.performSegue(withIdentifier: "userSignedInSegue", sender:nil)
                    }
                }
            }
            
    
    @IBAction func authenticateUser(_ sender:Any){
        let context = LAContext()
        
        var error: NSError?
        
        if context.canEvaluatePolicy(
            LAPolicy.deviceOwnerAuthenticationWithBiometrics,
            error: &error){
            
            // Device can use biometric authentication
            context.evaluatePolicy(
                LAPolicy.deviceOwnerAuthenticationWithBiometrics,
                localizedReason: "Access requires authentication",
                reply: {(success, error) in
                    DispatchQueue.main.async {
                        if let err = error {
                            switch err._code {
                            case LAError.Code.systemCancel.rawValue:
                                self.notifyUser("Session cancelled",
                                                err: err.localizedDescription)
                            case LAError.Code.userCancel.rawValue:
                                self.notifyUser("Please try again",
                                                err: err.localizedDescription)
                            case LAError.Code.userFallback.rawValue:
                                self.notifyUser("Authentication",
                                                err: "Password option selected")
                            default:
                                self.notifyUser("Authentication failed",
                                                err: err.localizedDescription)
                            }
                            } else {
                                self.notifyUser("Authentication Successful",
                                                err: "You know have full access")
                            
                        }
                    }
                })
        }else {
            // Device cannot use biometric authentication
            if let err = error {
                switch err.code {
                case LAError.Code.biometryNotEnrolled.rawValue:
                    notifyUser("User is not enrolled",
                               err: err.localizedDescription)
                case LAError.Code.passcodeNotSet.rawValue:
                    notifyUser("A passcode has not been set",
                               err: err.localizedDescription)
                case LAError.Code.biometryNotAvailable.rawValue:
                    notifyUser("Biometric authentication not available",
                               err: err.localizedDescription)
                default:
                    notifyUser("Unknown error",
                               err: err.localizedDescription)
                }
            }
        }
    }
    func notifyUser(_ msg: String,err: String?){
        let alert = UIAlertController(title: msg,
                                      message: err,
                                      preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK",
                                         style: .cancel,
                                         handler: nil)
        alert.addAction(cancelAction)
        self.present(alert,
                     animated: true,
                     completion: nil)
    }
        }
