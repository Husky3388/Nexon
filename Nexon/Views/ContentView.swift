//
//  ContentView.swift
//  Nexon
//
//  Created by Jason Thai on 6/9/20.
//  Copyright © 2020 Jason Thai. All rights reserved.
//

import SwiftUI

//let coloredNavAppearance = UINavigationBarAppearance()

struct ContentView: View {
    
//    init() {
//        coloredNavAppearance.configureWithOpaqueBackground()
//        coloredNavAppearance.backgroundColor = UIColor(named: "ColorMode")
//        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor(named: "ColorModeText")!]
//        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "ColorModeText")!]
//
////        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
////        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
//    }
    
    @ObservedObject var nexonManager = NexonManager()
    
    var body: some View {
        NavigationView {
            List(nexonManager.games) { game in
                NavigationLink(destination: DetailView(game: game)) {
                    Image(game.icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50, alignment: .center)
                    Text(game.title)
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
