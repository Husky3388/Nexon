//
//  DetailView.swift
//  Nexon
//
//  Created by Jason Thai on 6/9/20.
//  Copyright © 2020 Jason Thai. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    let game : Game
    @State private var selection: Int? = nil
    
    var body: some View {
        ZStack {
            Image(game.background)
                .resizable()
                .aspectRatio(contentMode: .fit)
//                .frame(width: 1000, height: 1000, alignment: .center)
//                .padding(.leading, 550)
            LinearGradient(gradient: Gradient(colors: [Color("ColorModeText"), .clear]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image(game.logo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200, alignment: .center)
                VStack {
                    Text("Genre: \(game.genre)")
                        .foregroundColor(Color.white)
                    Text("Publisher: \(game.publisher)")
                        .foregroundColor(Color.white)
                    Text("Developer: \(game.developer)")
                        .foregroundColor(Color.white)
                    Text("\(game.description)")
                        .foregroundColor(Color.white)
                        .lineLimit(nil)
                }
                
                Button(action: {
                    goToEventsView(self.game.events)
                }) {
                    HStack {
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.title)
                        Text("News & Events")
                            .fontWeight(.semibold)
                            .font(.title)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(40)
                }
            }
        }
    }
}

func goToEventsView(_ events: [Event]) {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: EventsView(events: events))
        window.makeKeyAndVisible()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(game: Game(id: "1", title: "Mabinogi", genre: "MMORPG", publisher: "Nexon America Inc.", developer: "NEXON Korea Corporation", description: "The world’s most expressive MMORPG, where you create a unique character and live your fantasy life.", logo: "mabinogi_logo", icon: "mabinogi_icon", background: "mabinogi_background", events: [Event(id: "1", title: "[UPDATE] Announcement", date: Calendar.current.date(from: DateComponents(year: 2020, month: 5, day: 26, hour: 22, minute: 54, second: 57)), image: "", description: "Announcement description."),
        Event(id: "2", title: "Introducing the Art Corner!", date: Calendar.current.date(from: DateComponents(year: 2020, month: 5, day: 29, hour: 19, minute: 27, second: 48)), image: "", description: "Art Corner description.")]))
    }
}
