//
//  SignUpViewController.swift
//  VT6002CEM_217109054
//
//  Created by User on 3/1/2022.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var SignUpButton: UIButton!
    
    @IBOutlet weak var ErrorLabel: UILabel!
    
    override func viewDidLoad() {
            super.viewDidLoad()

            setUpElements()
        }
        
        func setUpElements() {
        
            // Hide the error label
            ErrorLabel.alpha = 0
        
            // Style the elements
            Utilities.styleTextField(firstNameTextField)
            Utilities.styleTextField(lastNameTextField)
            Utilities.styleTextField(EmailTextField)
            Utilities.styleTextField(PasswordTextField)
            Utilities.styleFilledButton(SignUpButton)
        }
        
        // Check the fields and validate that the data is correct. If everything is correct, this method returns nil. Otherwise, it returns the error message
        func validateFields() -> String? {
            
            // Check that all fields are filled in
            if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                EmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                PasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
                
                return "Please fill in all fields."
            }
            
            // Check if the password is secure
            let cleanedPassword = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if Utilities.isPasswordValid(cleanedPassword) == false {
                // Password isn't secure enough
                return "Please make sure your password is at least 8 characters, contains a special character and a number."
            }
            
            return nil
        }
    
    
    @IBAction func SignUpTapped(_ sender: Any) {
        
        // Validate the fields
                let error = validateFields()
                
                if error != nil {
                    
                    // There's something wrong with the fields, show error message
                    showError(error!)
                }
                else {
                    
                    // Create cleaned versions of the data
                    let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                    let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                    let email = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                    let password = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                    
                    // Create the user
                    Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                        
                        // Check for errors
                        if err != nil {
                            self.present(Service.createAlertController(title: "Error", message: err!.localizedDescription), animated:true ,completion: nil)
                            
                            // There was an error creating the user
                            self.showError("Error creating user")
                            return
                        }
                        else {
                            
                            // User was created successfully, now store the first name and last name
                            let db = Firestore.firestore()
                            
                            db.collection("user").addDocument(data: ["FirstName":firstName, "LastName":lastName, "uid": result!.user.uid ]) { (error) in
                                
                                if error != nil {
                                    self.present(Service.createAlertController(title: "Error", message: error!.localizedDescription), animated:true ,completion: nil)
                                    // Show error message
                                    self.showError("Error saving user data")
                                    return
                                }
                            }
                            
                            // Transition to the home screen
                            self.transitionToHome()
                        }
                        
                    }
                    
                    
                    
                }
            }
            
            func showError(_ message:String) {
                
               // ErrorLabel.text = message
               // ErrorLabel.alpha = 1
            }
            
            func transitionToHome() {
                
                let MainTabController = storyboard?.instantiateViewController(withIdentifier: "MainTabController") as! MainTabController
                                self.present(MainTabController, animated: true,completion: nil)
                
            }
            
        }
