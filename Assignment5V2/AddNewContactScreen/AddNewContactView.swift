//
//  AddNewContactView.swift
//  Assignment5V2
//
//  Created by Esha Chiplunkar on 10/9/24.
//

import UIKit

class AddNewContactView: UIView {

    var nameTextField : UITextField!
    var buttonTakePhoto: UIButton!
    var emailTextField : UITextField!
    var phoneLabel : UILabel!
    var buttonSelectType: UIButton!
    var phnoTextField : UITextField!
    var addressTextField : UITextField!
    var cityTextField : UITextField!
    var zipTextField : UITextField!
    var buttonSave: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        setUpNameTextField()
        setUpEmailTextField()
        setUpPhoneLabel()
        setupbuttonTakePhoto()
        setUpPhnoTextField()
        setupbuttonSelectType()
        setUpAddressTextField()
        setUpCityTextField()
        setUpZipTextField()
        setupbuttonSave()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpNameTextField() {
        nameTextField = UITextField()
        nameTextField.placeholder = "Name"
        nameTextField.borderStyle = .roundedRect
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameTextField)
    }

    func setUpEmailTextField() {
        emailTextField = UITextField()
        emailTextField.placeholder = "Email"
        emailTextField.borderStyle = .roundedRect
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(emailTextField)
    }
    
    func setUpPhoneLabel() {
        phoneLabel = UILabel()
        phoneLabel.text = "Photo"
        phoneLabel.font = phoneLabel.font.withSize(14)
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(phoneLabel)
    }
    
    func setUpPhnoTextField() {
        phnoTextField = UITextField()
        phnoTextField.placeholder = "Phone number"
        phnoTextField.borderStyle = .roundedRect
        phnoTextField.translatesAutoresizingMaskIntoConstraints = false
        phnoTextField.keyboardType = .phonePad
        self.addSubview(phnoTextField)
    }
    
    func setUpAddressTextField() {
        addressTextField = UITextField()
        addressTextField.placeholder = "Address"
        addressTextField.borderStyle = .roundedRect
        addressTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(addressTextField)
    }
    
    func setUpCityTextField() {
        cityTextField = UITextField()
        cityTextField.placeholder = "City, State"
        cityTextField.borderStyle = .roundedRect
        cityTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(cityTextField)
    }
    
    func setUpZipTextField() {
        zipTextField = UITextField()
        zipTextField.placeholder = "ZIP"
        zipTextField.borderStyle = .roundedRect
        zipTextField.translatesAutoresizingMaskIntoConstraints = false
        zipTextField.keyboardType = .numberPad
        self.addSubview(zipTextField)
        
    }
    
    func setupbuttonSelectType(){
        buttonSelectType = UIButton(type: .system)
        buttonSelectType.setTitle("Home", for: .normal)
        buttonSelectType.showsMenuAsPrimaryAction = true
        buttonSelectType.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSelectType)
    }
    
    func setupbuttonTakePhoto(){
        buttonTakePhoto = UIButton(type: .system)
        buttonTakePhoto.setTitle("", for: .normal)
        buttonTakePhoto.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        buttonTakePhoto.contentHorizontalAlignment = .fill
        buttonTakePhoto.contentVerticalAlignment = .fill
        buttonTakePhoto.imageView?.contentMode = .scaleAspectFit
        buttonTakePhoto.showsMenuAsPrimaryAction = true
        buttonTakePhoto.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonTakePhoto)
    }
    
    func setupbuttonSave(){
        buttonSave = UIButton(type: .system)
        buttonSave.setTitle("Save", for: .normal)
        buttonSave.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSave)
    }
    
    
    func initConstraints() {
        
        NSLayoutConstraint.activate([
                
            nameTextField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            nameTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            nameTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            nameTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            
            buttonTakePhoto.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            buttonTakePhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonTakePhoto.widthAnchor.constraint(equalToConstant: 100),
            buttonTakePhoto.heightAnchor.constraint(equalToConstant: 100),
            
            phoneLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            phoneLabel.topAnchor.constraint(equalTo: buttonTakePhoto.bottomAnchor, constant: 2),
            
            emailTextField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 16),
            emailTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            emailTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            
            phnoTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            phnoTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            phnoTextField.trailingAnchor.constraint(equalTo: buttonSelectType.leadingAnchor, constant: -10),
            
            buttonSelectType.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            buttonSelectType.leadingAnchor.constraint(equalTo: phnoTextField.trailingAnchor, constant: 24),
            buttonSelectType.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            
            addressTextField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            addressTextField.topAnchor.constraint(equalTo: phnoTextField.bottomAnchor, constant: 16),
            addressTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            addressTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            
            cityTextField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            cityTextField.topAnchor.constraint(equalTo: addressTextField.bottomAnchor, constant: 16),
            cityTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            cityTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            
            zipTextField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            zipTextField.topAnchor.constraint(equalTo: cityTextField.bottomAnchor, constant: 16),
            zipTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            zipTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            
            buttonSave.topAnchor.constraint(equalTo: zipTextField.bottomAnchor, constant: 16),
            buttonSave.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                
        ])
    }

}
