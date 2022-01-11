//
//  WebViewController.swift
//  VT6002CEM_217109054
//
//  Created by User on 7/1/2022.
//

import UIKit
import WebKit
import Firebase

    class WebViewController: UIViewController {
    let webView = WKWebView()
        override func viewDidLoad() {
            super.viewDidLoad()
            view.addSubview(webView)
//url 
            guard let url = URL(string: "https://www.hkichdb.gov.hk/en/item.html?98820e30-e1e4-47c3-a809-7beea47d6ee7")
            else {
                return
            }
            webView.load(URLRequest(url: url))
            // Do any additional setup after loading the view.
            
        }
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            webView.frame = view.bounds
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





