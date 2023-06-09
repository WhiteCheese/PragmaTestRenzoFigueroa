//
//  CatManager.swift
//  Pragma-Test
//
//  Created by Renzo Rodrigo Figueroa Fernández on 3/06/23.
//

import Foundation

protocol gatoManagerDelegado {
    func mostrarListaGatos(lista: [Cat])
}

struct GatoManager {
    var delegado: gatoManagerDelegado?
    
    // Proceso de Networking
    func getCat() {
        let urlString = "https://api.thecatapi.com/v1/breeds"
        
        if let url = URL(string: urlString){
            
            var request = URLRequest(url: url)
            request.setValue("bda53789-d59e-46cd-9bc4-2936630fde39", forHTTPHeaderField: "x-api-key")
            
            let session = URLSession(configuration: .default)
            
            let tarea = session.dataTask(with: url) { datos, respuesta, error in
                if error != nil {
                    print("Error al obtner datos de la API: ", error?.localizedDescription)
                }
                
                if let datosSeguros = datos?.parseData(quitarString: "null,"){
                    if let listaGatos = self.parsearJSON(datosGato: datosSeguros){
                        delegado?.mostrarListaGatos(lista: listaGatos)
                    }
                }
            }
            
            tarea.resume()
        }
    }
    
    func parsearJSON(datosGato: Data) -> [Cat]? {
        let decodificador = JSONDecoder()
        
        do {
            let datosDecodificados = try decodificador.decode([Cat].self, from: datosGato)
            return datosDecodificados
        } catch {
            print("Error al decodificar los datos: ", error.localizedDescription)
            return nil
        }
    }
}

extension Data {
    func parseData(quitarString palabra:String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parseDataString = dataAsString?.replacingOccurrences(of: palabra, with: "")
        
        guard let data = parseDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
