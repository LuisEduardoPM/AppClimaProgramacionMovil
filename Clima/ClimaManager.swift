//
//  ClimaManager.swift
//  Clima
//
//  Created by Mac4 on 28/11/20.
//  Copyright © 2020 Mac4. All rights reserved.
//

import Foundation

struct ClimaManager {
    
    let climaURL = ""
    func fetchClima(nombreCiudad: String) {
        
        let urlString = "\(climaURL)&q=\(nombreCiudad)"
        realizarSolicitud(urlString:urlString)
    }
    func realizarSolicitud(urlString: String) {
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let tarea = session.dataTask(with: url, completionHandler: handle(data:respuesta:error:))
            tarea.resume()
        }
        
    }
    
    func handle(data:Data? , respuesta : URLResponse? , error : Error?)  {
        if error != nil {
            return
        }
        if let datosSeguros = data {
            let dataString = String (data: datosSeguros , encoding: .utf8)
        }
        
    }
    
}
