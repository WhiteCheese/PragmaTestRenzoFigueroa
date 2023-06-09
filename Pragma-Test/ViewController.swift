//
//  ViewController.swift
//  Pragma
//
//  Created by Renzo Rodrigo Figueroa Fernández on 3/06/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tablaGato: UITableView!
    
    //Variables
    var gatoManager = GatoManager()
    var gatos: [Cat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Registrar la nueva celda
        tablaGato.register(UINib(nibName: "CeldaGatoTableViewCell", bundle: nil), forCellReuseIdentifier: "celda")
        
        gatoManager.delegado = self
        tablaGato.delegate = self
        tablaGato.dataSource = self
        
        //Metodo para buscar la lista de gatos
        gatoManager.getCat()
    
    }
}

extension ViewController: gatoManagerDelegado {
    func mostrarListaGatos(lista: [Cat]) {
        gatos = lista
        DispatchQueue.main.async {
            self.tablaGato.reloadData()
        }
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gatos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tablaGato.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! CeldaGatoTableViewCell
        
        // Configurar el marco negro
        celda.contentView.layer.borderWidth = 1.0
        celda.contentView.layer.borderColor = UIColor.black.cgColor

        celda.nombreGato.text = "Nombre de raza: \(gatos[indexPath.row].name)"
        celda.paisGato.text = "Pais de origen: \(gatos[indexPath.row].origin)"
        celda.inteligenciaGato.text = "Inteligencia: \(String(gatos[indexPath.row].intelligence))"
        celda.imagenGato.image = UIImage(named: "2")
        
        /*
        //celda imagen desde URL
        if let urlString = gatos[indexPath.row].reference_image_id as? String {
            if let imagenURL = URL(string: urlString) {
                DispatchQueue.global().async {
                    guard let imagenData = try? Data(contentsOf: imagenURL) else {return}
                    let imagen = UIImage(data: imagenData)
                    DispatchQueue.main.async {
                        celda.imagenGato.image = imagen
                    }
                }
            }
        }
         */
        
        return celda
    }
}

