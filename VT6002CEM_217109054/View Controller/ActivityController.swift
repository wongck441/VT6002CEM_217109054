//
//  ActivityController.swift
//  VT6002CEM_217109054
//
//  Created by User on 10/1/2022.
//

import UIKit
import Firebase
    var ALabel = ["Bone Umbrella Manufacturing Activities","White Paper Market Parent-Child Zoo","Make an Automatic Shrinking Umbrella","【Afterlife】Design Exhibition","Hong Kong Traditional Handicraft Exhibition"]
    var AImageView = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg"]
    var DTextView = ["In Liang Suji Umbrella Factory, we will let everyone experience how to make a beautiful bone-shrinking umbrella, and let everyone see every part of the bone-shrinking umbrella, so that everyone can understand how to make a bone-shrinking umbrella.","In the activity of Discovery Park White Paper Market Parent-Child Zoo, we invite children and their parents to order their own umbrellas, and they can also buy umbrellas with Hong Kong style on the spot.","We will take you to make a new automatic bone-shrinking umbrella. Its production method is similar to the traditional bone-shrinking umbrella, but it can shrink automatically, and it is made by hand, and the bone-covering umbrella is permanently guaranteed.","We will show you some trendy umbrellas, these umbrellas are made by some young people, which can make everyone pay more attention to umbrella making.","This is an exhibition of traditional handicrafts in Hong Kong. The exhibits are collected and researched by the Hong Kong Intangible Cultural Heritage Centre, including our umbrella-making craftsmanship and other themed crafts. The content is suitable for the whole family. You can visit the museum if you have time."]
    var url = ["https://www.facebook.com/leungsokee/photos/1189640891549244","https://www.facebook.com/leungsokee/photos/a.179524859227524/596896974156975/","https://www.facebook.com/leungsokee/photos/a.726464381200233/924061358107200/","https://www.facebook.com/leungsokee/photos/a.726464381200233/924061358107200/","https://www.facebook.com/leungsokee/photos/pcb.1272286163284716/1272286133284719/"]
    var myIndex = 0


class ActivityController: UIViewController {
    
    @IBOutlet var myTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    extension ActivityController : UITableViewDelegate, UITableViewDataSource
    {
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return ALabel.count
           }
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = myTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
         cell.textLabel?.text = ALabel[indexPath.row]
         return cell
    }
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
         myIndex = indexPath.row
         myTable.deselectRow(at: indexPath, animated: true)
         performSegue(withIdentifier: "home", sender: self)
      }
      }


