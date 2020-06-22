//
//  SettingsView.swift
//  Nexon
//
//  Created by Jason Thai on 6/14/20.
//  Copyright © 2020 Jason Thai. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    @State var notificationsEnabled: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $notificationsEnabled) {
                    Text("Toggle Test")
                }
                .padding()
            }
            .navigationBarTitle("Settings", displayMode: .inline)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
