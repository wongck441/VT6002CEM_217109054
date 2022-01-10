//
//  TableViewController.swift
//  VT6002CEM_217109054
//
//  Created by User on 10/1/2022.
//

import UIKit

class TableViewController: UIViewController {

    
    @IBOutlet weak var ActivityLabel: UILabel!
    
    @IBOutlet weak var ActivityImageView: UIImageView!
    
    @IBOutlet weak var DescriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ActivityLabel.text = ALabel[myIndex]
        ActivityImageView.image = UIImage(named: AImageView[myIndex])
        DescriptionTextView.text = DTextView[myIndex]
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
