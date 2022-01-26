//
//  users.swift
//  Xoomra
//
//  Created by Humaira Bodi on 2022-01-24.
//

//Task = Register
import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Register : Codable{
    @DocumentID var id : String? = UUID().uuidString
    var name : String = ""
    var email : String = ""
    var address : String = ""
    var phonenumber : String = ""
    var password : String = ""
    var conpassword : String = ""

    init() {

    }
//
//    init(task: String, detail: String){
//        self.task = task
//        self.detail = detail
//        self.completion = false
//        self.dateCreated = Date()
//    }
//
    init(name: String, email: String,address: String, phonenumber: String, password: String, conpassword: String){
        self.name = name
        self.email = email
        self.address = address
        self.phonenumber = phonenumber
        self.password = password
        self.conpassword = conpassword
    }
//
//    //initializer used to parse JSON objects into Swift objects
    init?(dictionary: [String: Any]){
        guard let name = dictionary["name"] as? String else{
            return nil
        }

        guard let email = dictionary["email"] as? String else{
            return nil
        }
        guard let address = dictionary["address"] as? String else{
            return nil
        }

        guard let phonenumber = dictionary["phonenumber"] as? String else{
            return nil
        }

        guard let password = dictionary["password"] as? String else {
            return nil
        }
        guard let conpassword = dictionary["conpassword"] as? String else {
            return nil
        }
        

        self.init(name: name, email: email, address: address, phonenumber: phonenumber, password: password, conpassword: conpassword)
    }
}
