//
//  ClimaManager.swift
//  Clima
//
//  Created by Mac4 on 28/11/20.
//  Copyright © 2020 Mac4. All rights reserved.
//

import Foundation

protocol ClimaManagerDelegate {
    func actualizarClima (clima: ClimaModelo)
}

struct ClimaManager {
    
    let climaURL = "https://api.openweathermap.org/data/2.5/weather?appid=3e69357dabf1ecf0c20c381e647b594f&units=metric&lang=es"
    var delegado: ClimaManagerDelegate?
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
            if let clima = parseJSON(climaData: datosSeguros){
                delegado?.actualizarClima(clima: clima)
            }
        }
        
    }
    func parseJSON (climaData : Data ) -> ClimaModelo?{
        let decoder = JSONDecoder()
        do {
            let dataDecodificada = try decoder.decode(ClimaData.self, from: climaData)
            let id = dataDecodificada.weather[0].id
            let nombre = dataDecodificada.name
            let descripcion = dataDecodificada.weather[0].description
            let temperatura = dataDecodificada.main.temp
            
            let objClima = ClimaModelo (conID: id, nombreCiudad: nombre, descripcionClima: descripcion, temperaturaCelcis: temperatura)
            return objClima
        } catch{
            print(error)
            return nil
            
            
        }
        
    }
    
}
