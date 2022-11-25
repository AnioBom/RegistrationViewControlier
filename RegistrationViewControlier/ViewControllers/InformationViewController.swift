//
//  InformationViewController.swift
//  RegistrationViewControlier
//
//  Created by mac on 8/21/22.
//

import UIKit

class InformationViewController: UIViewController {
    
    @IBOutlet var photoImage: UIImageView! {
        didSet {
            photoImage.layer.cornerRadius = photoImage.frame.height/2
        }
    }
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var companyLabel: UILabel!
    @IBOutlet var departmentLabel: UILabel!
    @IBOutlet var positionLabel: UILabel!
    
    var user: User!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
       informationLabel()
    }
    
    func informationLabel() {
        photoImage.image = UIImage(named: user.person.photo)
        title = user.person.fullName
        
        nameLabel.text = user.person.name
        surnameLabel.text = user.person.surname
        companyLabel.text = user.person.job.title
        departmentLabel.text = user.person.job.department.rawValue
        positionLabel.text = user.person.job.jobTitle.rawValue
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageVC = segue.destination as? BiographyViewController else { return }
        imageVC.user = user
    }
}
