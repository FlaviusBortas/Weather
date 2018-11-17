//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Flavius on 11/17/18.
//  Copyright © 2018 Flavius. All rights reserved.
//

import Foundation

class WeatherData: Codable {
    let currently: Currently?
}

struct Currently: Codable {
    let summary: String
    let temperature: Double
    let humidity: Double
    let windSpeed: Double
    let visibility: Double
}
