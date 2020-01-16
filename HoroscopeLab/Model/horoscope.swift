//
//  horoscope.swift
//  HoroscopeLab
//
//  Created by Melinda Diaz on 1/13/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//

import Foundation

struct Horoscope: Codable {
    let sunSign: String
    let date: String
    let horoscope: String
    
    enum CodingKeys: String, CodingKey {
        case sunSign = "sunsign"
        case date
        case horoscope
    }
}



//Coding keys are meant to take RAW DATA and make it more swiftly. You can make them how you want it as long as it is Swiftly. If you are using variables that are spelled the same way as the JSON data then there is no need to make an associated value. Snake_Keys and other forms of text are not accepted in Swift so you must use this. MAKE SURE IT CONFORMS TO CODING KEY AND THE NAME OF THE ENUM MUST BE CODINGKEYS!!! If you fail to do this then you will get all type of errors
