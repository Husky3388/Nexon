//
//  MenuView.swift
//  Nexon
//
//  Created by Jason Thai on 6/15/20.
//  Copyright © 2020 Jason Thai. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "circle.fill")
                    .foregroundColor(.green)
                    .imageScale(.large)
                Text("Game Online")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 100)
            HStack {
                NavigationLink(destination: WeatherAPIView()) {
                    Image(systemName: "gear")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Text("Weather API")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
            }
            .padding(.top, 30)
            HStack {
                Button(action: {
                    goToContentView()
                }) {
                    Image(systemName: "house")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Text("Nexon Page")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
            }
            .padding(.top, 30)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 32/255, green: 32/255, blue: 32/255))
        .edgesIgnoringSafeArea(.all)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
