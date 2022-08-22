//
//  InformationViewController.swift
//  RegistrationViewControlier
//
//  Created by mac on 8/21/22.
//

import UIKit

class InformationViewController: UIViewController {
    
    var user: UserModel!
    
    @IBOutlet var imageView: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "\(user.name) \(user.surname)"
        
        
    }
    
    private let profileImageView: UIImageView {
        let imV = UIImageView()
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
