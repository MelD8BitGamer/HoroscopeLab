//
//  AppError.swift
//  HoroscopeLab
//
//  Created by Melinda Diaz on 1/13/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//

import Foundation
//This error handling helps you detect an error instead of crashing your app. Sometimes errors are cause by the network so these cases show the error instead of working blindly.
enum AppError: Error {
    case badURL(String) //this is an associated value it captures a value along side the case. to store any relevant data
    case noResponse
    case networkClientError(Error)
    case noData
    case decodingError(Error)
    case badStatusCode(Int) //bad status codes 484, 500 etc
    case encodingError(Error)
}
