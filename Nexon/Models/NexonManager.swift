//
//  NexonManager.swift
//  Nexon
//
//  Created by Jason Thai on 6/9/20.
//  Copyright © 2020 Jason Thai. All rights reserved.
//

import Foundation

class NexonManager : ObservableObject {

    @Published var games = [
        Game(id: "1", title: "Mabinogi", genre: "MMORPG", publisher: "Nexon America Inc.", developer: "NEXON Korea Corporation", description: "The world’s most expressive MMORPG, where you create a unique character and live your fantasy life.", logo: "mabinogi_logo", icon: "mabinogi_icon", background: "mabinogi_background",
             events: [Event(id: "1", title: "[UPDATE] Announcement", date: Calendar.current.date(from: DateComponents(year: 2020, month: 5, day: 26, hour: 22, minute: 54, second: 57)), image: "announcement", description: "The Mini Pets have retired and will no longer be available for purchase. Check out the details below."),
                      Event(id: "2", title: "Introducing the Art Corner!", date: Calendar.current.date(from: DateComponents(year: 2020, month: 5, day: 29, hour: 19, minute: 27, second: 48)), image: "art_corner", description: "Calling all artists! Pick up your pens, brushes, and styluses because we're kicking off Mabinogi's very first Art Corner!")])
    ]
}
