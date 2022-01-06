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

    let webView : WKWebView = {
       let prefs = WKWebpagePreferences()
       prefs.allowsContentJavaScript = true
       let configuration = WKWebViewConfiguration()
       configuration.defaultWebpagePreferences = prefs
       let webView = WKWebView(frame: .zero,configuration:configuration)
       return webView
       }()
    
    override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(webView)
    
    guard let url = URL(string: "https://www.hkichdb.gov.hk/en/item.html?98820e30-e1e4-47c3-a809-7beea47d6ee7") else {return}
    webView.load(URLRequest(url: url))
    
    DispatchQueue.main.asyncAfter(deadline: .now()+5) {
      self.webView.evaluateJavaScript("document.body.innerHTML") {
      result, error in guard let html = result as? String, error == nil else {
      return
    }
    print(html)
    }
    }
    }
    
    override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    
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





