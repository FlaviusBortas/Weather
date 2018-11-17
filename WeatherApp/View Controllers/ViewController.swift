//
//  ViewController.swift
//  WeatherApp
//
//  Created by Flavius on 11/14/18.
//  Copyright © 2018 Flavius. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    
    let manager = NetworkManager()
    let apiURL = "https://api.darksky.net/forecast/89a75c7923bad9791388cd1b44da01f3/37.8267,-122.4233"
    let queue = DispatchQueue.main
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData() {
        manager.loadData(from: apiURL) { (apiWeatherData: WeatherData) in
            guard let weatherData = apiWeatherData.currently else { return }
            
            self.queue.async {
                self.summaryLabel.text = weatherData.summary
                self.tempLabel.text = "\(weatherData.temperature)"
                self.humidityLabel.text = "\(weatherData.humidity)"
                self.windSpeedLabel.text = "\(weatherData.windSpeed)"
                self.visibilityLabel.text = "\(weatherData.visibility)"
            }
            
        }
    }
}

