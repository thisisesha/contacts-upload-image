//
//  AddNewContactViewController.swift
//  Assignment5V2
//
//  Created by Esha Chiplunkar on 10/9/24.
//

import UIKit
import PhotosUI

class AddNewContactViewController: UIViewController {
    
    var mainScreenDelegate: ViewController!
    var detailsScreenDelegate: DetailsViewController!
    var edit: Bool = false
    var contact: Contact?
    
    var phoneType = "Home"
    
    var pickedImage: UIImage?
    
    let addContactScreen = AddNewContactView()
    
    override func loadView() {
        view = addContactScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let attribute: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 20),
        ]
        
        navigationController?.navigationBar.titleTextAttributes = attribute
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
        
        // this class now handles both edit and add scenarios.
        if contact != nil {
            initializeContactFields()
            edit = true
            title = "Edit Contact"
        } else {
            edit = false
            title = "Add a New Contact"
        }
        
        addContactScreen.buttonSelectType.menu = getMenuTypes()
        addContactScreen.buttonTakePhoto.menu = getMenuImagePicker()
        addContactScreen.buttonTakePhoto.menu = getMenuImagePicker()
        
        addContactScreen.buttonSave.addTarget(self, action: #selector(onSaveButtonTapped), for: .touchUpInside)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 17)
        ]
    }
    
    func initializeContactFields() {
        if let contact = contact {
            addContactScreen.nameTextField.text = contact.name
            addContactScreen.emailTextField.text = contact.email
            addContactScreen.phnoTextField.text = contact.phone
            addContactScreen.addressTextField.text = contact.address
            addContactScreen.cityTextField.text = contact.city
            addContactScreen.zipTextField.text = contact.zip
            if let img = contact.image {
                self.addContactScreen.buttonTakePhoto.setImage(
                    img.withRenderingMode(.alwaysOriginal),
                    for: .normal
                )   
                self.pickedImage = img
            }
        }
    }
    
    @objc func hideKeyboardOnTap(){
        view.endEditing(true)
    }
    
    @objc func onSaveButtonTapped(){
        if checkEmptyFields() {
            showAlertForEmptyFields()
            return
        }
        
        if !isValidPhoneNumber() {
            showAlertForInvalidPhone()
            return
        }
        
        if let city = addContactScreen.cityTextField.text {
            if !isValidCityState(city) {
                showAlertForInvalidCityState()
                return
            }
        }
        
        if let email = addContactScreen.emailTextField.text {
            if !isValidEmail(email) {
                showAlertForInvalidEmail()
                return
            }
        }
        
        if let zipcode = addContactScreen.zipTextField.text {
            if !isValidZip(zipcode) {
                showAlertForInvalidZip()
                return
            }
        }
        
        let name = addContactScreen.nameTextField.text
        let email = addContactScreen.emailTextField.text
        let phone = addContactScreen.phnoTextField.text
        let address = addContactScreen.addressTextField.text
        let city = addContactScreen.cityTextField.text
        let zip = addContactScreen.zipTextField.text
        
        let newContact = Contact(name: name, email: email, phone: phone, typeOfPhone: phoneType, address: address, city: city, zip: zip, image: pickedImage ?? (UIImage(systemName: "person.fill"))!)
        
        if edit {
            detailsScreenDelegate.contact = newContact
            detailsScreenDelegate.updateProfileOnDetailsScreen()
            mainScreenDelegate.delegateOnEditContact(contact: newContact)
        } else {
            mainScreenDelegate.delegateOnAddContact(contact: newContact)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidZip(_ zipCode: String) -> Bool {
        let zipRegex = "^[0-9]{5}$"
        let zipPred = NSPredicate(format: "SELF MATCHES %@", zipRegex)
        
        if zipPred.evaluate(with: zipCode) {
            // Convert to integer and check the range
            if let zipCodeInt = Int(zipCode), zipCodeInt >= 1 && zipCodeInt <= 99950 {
                return true
            }
        }
        return false
    }
    
    func checkEmptyFields() -> Bool {
        if addContactScreen.nameTextField.text?.isEmpty == true ||
            addContactScreen.emailTextField.text?.isEmpty == true ||
            addContactScreen.phnoTextField.text?.isEmpty == true ||
            addContactScreen.addressTextField.text?.isEmpty == true ||
            addContactScreen.cityTextField.text?.isEmpty == true ||
            addContactScreen.zipTextField.text?.isEmpty == true {
            return true
        }
        return false
    }
    
    func isValidPhoneNumber() -> Bool {
        if let phno = addContactScreen.phnoTextField.text, phno.count != 10 {
            return false
        }
        return true;
    }
    
    func isValidCityState(_ cityState: String) -> Bool {
        let parts = cityState.split(separator: ",")
        return parts.count == 2 && !parts[0].isEmpty && !parts[1].isEmpty
    }
    
    func showAlertForInvalidEmail() {
        let alert = UIAlertController(title: "Error!", message: "Invalid Email Id!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true)
    }
    
    func showAlertForInvalidZip() {
        let alert = UIAlertController(title: "Error!", message: "Invalid Zip code!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true)
    }
    
    func showAlertForEmptyFields() {
        let alert = UIAlertController(title: "Error!", message: "All fields are mandatory!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true)
    }
    
    func showAlertForInvalidPhone() {
        let alert = UIAlertController(title: "Error!", message: "Invalid Phone number!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true)
    }
    
    func showAlertForInvalidCityState() {
        let alert = UIAlertController(title: "Error!", message: "Please enter in City, State format!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true)
    }
    
    func getMenuTypes() -> UIMenu{
        var menuItems = [UIAction]()
        
        for type in Utilities.typesOfPhones{
            let menuItem = UIAction(title: type,handler: {(_) in
                self.phoneType = type
                self.addContactScreen.buttonSelectType.setTitle(self.phoneType, for: .normal)
            })
            menuItems.append(menuItem)
        }
        
        return UIMenu(title: "Select Label", children: menuItems)
    }
    
    func getMenuImagePicker() -> UIMenu{
        let menuItems = [
            UIAction(title: "Camera", handler: {(_) in
                self.pickUsingCamera()
            }),
            UIAction(title: "Gallery", handler: {(_) in
                self.pickPhotoFromGallery()
            })
        ]
        
        return UIMenu(title: "Select source", children: menuItems)
    }
    
    func pickUsingCamera(){
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
    }
    
    func pickPhotoFromGallery(){
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = 1
        
        let photoPicker = PHPickerViewController(configuration: configuration)
        
        photoPicker.delegate = self
        present(photoPicker, animated: true, completion: nil)
    }
}

extension AddNewContactViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage{
            self.addContactScreen.buttonTakePhoto.setImage(
                image.withRenderingMode(.alwaysOriginal),
                for: .normal
            )
            self.pickedImage = image
        } else {
        }
    }
}

extension AddNewContactViewController: PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        print(results)
        
        let itemprovider = results.map(\.itemProvider)
        
        for item in itemprovider{
            if item.canLoadObject(ofClass: UIImage.self){
                item.loadObject(ofClass: UIImage.self, completionHandler: { (image, error) in
                    DispatchQueue.main.async{
                        if let uwImage = image as? UIImage{
                            self.addContactScreen.buttonTakePhoto.setImage(
                                uwImage.withRenderingMode(.alwaysOriginal),
                                for: .normal
                            )
                            self.pickedImage = uwImage
                        }
                    }
                })
            }
        }
    }
}

extension AddNewContactViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Utilities.typesOfPhones.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Utilities.typesOfPhones[row]
    }
}
