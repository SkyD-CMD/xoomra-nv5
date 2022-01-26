//
//  LoginViewController.swift
//  Xoomra
//
//  Created by Nur Rony on 23/1/22.
//

import UIKit
import SimpleCheckbox
//import TextFieldEffects

class LoginViewController: UIViewController {
    
    @IBOutlet weak var buttonBgView: UIView!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.isNavigationBarHidden = true
        
        setupUI()
        initializeHideKeyboard()

    }
    
    // MARK: - Private Methods.
    private func setupUI(){
        buttonBgView.layer.cornerRadius = 10
        loginButton.layer.cornerRadius = 5
    }
    
    
    // MARK: - Button Action.
    @IBAction func loginButtonAction(_ sender: UIButton) {
        print("Log in button is pressed")
        
        let email: String = emailText.text ?? ""
        let password: String = passwordText.text ?? ""
        
        if (email.isEmpty || password.isEmpty){
          let box7 = UIAlertController(title: "Fields are empty", message: "Please fill all fields", preferredStyle: .alert)
            box7.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { action in
                print("Button was pressed")
            }))
            box7.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { action in
                print("OK is pressed")
            }))
           self.present(box7, animated: true)
            
        }
        
        
        else{
            let homeTabbarViewController = storyboard!.instantiateViewController(withIdentifier: "HomeTabBarViewController")
            navigationController?.pushViewController(homeTabbarViewController, animated: true)
            
            
        }
//
        
      
        
        
    }
    
    
    
    
}
