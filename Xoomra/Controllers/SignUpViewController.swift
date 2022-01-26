//
//  SignUpViewController.swift
//  Xoomra
//
//  Created by Nur Rony on 22/01/2022.
//

import UIKit
import TextFieldEffects
import Firebase


class SignUpViewController: UIViewController {
    
    
    private var usercontrol = UserController.getInstance()

    
    @IBOutlet weak var textFieldBackgroundView: UIView!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNoTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var dobTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    
    let datePicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.isNavigationBarHidden = true
        setupUI()
        initializeHideKeyboard()
        showDatePicker()
////        let db = Firestore.firestore()
        
        
        print("Loading viewload")
//        let name: String = "Earth"
//        let email: String = "Earth@"
//        let phonenumber: String = "+rty"
//        let address : String = "Solar"
//        let password: String = "World"
//        let conpassword : String = "World"
//        usercontrol.registerUser(newUser: Register(name: name, email: email, address: address, phonenumber: phonenumber, password: password, conpassword: conpassword))
//        print("Done saving data to xcode")
//
    }
    
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .dateAndTime
 
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        dobTextField.inputAccessoryView = toolbar
        dobTextField.inputView = datePicker
    }
    
    @objc func donedatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy hh:mm a"
        dobTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    
    // MARK: - Private Methods.
    func setupUI(){
        textFieldBackgroundView.layer.cornerRadius = 10
        registerButton.layer.cornerRadius = 5
        
        datePicker.frame = CGRect(x: 10, y: 50, width: self.view.frame.width, height: 200)
    }
 
    // MARK: - Button Action.
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func btnRegisteruser(_ sender: Any) {
        
        print("Register button is pressed")
        let name: String = fullNameTextField.text ?? ""
        let email: String = emailTextField.text ?? ""
        let phonenumber: String = phoneNoTextField.text ?? ""
        let address : String = addressTextField.text ?? ""
        let password: String = passwordTextField.text ?? ""
        let conpassword : String = confirmPasswordTextField.text ?? ""
        if (name.isEmpty || email.isEmpty || phonenumber.isEmpty || address.isEmpty || password.isEmpty || conpassword.isEmpty){
          let box3 = UIAlertController(title: "Fields are empty", message: "Please fill all fields", preferredStyle: .alert)
            box3.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { action in
                print("Button was pressed")
            }))
            box3.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { action in
                print("OK is pressed")
            }))
           self.present(box3, animated: true)
        }
        else if  (password != conpassword){
            let box = UIAlertController(title: "Passwords do not match", message: "Please enter correct information", preferredStyle: .alert)
            box.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { action in
                print("Button was pressed")
            }))
            box.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { action in
                print("OK is pressed")
               // self.lblShow.text = "Now type same passsword"
               // self.tfEmail.text = ""
                self.passwordTextField.text = ""
                self.confirmPasswordTextField.text = ""
                
            }))
           self.present(box, animated: true)
        }
        else if  (!email.contains("@")){
             print("Email is not in proper format")
             
             let box4 = UIAlertController(title: "Incorrect Email format", message: "Please enter correct email", preferredStyle: .alert)
               box4.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { action in
                   print("Button was pressed")
               }))
               box4.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { action in
                   print("OK is pressed")
                   self.emailTextField.text = ""
               }))
              self.present(box4, animated: true)
         }
        else{
            print("\(name) -- \(email)--\(phonenumber)---\(password)")
                usercontrol.registerUser(newUser: Register(name: name, email: email, address: address, phonenumber: phonenumber, password: password, conpassword: conpassword))
            
            
        }
    }
}
