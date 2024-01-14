//
//  String+Extension.swift
//  MyToday
//
//  Created by Ch. Shan on 10/27/23.
//

import Foundation


extension String{
    
    func isEmailValid() -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self) // self = value = shan
    }
    
//    func isPasswordValid() -> Bool{
//        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
//        return passwordTest.evaluate(with: self)
//    }

    func isPasswordValid() -> Bool {
        return self.count >= 8
    }
}
