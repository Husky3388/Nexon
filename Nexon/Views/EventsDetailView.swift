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
        EventsDetailView(event: TestData.mabinogi_event1)
    }
}
