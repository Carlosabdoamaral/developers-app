//
//  CardModel.swift
//  developers
//
//  Created by Carlos Amaral on 20/11/21.
//

import SwiftUI

struct Card : Identifiable {
    var id = UUID()
    var title : String
    var headline : String
    var imageName : String
    var callToAction : String
    var message : String
    var gradientColors : [Color]
}
