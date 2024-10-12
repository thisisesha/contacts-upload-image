//
//  DetailsView.swift
//  Assignment5V2
//
//  Created by Esha Chiplunkar on 10/9/24.
//

import UIKit

class DetailsView: UIView {

    var nameLabel : UILabel!
    var emailLabel : UILabel!
    var phnoLabel : UILabel!
    var addressTitleLabel: UILabel!
    var addressLabel : UILabel!
    var cityLabel : UILabel!
    var zipLabel : UILabel!
    
    var image: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        setupImage()
        setUpNameLabel()
        setUpEmailLabel()
        setUpPhoneLabel()
        setUpAddressTitleLabel()
        setUpAddressLabel()
        setUpCityLabel()
        setUpZipLabel()
        
        initConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpNameLabel() {
        nameLabel = UILabel()
        nameLabel.font = UIFont.boldSystemFont(ofSize: 22)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLabel)
    }
    
    func setUpEmailLabel() {
        emailLabel = UILabel()
        emailLabel.font = emailLabel.font.withSize(18)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(emailLabel)
    }
    
    func setUpPhoneLabel() {
        phnoLabel = UILabel()
        phnoLabel.font = phnoLabel.font.withSize(18)
        phnoLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(phnoLabel)
    }
    
    func setUpAddressTitleLabel() {
        addressTitleLabel = UILabel()
        addressTitleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        addressTitleLabel.textAlignment = .center
        addressTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(addressTitleLabel)
    }
    
    func setUpAddressLabel() {
        addressLabel = UILabel()
        addressLabel.font = addressLabel.font.withSize(19)
        addressLabel.numberOfLines = 0
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(addressLabel)
    }
    
    func setUpCityLabel() {
        cityLabel = UILabel()
        cityLabel.font = cityLabel.font.withSize(18)
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(cityLabel)
    }
    
    func setUpZipLabel() {
        zipLabel = UILabel()
        zipLabel.font = zipLabel.font.withSize(18)
        zipLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(zipLabel)
    }
    
    func setupImage(){
        image = UIImageView()
        image.image = UIImage(systemName: "photo")
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(image)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            
            image.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            image.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 18),
            image.heightAnchor.constraint(equalToConstant: 100),
            image.widthAnchor.constraint(equalToConstant: 100),
            
            nameLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 18),
            
            emailLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            emailLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 50),
            
            phnoLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            phnoLabel.topAnchor.constraint(equalTo: emailLabel.topAnchor, constant: 36),
            
            addressTitleLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            addressTitleLabel.topAnchor.constraint(equalTo: phnoLabel.topAnchor, constant: 36),
            
            addressLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            addressLabel.topAnchor.constraint(equalTo: addressTitleLabel.topAnchor, constant: 24),
            
            cityLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            cityLabel.topAnchor.constraint(equalTo: addressLabel.topAnchor, constant: 24),
            
            zipLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            zipLabel.topAnchor.constraint(equalTo: cityLabel.topAnchor, constant: 24),
            
        ])
    }
    
    func configure(with contact: Contact) {
        image.image = contact.image
        nameLabel.text = contact.name
        emailLabel.text = "Email: \(contact.email ?? "No email found")"
        phnoLabel.text = "Phone: \(contact.phone ?? "No phone found") (\(contact.typeOfPhone ?? "No type found"))"
        
        addressTitleLabel.text = "Address:"
        addressLabel.text = "\(contact.address ?? "No address found")"
        cityLabel.text = "\(contact.city ?? "No city found")"
        zipLabel.text = "\(contact.zip ?? "No zip found")"
    }

}
