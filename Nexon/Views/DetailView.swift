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

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(game: TestData.mabinogi_game)
    }
}
