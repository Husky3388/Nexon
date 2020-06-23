//
//  NavigationBarFunctions.swift
//  Nexon
//
//  Created by Jason Thai on 6/14/20.
//  Copyright © 2020 Jason Thai. All rights reserved.
//

import Foundation
import SwiftUI

func goToEventsView(_ events: [Event]) {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: EventsView(events: events))
        window.makeKeyAndVisible()
    }
}

func goToContentView() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: ContentView())
        window.makeKeyAndVisible()
    }
}

func goToSettingsView() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: SettingsView())
        window.makeKeyAndVisible()
    }
}

func goToWeatherAPIView() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: WeatherAPIView())
        window.makeKeyAndVisible()
    }
}
