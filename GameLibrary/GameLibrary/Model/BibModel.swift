//
//  GameModel.swift
//  GameLibrary
//
//  Created by Just Lenz on 29.11.21.
//

import Foundation

struct GameModel: Decodable {
    var gameName: String
    var genre: String
    var published: String
    var price: String
}
