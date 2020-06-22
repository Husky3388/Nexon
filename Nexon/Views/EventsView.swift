//
//  NewsView.swift
//  Nexon
//
//  Created by Jason Thai on 6/11/20.
//  Copyright © 2020 Jason Thai. All rights reserved.
//

import SwiftUI

struct EventsView: View {
    let events : [Event]
    //    @State private var selection: Int? = nil
    @State var showMenu = false
    
    var body: some View {
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        self.showMenu = false
                    }
                }
        }
        
        return NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    MainView(events: self.events, showMenu: self.$showMenu)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                        .disabled(self.showMenu ? true : false)
                    if self.showMenu {
                        MenuView()
                            .frame(width: geometry.size.width/2)
                            .transition(.move(edge: .leading))
                    }
                }
                .gesture(drag)
            }
            .navigationBarTitle("Mabinogi", displayMode: .inline)
            .navigationBarItems(leading: (
                Button(action: {
                    withAnimation {
                        self.showMenu.toggle()
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                }
            ), trailing: (
            HStack {
                NavigationLink(destination: SettingsView()) {
                    Text("Settings")
                }
            }))
        }
    }
}

struct MainView: View {
    let events : [Event]
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    @Binding var showMenu: Bool
    
    var body: some View {
        List(events) { event in
            NavigationLink(destination: EventsDetailView(event: event)) {
                VStack {
                    Text(event.title)
                    Text(self.dateFormatter.string(from: event.date!))
                    Image(event.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text(event.description)
                        .lineLimit(2)
                }
            }
        }
//        .navigationBarTitle("Mabinogi")
//        .navigationBarItems(
//            leading:
//            HStack {
//                NavigationLink(destination: MenuView()) {
//                    Text("Menu")
//                }
//            },
//            trailing:
//            HStack {
//                NavigationLink(destination: SettingsView()) {
//                    Text("Settings")
//                }
//            }
//        )
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView(events: [Event(id: "1", title: "[UPDATE] Announcement", date: Calendar.current.date(from: DateComponents(year: 2020, month: 5, day: 26, hour: 22, minute: 54, second: 57)), image: "announcement", description: "The Mini Pets have retired and will no longer be available for purchase. Check out the details below."),
                            Event(id: "2", title: "Introducing the Art Corner!", date: Calendar.current.date(from: DateComponents(year: 2020, month: 5, day: 29, hour: 19, minute: 27, second: 48)), image: "art_corner", description: "Calling all artists! Pick up your pens, brushes, and styluses because we're kicking off Mabinogi's very first Art Corner!")])
    }
}
