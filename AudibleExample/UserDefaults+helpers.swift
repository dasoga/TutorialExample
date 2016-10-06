//
//  UsersDefault+helpers.swift
//  AudibleExample
//
//  Created by Dante Solorio on 10/5/16.
//  Copyright © 2016 Dante Solorio. All rights reserved.
//

import Foundation

extension UserDefaults {
    enum UserDefaultsKeys: String {
        case isLoggedIn
    }
    
    func setIsLoggedIn(value: Bool){
        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func isLoggedIn()-> Bool{
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
    
}
