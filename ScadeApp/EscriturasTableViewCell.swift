//
//  EscriturasTableViewCell.swift
//  ScadeApp
//
//  Created by JCHAVEZ on 22/06/15.
//  Copyright (c) 2015 Grupo Arhe. All rights reserved.
//

import UIKit

class EscriturasTableViewCell: UITableViewCell {
    @IBOutlet weak var razon_social: UILabel!
    @IBOutlet weak var rfc: UILabel!
    @IBOutlet weak var fecha: UILabel!
    @IBOutlet weak var escritura: UILabel!
    @IBOutlet weak var volumen: UILabel!
    @IBOutlet weak var notario: UILabel!
    @IBOutlet weak var descrip: UILabel!
    let space = " "
    func configEscritura(data:EscriturasRepository){
        razon_social.text = data.razon_social!+space+data.tipo!
        rfc.text = data.rfc
        fecha.text = data.fecha
        escritura.text = data.escritura
        volumen.text = data.volumen
        notario.text = data.notario
        descrip.text = data.descrip
        
    }
    
}

