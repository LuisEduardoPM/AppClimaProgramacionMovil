//
//  ViewController.swift
//  Clima
//
//  Created by Mac4 on 26/11/20.
//  Copyright © 2020 Mac4. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, ClimaManagerDelegate {
    func actualizarClima(clima: ClimaModelo) {
        print(clima.descripcionClima)
        
    }
    

    @IBOutlet weak var temperaturaLabel: UILabel!
    @IBOutlet weak var ciudadLabel: UILabel!
    @IBOutlet weak var buscarTextField: UITextField!
    @IBOutlet weak var climaImageView: UIImageView!
    
    var climaManager = ClimaManager ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buscarTextField.delegate = self
        climaManager.delegado = self
        
    }
    
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
        ciudadLabel.text = buscarTextField.text
        climaManager.fetchClima(nombreCiudad: buscarTextField.text!)
        // uwu
    }
    
    
}

