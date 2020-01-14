//
//  File.swift
//  HoroscopeLab
//
//  Created by Melinda Diaz on 1/13/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//

import Foundation

enum SunSign: String {
    case aries
    case taurus
    case gemini
    case cancer
    case leo
    case virgo
    case libra
    case scorpio
    case sagittarius
    case capricorn
    case aquarius
    case pisces
}

struct UserKey {
   static let userName = "Username"
   static let sunSign = "sunSign"
}

class Wrapper {
    
    
    
    static let shared = Wrapper()
    
    private init() {
        //Since the above is already initialized there is no need to do it here
    }
    
    func getData() -> UserInfo? {
        guard let userName = UserDefaults.standard.object(forKey: UserKey.userName ) as? String,
            let sunSign = UserDefaults.standard.object(forKey: UserKey.sunSign) as? String else {
                return nil
        }
        return UserInfo(name: userName, sunSign: SunSign(rawValue: sunSign) ?? SunSign.pisces)
    }
    
    func saveUserData(ex: UserInfo) {
        UserDefaults.standard.set(ex.name, forKey: UserKey.userName)
        UserDefaults.standard.set(ex.sunSign.rawValue, forKey: UserKey.sunSign)
    }
}
