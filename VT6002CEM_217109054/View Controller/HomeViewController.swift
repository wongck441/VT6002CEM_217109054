//
//  HomeViewController.swift
//  VT6002CEM_217109054
//
//  Created by User on 3/1/2022.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //logout button
    @IBAction func logoutButton_Tapped(_ sender: Any) {
        let auth = Auth.auth()

        do{
           try auth.signOut()
           let defaults = UserDefaults.standard
           defaults.set(false, forKey: "isUserSignedIn")
           self.dismiss(animated: true, completion: nil)
           }catch let signOutError {
           self.present(Service.createAlertController(title: "Error", message: signOutError.localizedDescription), animated:true ,completion: nil)
            }
            }
            }
