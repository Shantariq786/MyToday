//
//  forgotPasswordNewPasswordViewController.swift
//  MyToday
//
//  Created by Ch. Shan on 11/1/23.
//

import UIKit
import Loaf

class forgotPasswordNewPasswordViewController: UIViewController {
    
    @IBOutlet weak var newPassword: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!

    
    let userCoreDataManager = UserCoreDataManager()
    
    
    var id: UUID? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func nextButtonTapped(_ sender: Any){
        
        let newPassword = newPassword.text ?? ""
        
        if newPassword == ""{
            Loaf("Password can not be empty", state: .error, location: .top, sender: self).show()
            
        }else if !newPassword.isPasswordValid(){
            Loaf("Enter the correct formate of password", state: .error, location: .top, sender: self).show()
            
        }
        else {
            
            userCoreDataManager.editUser(id: id ?? UUID(), newPassword: newPassword)
            self.navigationController?.popViewControllers(viewsToPop: 2)
            
        }
    }
    
}
