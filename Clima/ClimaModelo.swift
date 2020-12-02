//
//  ClimaModelo.swift
//  Clima
//
//  Created by Mac4 on 29/11/20.
//  Copyright © 2020 Mac4. All rights reserved.
//

import Foundation

struct ClimaModelo {
    let conID : Int
    let nombreCiudad : String
    let descripcionClima : String
    let temperaturaCelcis : Double
    let humedad : Int
    let sensacion_termica : Double
    let temp_max : Double
    let temp_min : Double
    let vel_viento : Double
    
    var condicionCLima: String {
        switch conID {
            
        case 200...232:
            return "thunderstorm.png"
            
        case 300...321:
            return "rainny_day1.png"
            
        case 500...531:
            return "heavy_rain.png"
            
        case 600...622:
            return "thunderstorm-rainny.png"
            
        case 701...781:
            return "thunderstorm-rainny_night.png"
            
        case 801...804:
            return "rainny_day2.png"

        case 800:
            return "sunny.png"
            
        default:
            return "sunny.png"
        }
    }
}
