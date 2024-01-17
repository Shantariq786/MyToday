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
    
    @IBOutlet weak var accountLabel: UILabel!
    
    @IBOutlet weak var languagesLabel: UILabel!
    
    @IBOutlet weak var appIconLabel: UILabel!
    
    @IBOutlet weak var changeModeLabel: UILabel!
    
    @IBOutlet weak var privacyLabel: UILabel!
    
    @IBOutlet weak var helpCenterLabel: UILabel!
    
    @IBOutlet weak var logOutLabel: UILabel!
    
    let userCoreDataManager = UserCoreDataManager()
    
    var languageIndex = LanguageIndex.currentIndex
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Settings"
        editImageandView()
        
        profileImage()
        userLoginName()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedNotification), name: Notification.Name("currentLanguageChanged"), object: nil)
    }
    
    @objc func methodOfReceivedNotification() {
        DispatchQueue.main.async {
            self.languageIndex = LanguageIndex.currentIndex
            if self.languageIndex == 0 {
                self.accountLabel.text = "account".localized(loc: "en")
                self.languagesLabel.text = "languages".localized(loc: "en")
                self.appIconLabel.text = "app_icon".localized(loc: "en")
                self.changeModeLabel.text = "change_mode".localized(loc: "en")
                self.privacyLabel.text = "privacy_policy".localized(loc: "en")
                self.helpCenterLabel.text = "help_center".localized(loc: "en")
                self.logOutLabel.text = "log_out".localized(loc: "en")
            }
            else if self.languageIndex == 3 {
                self.accountLabel.text = "account".localized(loc: "fr")
                self.languagesLabel.text = "languages".localized(loc: "fr")
                self.appIconLabel.text = "app_icon".localized(loc: "fr")
                self.changeModeLabel.text = "change_mode".localized(loc: "fr")
                self.privacyLabel.text = "privacy_policy".localized(loc: "fr")
                self.helpCenterLabel.text = "help_center".localized(loc: "fr")
                self.logOutLabel.text = "log_out".localized(loc: "fr")
            }
        }
    }
    
    @IBAction func accountButtonTapped(_ sender: Any) {
        
        print("tapped")
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
    
    @IBAction func languagesButtonTapped(_ sender: Any){
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LanguagesViewController") as! LanguagesViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
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
