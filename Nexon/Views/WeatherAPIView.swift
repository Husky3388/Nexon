//
//  WeatherAPIView.swift
//  Nexon
//
//  Created by Jason Thai on 6/16/20.
//  Copyright © 2020 Jason Thai. All rights reserved.
//

import SwiftUI

struct WeatherAPIView: View {
    
    @ObservedObject var weatherAPIController = WeatherAPIController()
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        return formatter
    }
    
    var body: some View {
        let forecasts = Array(zip(weatherAPIController.weathers.weatherPatterns ?? [], weatherAPIController.weathers.weatherDataConverted ?? []))
        return NavigationView {
            List {
                ForEach(forecasts, id: \.0) { forecast in
                    HStack {
                        Text(forecast.0)
                        Spacer()
                        Image(systemName: forecast.1)
                    }
                }
            }
            .navigationBarTitle(Text(dateFormatter.string(from: Date())), displayMode: .inline)
        }
    }
}

struct WeatherAPIView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherAPIView()
    }
}
