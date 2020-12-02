//
//  ViewController.swift
//  Clima
//
//  Created by Mac4 on 26/11/20.
//  Copyright © 2020 Mac4. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var temperaturaLabel: UILabel!
    @IBOutlet weak var ciudadLabel: UILabel!
    @IBOutlet weak var buscarTextField: UITextField!
    @IBOutlet weak var climaImageView: UIImageView!
    @IBOutlet weak var descripcionClimaLabel: UILabel!
    
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var sensacionLabel: UILabel!
    
    @IBOutlet weak var velcidadVientoLabel: UILabel!
    
    
    var climaManager = ClimaManager ()
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        climaManager.delegado = self
        buscarTextField.delegate = self
        
    }
}

extension ViewController : CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let ubicaciones = locations.last?.coordinate {
            locationManager.stopUpdatingLocation()
            let latitud = ubicaciones.latitude
            let longitud = ubicaciones.longitude
            climaManager.fetchClima(lat: latitud, long: longitud)
        }
        print("se obtuvo la ubicacion")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        ciudadLabel.text = "No se pudo obtener la ubicacion"
        print("Error: \(error.localizedDescription)")
    }
    
}
extension ViewController : ClimaManagerDelegate {
    func error(error: Error, descripcion: String) {
        DispatchQueue.main.async {
            self.ciudadLabel.text = descripcion
            self.temperaturaLabel.text = ""
            self.descripcionClimaLabel.text = ""
            self.climaImageView.image = UIImage(named: "sunny.png")
            
            self.sensacionLabel.text = ""
            self.velcidadVientoLabel.text = ""
            self.maxLabel.text = ""
            self.minLabel.text = ""        }
        
    }
    
    
    func actualizarClima(clima: ClimaModelo) {
        
        DispatchQueue.main.async {
            self.temperaturaLabel.text = "\(clima.temperaturaCelcis) °C"
            self.descripcionClimaLabel.text = clima.descripcionClima
            self.climaImageView.image = UIImage(named: clima.condicionCLima)
            self.ciudadLabel.text = clima.nombreCiudad
            self.sensacionLabel.text = "Sensación térmica: \(clima.sensacion_termica) °C"
            self.velcidadVientoLabel.text = "Velocidad del viento: \(clima.vel_viento)"
            self.maxLabel.text = "Max: \(clima.temp_max) °C"
            self.minLabel.text = "Min: \(clima.temp_min) °C"
        }
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}
extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        ciudadLabel.text = buscarTextField.text
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if buscarTextField.text != "" {
            return true
        } else {
            return false
        }
    }
    
    
    @IBAction func BuscarButton(_ sender: UIButton) {
        
        climaManager.fetchClima(nombreCiudad: buscarTextField.text!)
        print("boton buscar")
    }
    
    @IBAction func obtenerUbicacion(_ sender: UIButton) {
        
        locationManager.requestLocation()
        //climaManager.fetchClima(lat: 19.2837, long: -101.1384)
        
        print("botón ubicacion")
    }
}

