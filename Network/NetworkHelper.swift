//
//  NetworkHelper.swift
//  HoroscopeLab
//
//  Created by Melinda Diaz on 1/13/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//

import Foundation

class NetworkHelper {
    //this static instance is a singleton called shared that can be used anywhere inside your project.
    static let shared = NetworkHelper()
    //we made this private so no one has access to this outside
    private var session: URLSession
    //Classes need to be initialized so YOU MUST ADD THIS for your class. we made it private so that we can use the singleton instead of anyone creating an instance of this class anywhere else
    private init() {
        session = URLSession(configuration: .default)
    }
    
    func performDataTask(request:URLRequest, completion: @escaping (Result<Data,AppError>) ->()) {
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.networkClientError(error)))
            }
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.noResponse))
                return
            }
            switch response.statusCode {
            case 200...299: break
            default:
                completion(.failure(.badStatusCode(response.statusCode)))
            }
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            completion(.success(data))
        }
        dataTask.resume()
        //you need this on order for this function to work. By default this will not be implemented so must put dataTask.resume()
    }
}
