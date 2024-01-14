//
//  SettingViewController.swift
//  MyToday
//
//  Created by Ch. Shan on 12/29/23.
//

import UIKit
import Loaf
import CoreData

class SettingViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var switchButton: UISwitch!
    
    @IBOutlet weak var userName: UILabel!
    
    let userCoreDataManager = UserCoreDataManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Settings"
        editImageandView()
        
        profileImage()
        userLoginName()
    }
    
    @IBAction func accountButtonTapped(_ sender: Any) {
        
        let accountVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        accountVC.userImage = { image in
            self.profileImageView.image  = image
        }
        self.navigationController?.pushViewController(accountVC, animated: true)
        
    }
    
    @IBAction func appIconButtonTapped(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AppIconViewController") as! AppIconViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func switchButtonTapped(_ sender: UISwitch ) {
        if #available(iOS 13.0 , *){
            let appDelegate = UIApplication.shared.windows.first
            if sender.isOn{
                appDelegate?.overrideUserInterfaceStyle = .dark
                return
            }
            appDelegate?.overrideUserInterfaceStyle = .light
        }else {
            Loaf("Dark mode is not available for iOS versions lower than 13.0", state: .error, location: .top, sender: self).show()
        }
    }
    
    @IBAction func privaryButtonTapped(_ sender: Any) {
    }
    
    @IBAction func helpCenterButtonTapped(_ sender: Any) {
    }
    
    @IBAction func logOutButtonTapped(_ sender: Any) {
    }
    
    
    func editImageandView(){
        
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        
    }
    
    
    func profileImage(){
        let userId = UserDefaults.standard.string(forKey: "isUserId") ?? ""
        let imageData = userCoreDataManager.getImage(id: UUID(uuidString: userId)!)
        
        if let imageData = imageData{
            let image = UIImage(data: imageData)
            profileImageView.image = image
        }
    }
    
    func userLoginName(){
        let isUserId = UserDefaults.standard.string(forKey: "isUserId") ?? ""
        let user = userCoreDataManager.getUserById(id: UUID(uuidString: isUserId)!)
        userName.text = user?.name
    }
}
