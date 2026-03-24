//
//  Item.swift
//  Pokedex
//
//  Created by Norman Sánchez on 24/03/26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
