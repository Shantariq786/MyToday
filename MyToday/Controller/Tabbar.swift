//
//  Tabbar.swift
//  MyToday
//
//  Created by Ch. Shan on 12/6/23.
//

import UIKit

class Tabbar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let dashbordVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DashbordViewController") as! DashbordViewController
        
        let dashbordNavigation = UINavigationController(rootViewController: dashbordVC)
        
        tabBar.tintColor = UIColor(hex: 0x24A19C)
        
        dashbordNavigation.title = "Home"
        dashbordNavigation.tabBarItem.image = UIImage.init(named: "Home 1")
        
        
        
        let upComingsVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UpComingsViewController") as! UpComingsViewController
        let upComingVcNavigation = UINavigationController(rootViewController: upComingsVc)
        
        tabBar.tintColor = UIColor(hex: 0x24A19C)
        
        upComingVcNavigation.title = "Upcomings"
        upComingVcNavigation.tabBarItem.image = UIImage.init(named: "calendar")
        
        

        
        
        let settingsVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SettingViewController") as! SettingViewController
        let settingsVcNavigation = UINavigationController(rootViewController: settingsVc)
        
        tabBar.tintColor = UIColor(hex: 0x24A19C)
        
        settingsVcNavigation.title = "Account Settings"
        settingsVcNavigation.tabBarItem.image = UIImage.init(named: "Category")
        
        viewControllers = [dashbordNavigation, upComingVcNavigation, settingsVcNavigation]
        
    }
}






//        let profileVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
//        let profileVcNavigation = UINavigationController(rootViewController: profileVc)
//
//        tabBar.tintColor = UIColor(hex: 0x24A19C)
//
//        profileVcNavigation.title = "Profile"
//        profileVcNavigation.tabBarItem.image = UIImage.init(named: "dashbord")
