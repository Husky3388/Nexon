//
//  WeatherAPIController.swift
//  Nexon
//
//  Created by Jason Thai on 6/16/20.
//  Copyright © 2020 Jason Thai. All rights reserved.
//

import Foundation

public class WeatherAPIController: ObservableObject {
    
    @Published var weathers = WeatherAPI()
    
    init(){
        load()
    }
    
    func load() {
        if let url = URL(string: "https://mabi.world/api/forecast/") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(WeatherAPI.self, from: safeData)
                            DispatchQueue.main.async {
                                //                                self.weathers = results
                                var wxList:[Int] = [] // declare this higher as a published var then set to empty here
                                for i in 1...13{ // iterates through 13 types
                                    let type = "type\(i)"
                                    wxList.append(results.forecast![type]?.first ?? 0) // if anything is nil adds 0 as placeholder for 13 items
                                }
//                                print(wxList) // wxList is the published var you would use in the view
                                self.weathers.from = results.from
                                self.weathers.weatherData = wxList
                                self.loadWeatherPatterns()
                                self.convertWeatherData()
                            }
                        } catch {
                            print(safeData)
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
        //        let url = URL(string: "https://mabi.world/api/forecast/")!
        //
        //        URLSession.shared.dataTask(with: url) {(data,response,error) in
        //            do {
        //                if let d = data {
        //                    let decodedLists = try JSONDecoder().decode(WeatherAPI.self, from: d)
        //                    DispatchQueue.main.async {
        //                        print(decodedLists)
        ////                        self.weathers.append(contentsOf: decodedLists)
        //                        self.weathers = decodedLists
        //                    }
        //                }else {
        //                    print("No Data")
        //                }
        //            } catch {
        //                print (error)
        //            }
        //        }.resume()
    }
    
    func loadWeatherPatterns() {
        let weatherPatterns : [String] = [  "Tir Chonaill, Dugald Aisle, Dugald Residential + Castle",
                                            "Dunbarton, Gairech, Port Cobh, Fiodh",
                                            "Bangor",
                                            "Emain Macha",
                                            "Sen Mag, Sen Mag Residential + Castle",
                                            "Port Cean, Morva Aisle",
                                            "Rano, Nubes",
                                            "Connous",
                                            "Courcle, Irai Falls",
                                            "Physis, Zardine",
                                            "Shadow Realm",
                                            "Taillteann, Tara, Corrib Valley, Blago Prairie, Sliab Cuilin, Abb Neagh",
                                            "Unused"]
        self.weathers.weatherPatterns = weatherPatterns
    }
    
    func convertWeatherData() {
        var weatherDataConverted = [String]()
        for data in self.weathers.weatherData! {
            switch data {
            case -8:
                //weatherDataConverted.append("Sunny")
                weatherDataConverted.append("sun.min")
            case -7 ... -1:
                //weatherDataConverted.append("Cloudy")
                weatherDataConverted.append("cloud")
            case 0...19:
                //weatherDataConverted.append("Rainy")
                weatherDataConverted.append("cloud.rain")
            case 20:
                //weatherDataConverted.append("Thunder")
                weatherDataConverted.append("cloud.bolt.rain")
            default:
                //weatherDataConverted.append("Unknown")
                weatherDataConverted.append("")
            }
        }
        self.weathers.weatherDataConverted = weatherDataConverted
    }
}
