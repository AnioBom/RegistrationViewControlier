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
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var jobLabel: UILabel!
    @IBOutlet var hobbiesLabel: UILabel!
    
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
        ageLabel.text = user.person.age
        genderLabel.text = user.person.gender.rawValue
        jobLabel.text = user.person.job
        hobbiesLabel.text = user.person.hobbies
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageVC = segue.destination as? BiographyViewController else { return }
        imageVC.user = user
    }
}
