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
    
    @IBAction func urlbtn(_ sender: Any) {
            UIApplication.shared.open(URL(string:url[myIndex])! as URL, options: [:], completionHandler:nil)
        }
            }
    

