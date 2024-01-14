//
//  SignInViewController.swift
//  MyToday
//
//  Created by Ch. Shan on 10/25/23.
//

import UIKit
import Loaf

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var rememberMeButton: UIButton!
    
    @IBOutlet weak var passwordHideButton: UIButton!
    
    @IBOutlet weak var signInButton: UIButton!
    
    let userCoreDataManager = UserCoreDataManager()
    
    var rememberMeIcon: Bool = false
    
    var iconClick = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordInDots()
        // Do any additional setup after loading the view.
        signInButton.setThemeColor()
        // hello shan 2
    }
    
    func passwordInDots(){
        
        passwordTF.isSecureTextEntry = true
        
    }
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        
        
        let enteredEmail = emailTF.text ?? ""
        let enteredPassword = passwordTF.text ?? ""
        
        if enteredEmail.lowercased() == "" {
            
            Loaf("Pleease enter the email", state: .error, location: .top, sender: self).show()
            
        }else if enteredPassword == "" {
            
            Loaf("Please entered the password", state: .error, location: .top, sender: self).show()
            
        }else if !enteredEmail.lowercased().isEmailValid(){
            
            Loaf("Please enter valid email", state: .error, location: .top, sender: self).show()
            
        }else if !enteredPassword.isPasswordValid(){
            
            Loaf("Pleease enter atleast eight characters", state: .error, location: .top, sender: self).show()
            
        }else if userCoreDataManager.getUser(forEmail: enteredEmail, password: enteredPassword) == nil{ // email or passsword invalid
            Loaf("Email or password is not correct", state: .error, location: .top, sender: self).show()
            
        }else {
            guard let user = userCoreDataManager.getUser(forEmail: enteredEmail, password: enteredPassword) else { return }
            let userId = user.id ?? UUID()
            
            if rememberMeIcon == true{
                UserDefaults.standard.set(true, forKey: "isRememberMe")
                
            }
            
            UserDefaults.standard.set(userId.uuidString, forKey: "isUserId")
            
            let tabbar = Tabbar()
            self.navigationController?.pushViewController(tabbar, animated: true)
            Loaf("Success", state: .success, location: .top, sender: self).show()
            
        }
    }
    
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    @IBAction func forgotPasswordButtonTapped(_ sender: Any) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ForgetPasswordEmailViewController") as! ForgetPasswordEmailViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func rememberMeButtonTapped(_ sender: Any){
        
        if rememberMeIcon == false {
            
            rememberMeButton.setImage(UIImage(named: "tick-icon"), for: .normal)
        }
        else{
            
            rememberMeButton.setImage(UIImage(named: "square"), for: .normal)
        }
        
        rememberMeIcon.toggle()
        
        
        //        rememberMeButton.setImage(rememberMeIcon == false ?  UIImage(named: "tick-icon") : UIImage(named: "square"), for: .normal)
        //        rememberMeIcon.toggle()
        
    }
    
    @IBAction func passwordHideButton(_ sender: Any){
        
        if iconClick {
            let image = UIImage(named: "showeye")
            passwordHideButton.setImage(image, for: .normal)
            passwordTF.isSecureTextEntry = false
            
        } else {
            let image = UIImage(named: "eyes")
            passwordHideButton.setImage(image, for: .normal)
            passwordTF.isSecureTextEntry = true
        }
        iconClick = !iconClick
        
    }
}

