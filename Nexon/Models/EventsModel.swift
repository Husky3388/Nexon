//
//  NewsModel.swift
//  Nexon
//
//  Created by Jason Thai on 6/12/20.
//  Copyright © 2020 Jason Thai. All rights reserved.
//

import Foundation

struct Event : Identifiable {
    let id : String
    let title : String
    let date : Date?
    let image : String
    let description : String
}
