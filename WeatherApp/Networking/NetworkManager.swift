//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Flavius on 11/17/18.
//  Copyright © 2018 Flavius. All rights reserved.
//

import Foundation

class NetworkManager {
    
    func loadData<T: Decodable>(from urlString: String, completion: @escaping (T) -> ()) {
        // Create configuration
        let configuration = URLSessionConfiguration.ephemeral
        
        // Create Session
        let session = URLSession(configuration: configuration)
        
        // Setup the URL
        let url = URL(string: urlString)!
        
        // Create the task
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Status code or data failed")
                return
            }
            
            if httpResponse.statusCode != 200 {
                print(httpResponse.statusCode)
            }
            
            guard let data = data else {
                print("Couldnt get data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let object = try decoder.decode(T.self, from: data)
                
                completion(object)
            }
            catch {
                print("Error info: \(error)")
            }
        }
        task.resume()
    }
}
