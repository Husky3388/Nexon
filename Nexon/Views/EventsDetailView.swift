//
//  EventsDetailView.swift
//  Nexon
//
//  Created by Jason Thai on 6/13/20.
//  Copyright © 2020 Jason Thai. All rights reserved.
//

import SwiftUI

struct EventsDetailView: View {
    
    let event : Event
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        return formatter
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text(event.title)
                Text(self.dateFormatter.string(from: event.date!))
                Image(event.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(event.description)
                Spacer()
            }
        }
    }
}

struct EventsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventsDetailView(event: Event(id: "1", title: "[UPDATE] Announcement", date: Calendar.current.date(from: DateComponents(year: 2020, month: 5, day: 26, hour: 22, minute: 54, second: 57)), image: "announcement", description: "The Mini Pets have retired and will no longer be available for purchase. Check out the details below."))
    }
}
