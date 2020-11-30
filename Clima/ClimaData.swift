//
//  ClimaData.swift
//  Clima
//
//  Created by Mac4 on 29/11/20.
//  Copyright © 2020 Mac4. All rights reserved.
//

import Foundation

struct ClimaData : Codable {
    let name : String
    let cod : Int
    let main : Main
    let weather : [Weather]
    let coord : Coord
    
}

struct Main: Codable {
    
    let temp : Double
    let humidity : Int
}

struct Weather : Codable {
    let description : String
    let id  : Int
}

struct Coord : Codable {
    let lat : Double
    let lon : Double
}
