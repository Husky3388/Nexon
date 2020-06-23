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
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView(events: TestData.mabinogi_events)
    }
}
