//
//  ViewController.swift
//  WeatherApp
//
//  Created by Flavius on 11/14/18.
//  Copyright © 2018 Flavius. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let manager = NetworkManager()
    let apiURL = "https://api.darksky.net/forecast/89a75c7923bad9791388cd1b44da01f3/37.8267,-122.4233"
    var weatherData: WeatherData?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData() {
        manager.loadData(from: apiURL) { (apiWeatherData: WeatherData) in
            self.weatherData = apiWeatherData
        }
    }
}

