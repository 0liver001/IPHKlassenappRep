//
//  Data.swift
//  GameLibrary
//
//  Created by Just Lenz on 06.12.21.
//

import Foundation

let gameData = loadData()

//Funktion zum Laden der dekodierten JSON-Daten
func loadData() -> [GameModel] {
    
    var data: Data
    
    guard let file = Bundle.main.url(forResource: "data", withExtension: "json") else {
        fatalError("JSON Error")
    }
    
    data = try! Data(contentsOf: file)
    
    let decoder = JSONDecoder()
    return try! decoder.decode([GameModel].self, from: data)
}
