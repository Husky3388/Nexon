//
//  GameData.swift
//  Nexon
//
//  Created by Jason Thai on 6/9/20.
//  Copyright © 2020 Jason Thai. All rights reserved.
//

import Foundation

struct Game : Identifiable {
    let id : String
    let title : String
    let genre : String
    let publisher : String
    let developer : String
    let description : String
    let logo : String
    let icon : String
    let background : String
    let events : [Event]
}
