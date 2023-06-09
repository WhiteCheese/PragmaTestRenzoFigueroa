//
//  CeldaGatoTableViewCell.swift
//  Pragma-Test
//
//  Created by Renzo Rodrigo Figueroa Fernández on 9/06/23.
//

import UIKit

class CeldaGatoTableViewCell: UITableViewCell {

    @IBOutlet weak var nombreGato: UILabel!
    @IBOutlet weak var paisGato: UILabel!
    @IBOutlet weak var inteligenciaGato: UILabel!
    @IBOutlet weak var imagenGato: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imagenGato.layer.cornerRadius = 15
        
        // Configurar el espacio entre las celdas
        separatorInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
