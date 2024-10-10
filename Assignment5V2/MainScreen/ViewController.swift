//
//  ViewController.swift
//  Assignment5V2
//
//  Created by Esha Chiplunkar on 10/9/24.
//

import UIKit

class ViewController: UIViewController {
    
    let mainScreen = MainScreenView()
    
    var contacts = [Contact]()
        
    override func loadView() {
        view = mainScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Contacts"
        
        mainScreen.tableViewContacts.separatorStyle = .none
        mainScreen.tableViewContacts.register(TableViewContactsCell.self, forCellReuseIdentifier: "contacts")
        mainScreen.tableViewContacts.dataSource = self
        mainScreen.tableViewContacts.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self,
            action: #selector(onAddBarButtonTapped)
        )
        
        let customBackButton = UIBarButtonItem()
        customBackButton.title = "My Contacts"
        navigationItem.backBarButtonItem = customBackButton
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = mainScreen.tableViewContacts.indexPathForSelectedRow {
            mainScreen.tableViewContacts.deselectRow(at: indexPath, animated: true)
        }
    }
    
    
    @objc func onAddBarButtonTapped(){
        let addContactController = AddNewContactViewController()
        addContactController.delegate = self
        navigationController?.pushViewController(addContactController, animated: true)
    }
    
    
    func delegateOnAddContact(contact: Contact){
        contacts.append(contact)
        mainScreen.tableViewContacts.reloadData()
    }
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contacts", for: indexPath) as! TableViewContactsCell
        
        let contact = contacts[indexPath.row]
        
        cell.labelName.text = contact.name
        cell.labelEmail.text = contact.email
        if let uwPhone = contact.phone, let uwType = contact.typeOfPhone {
            cell.labelPhone.text = uwPhone + " (" + uwType + ")"
        }
        if let uwImage = contacts[indexPath.row].image{
            cell.image.image = uwImage
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedContact = contacts[indexPath.row]
                
        let detailsViewController = DetailsViewController()
        detailsViewController.contact = selectedContact
                
        navigationController?.pushViewController(detailsViewController, animated: true)
    }

}


