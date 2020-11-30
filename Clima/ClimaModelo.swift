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
    
    var condicionCLima: String {
        switch conID {
        case 200...232:
            return "cloud.bolt"
        case 701...781:
            return "clod.fog"
        case 800:
            return "suun.min"
        default:
            return "cloud"
        }
    }
}
