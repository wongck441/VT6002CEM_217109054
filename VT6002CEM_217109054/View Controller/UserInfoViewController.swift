//
//  UserInfoViewController.swift
//  VT6002CEM_217109054
//
//  Created by User on 11/1/2022.
//

import UIKit
import Firebase

class UserInfoViewController: UIViewController{

    @IBOutlet var UserName: UILabel!
    @IBOutlet var ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getData()
    }
    
    func getData(){
        //Get a refenence to the database
        let db = Firestore.firestore()
        //get userID
        UserName.text = Auth.auth().currentUser?.email
    }
    //choose image button
    @IBAction func didTapButton() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }

    //logout function
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
//pick the photo
extension UserInfoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
    
    
    if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
        ImageView.image = image
      }
      picker.dismiss(animated: true, completion: nil)
      }
      
      func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
      picker.dismiss(animated: true, completion: nil)
      }
      }
