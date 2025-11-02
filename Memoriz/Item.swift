//
//  Item.swift
//  Memoriz
//
//  Created by Chengbin Feng on 20/9/2025.
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
