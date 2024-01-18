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
            else if self.languageIndex == 1 {
                self.accountLabel.text = "account".localized(loc: "ur")
                self.languagesLabel.text = "languages".localized(loc: "ur")
                self.appIconLabel.text = "app_icon".localized(loc: "ur")
                self.changeModeLabel.text = "change_mode".localized(loc: "ur")
                self.privacyLabel.text = "privacy_policy".localized(loc: "ur")
                self.helpCenterLabel.text = "help_center".localized(loc: "ur")
                self.logOutLabel.text = "log_out".localized(loc: "ur")
            }
            else if self.languageIndex == 2 {
                self.accountLabel.text = "account".localized(loc: "hi")
                self.languagesLabel.text = "languages".localized(loc: "hi")
                self.appIconLabel.text = "app_icon".localized(loc: "hi")
                self.changeModeLabel.text = "change_mode".localized(loc: "hi")
                self.privacyLabel.text = "privacy_policy".localized(loc: "hi")
                self.helpCenterLabel.text = "help_center".localized(loc: "hi")
                self.logOutLabel.text = "log_out".localized(loc: "hi")
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
            else if self.languageIndex == 4 {
                self.accountLabel.text = "account".localized(loc: "de")
                self.languagesLabel.text = "languages".localized(loc: "de")
                self.appIconLabel.text = "app_icon".localized(loc: "de")
                self.changeModeLabel.text = "change_mode".localized(loc: "de")
                self.privacyLabel.text = "privacy_policy".localized(loc: "de")
                self.helpCenterLabel.text = "help_center".localized(loc: "de")
                self.logOutLabel.text = "log_out".localized(loc: "de")
            }
            else if self.languageIndex == 5 {
                self.accountLabel.text = "account".localized(loc: "zh-Hant")
                self.languagesLabel.text = "languages".localized(loc: "zh-Hant")
                self.appIconLabel.text = "app_icon".localized(loc: "zh-Hant")
                self.changeModeLabel.text = "change_mode".localized(loc: "zh-Hant")
                self.privacyLabel.text = "privacy_policy".localized(loc: "zh-Hant")
                self.helpCenterLabel.text = "help_center".localized(loc: "zh-Hant")
                self.logOutLabel.text = "log_out".localized(loc: "zh-Hant")
            }
            else if self.languageIndex == 6 {
                self.accountLabel.text = "account".localized(loc: "it")
                self.languagesLabel.text = "languages".localized(loc: "it")
                self.appIconLabel.text = "app_icon".localized(loc: "it")
                self.changeModeLabel.text = "change_mode".localized(loc: "it")
                self.privacyLabel.text = "privacy_policy".localized(loc: "it")
                self.helpCenterLabel.text = "help_center".localized(loc: "it")
                self.logOutLabel.text = "log_out".localized(loc: "it")
            }
            else if self.languageIndex == 7 {
                self.accountLabel.text = "account".localized(loc: "sv")
                self.languagesLabel.text = "languages".localized(loc: "sv")
                self.appIconLabel.text = "app_icon".localized(loc: "sv")
                self.changeModeLabel.text = "change_mode".localized(loc: "sv")
                self.privacyLabel.text = "privacy_policy".localized(loc: "sv")
                self.helpCenterLabel.text = "help_center".localized(loc: "sv")
                self.logOutLabel.text = "log_out".localized(loc: "sv")
            }
            else if self.languageIndex == 8 {
                self.accountLabel.text = "account".localized(loc: "ko")
                self.languagesLabel.text = "languages".localized(loc: "ko")
                self.appIconLabel.text = "app_icon".localized(loc: "ko")
                self.changeModeLabel.text = "change_mode".localized(loc: "ko")
                self.privacyLabel.text = "privacy_policy".localized(loc: "ko")
                self.helpCenterLabel.text = "help_center".localized(loc: "ko")
                self.logOutLabel.text = "log_out".localized(loc: "ko")
            }
            else if self.languageIndex == 9 {
                self.accountLabel.text = "account".localized(loc: "ar")
                self.languagesLabel.text = "languages".localized(loc: "ar")
                self.appIconLabel.text = "app_icon".localized(loc: "ar")
                self.changeModeLabel.text = "change_mode".localized(loc: "ar")
                self.privacyLabel.text = "privacy_policy".localized(loc: "ar")
                self.helpCenterLabel.text = "help_center".localized(loc: "ar")
                self.logOutLabel.text = "log_out".localized(loc: "ar")
            }
            else if self.languageIndex == 10 {
                self.accountLabel.text = "account".localized(loc: "tr")
                self.languagesLabel.text = "languages".localized(loc: "tr")
                self.appIconLabel.text = "app_icon".localized(loc: "tr")
                self.changeModeLabel.text = "change_mode".localized(loc: "tr")
                self.privacyLabel.text = "privacy_policy".localized(loc: "tr")
                self.helpCenterLabel.text = "help_center".localized(loc: "tr")
                self.logOutLabel.text = "log_out".localized(loc: "tr")
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
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        self.navigationController?.pushViewController(vc, animated: true)
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
