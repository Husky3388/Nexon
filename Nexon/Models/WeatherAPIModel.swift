//
//  WeatherAPIModel.swift
//  Nexon
//
//  Created by Jason Thai on 6/16/20.
//  Copyright © 2020 Jason Thai. All rights reserved.
//

import Foundation

struct WeatherAPI : Decodable {
    var from: String?
    var forecast: [String: [Int]]?
    var weatherPatterns: [String]?
    var weatherData: [Int]?
    var weatherDataConverted: [String]?
}
