//
//  Contact.swift
//  Assignment5V2
//
//  Created by Esha Chiplunkar on 10/9/24.
//

import Foundation
import UIKit

struct Contact{
    var name: String?
    var email: String?
    var phone: String?
    var typeOfPhone: String?
    var address: String?
    var city: String?
    var zip: String?
    var image: UIImage?
    
    init(name: String? = nil, email: String? = nil, phone: String? = nil, typeOfPhone: String? = nil,
         address: String? = nil, city: String? = nil, zip: String? = nil, image: UIImage) {
        self.name = name
        self.email = email
        self.phone = phone
        self.typeOfPhone = typeOfPhone
        self.address = address
        self.city = city
        self.zip = zip
        self.image = image
    }
    
}
