//
//  LoginViewController.swift
//  VT6002CEM_217109054
//
//  Created by User on 3/1/2022.
//

import UIKit
import FirebaseAuth

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
                        self.ErrorLabel.text = error!.localizedDescription
                        self.ErrorLabel.alpha = 1
                    }
                    else {
                        
                        let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.HomeViewController) as? HomeViewController
                        
                        self.view.window?.rootViewController = homeViewController
                        self.view.window?.makeKeyAndVisible()
                    }
                }
            }
            
        }
