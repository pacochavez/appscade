//
//  ContratosTableViewCell.swift
//  ScadeApp
//
//  Created by JCHAVEZ on 22/06/15.
//  Copyright (c) 2015 Grupo Arhe. All rights reserved.
//


import UIKit

class ContratosTableViewCell: UITableViewCell {
    @IBOutlet weak var razon_social: UILabel!
    @IBOutlet weak var tipo: UILabel!
    @IBOutlet weak var rfc: UILabel!
    @IBOutlet weak var fecha: UILabel!
    @IBOutlet weak var fechavenc: UILabel!
    @IBOutlet weak var plazo: UILabel!
    @IBOutlet weak var monto: UILabel!
    @IBOutlet weak var tasa: UILabel!
    @IBOutlet weak var comision: UILabel!
    @IBOutlet weak var descrip: UILabel!
    let space = " "
    func configContratos(data:ContratosRepository){
        razon_social.text = data.razon_social!+space+data.tipo!
        tipo.text = data.tipo_contrato
        rfc.text = data.rfc
        fecha.text = data.fecha
        fechavenc.text = data.fechavenc
        plazo.text = data.plazo
        monto.text = data.monto
        tasa.text = data.tasa
        comision.text = data.comision
        descrip.text = data.descrip
    }
    
    
}