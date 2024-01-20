//
//  Tabbar.swift
//  MyToday
//
//  Created by Ch. Shan on 12/6/23.
//

import UIKit

class Tabbar: UITabBarController {
    
    var dashboardNavigation: UINavigationController!
    var upcomingsNavigation: UINavigationController!
    var settingsNavigation: UINavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
    
    }
    
    func setupViewControllers() {
        
        let dashboardVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DashbordViewController") as! DashbordViewController
        dashboardNavigation = UINavigationController(rootViewController: dashboardVC)
        dashboardNavigation.title = "Home"
        dashboardNavigation.tabBarItem.image = UIImage(named: "Home 1")
        tabBar.tintColor = UIColor(hex: 0x24A19C)
        
        let upcomingsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UpComingsViewController") as! UpComingsViewController
        upcomingsNavigation = UINavigationController(rootViewController: upcomingsVC)
        upcomingsNavigation.title = "Upcomings"
        upcomingsNavigation.tabBarItem.image = UIImage(named: "calendar")
        tabBar.tintColor = UIColor(hex: 0x24A19C)
        
        let settingsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SettingViewController") as! SettingViewController
        settingsNavigation = UINavigationController(rootViewController: settingsVC)
        settingsNavigation.title = "Account Settings"
        settingsNavigation.tabBarItem.image = UIImage(named: "Category")
        tabBar.tintColor = UIColor(hex: 0x24A19C)
        
        viewControllers = [dashboardNavigation, upcomingsNavigation, settingsNavigation]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateLabelsLanguage), name: Notification.Name("currentLanguageChanged"), object: nil)
    }
    
    @objc func updateLabelsLanguage() {
        dashboardNavigation.title = "home".makeLocalizationOnLabel()
        upcomingsNavigation.title = "upcomings".makeLocalizationOnLabel()
        settingsNavigation.title = "settings".makeLocalizationOnLabel()
    }
    
}
