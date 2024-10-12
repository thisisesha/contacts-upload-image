//
//  DetailsViewController.swift
//  Assignment5V2
//
//  Created by Esha Chiplunkar on 10/9/24.
//

import UIKit

class DetailsViewController: UIViewController {

    var contact: Contact = Contact()
    var mainScreenDelegate: ViewController!
    
    let detailsScreen = DetailsView()
    
    let editController = AddNewContactViewController()
    
    override func loadView() {
        view = detailsScreen
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contact Details"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(onEditButtonTapped))
     
        self.view.backgroundColor = .white
                
        detailsScreen.configure(with: contact)
    }
    
    @objc func onEditButtonTapped() {
        editController.contact = contact
        editController.mainScreenDelegate = mainScreenDelegate
        editController.detailsScreenDelegate = self
        navigationController?.pushViewController(editController, animated: true)
        
    }
    
    func updateProfileOnDetailsScreen() {
        detailsScreen.image.image = contact.image
        detailsScreen.nameLabel.text = contact.name
        detailsScreen.emailLabel.text = "Email: \(contact.email ?? "No email found")"
        detailsScreen.phnoLabel.text = "Phone: \(contact.phone ?? "No phone found") (\(contact.typeOfPhone ?? "No type found"))"
        
        detailsScreen.addressTitleLabel.text = "Address:"
        detailsScreen.addressLabel.text = "\(contact.address ?? "No address found")"
        detailsScreen.cityLabel.text = "\(contact.city ?? "No city found")"
        detailsScreen.zipLabel.text = "\(contact.zip ?? "No zip found")"
    }

}
