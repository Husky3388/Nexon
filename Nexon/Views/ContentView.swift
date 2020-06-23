//
//  ContentView.swift
//  Nexon
//
//  Created by Jason Thai on 6/9/20.
//  Copyright © 2020 Jason Thai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var nexonManager = NexonManager()
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("PC Games")) {
                    ForEach(nexonManager.games) { game in
                        NavigationLink(destination: DetailView(game: game)) {
                            Image(game.icon)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50, alignment: .center)
                            Text(game.title)
                        }
                    }
                }
                Section(header: Text("Mobile Games")) {
                    Text("")
                }
            }
            .navigationBarTitle("Nexon")
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
