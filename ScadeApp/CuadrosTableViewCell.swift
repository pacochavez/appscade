//
//  CuadrosTableViewCell.swift
//  ScadeApp
//
//  Created by JCHAVEZ on 23/06/15.
//  Copyright (c) 2015 Grupo Arhe. All rights reserved.
//

import UIKit

class CuadrosTableViewCell: UITableViewCell {


    @IBOutlet weak var NombreCompleto: UILabel!
    @IBOutlet weak var TitleColumna1: UILabel!
    @IBOutlet weak var TitleColumna2: UILabel!
    @IBOutlet weak var TitleColumna3: UILabel!
    @IBOutlet weak var TitleColumna4: UILabel!
  
    @IBOutlet weak var Columna1: UILabel!
    @IBOutlet weak var Columna2: UILabel!
    @IBOutlet weak var Columna3: UILabel!
    @IBOutlet weak var Columna4: UILabel!
 
 
    
    func configCuadros(data:NSDictionary){

        var cuadroacc = data["cuadroacc"] as? String
        if cuadroacc == "mostrarCuadroAcc1" {
            TitleColumna1.text = ""
            TitleColumna2.text = ""
            TitleColumna3.text = "Partes Sociales"
            TitleColumna4.text = "Valor fijo"

            Columna1.text = ""
            Columna2.text = ""
            Columna3.text = data["acciones"] as? String
            Columna4.text = data["valores"] as? String
            
            
        }else if cuadroacc == "mostrarCuadroAcc2" {
            TitleColumna1.text = ""
            TitleColumna2.text = ""
            TitleColumna3.text = "Acciones"
            TitleColumna4.text = "valor fijo"
            Columna1.text = ""
            Columna2.text = ""
            Columna3.text = data["acciones"] as? String
            Columna4.text = data["valores"] as? String
            
        }else if cuadroacc == "mostrarCuadroAcc3" {
            TitleColumna1.text = ""
            TitleColumna2.text = "partes sociales"
            TitleColumna3.text = "valor fijo"
            TitleColumna4.text = "valor variable"
            Columna1.text = ""
            Columna2.text = data["acciones"] as? String
            Columna3.text = data["valores"] as? String
            Columna4.text = data["valores_var"] as? String
            
        }else if cuadroacc == "mostrarCuadroAcc4" {
            TitleColumna1.text = "Serie A"
            TitleColumna2.text = "Serie B"
            TitleColumna3.text = "valor fijo"
            TitleColumna4.text = "valor variable"
            Columna1.text = data["serieA"] as? String
            Columna2.text = data["serieB"] as? String
            Columna3.text = data["valores"] as? String
            Columna4.text = data["valores_var"] as? String
            
        }else if cuadroacc == "mostrarCuadroAcc5" {
            TitleColumna1.text = ""
            TitleColumna2.text = ""
            TitleColumna3.text = ""
            TitleColumna4.text = ""
            Columna1.text = ""
            Columna2.text = ""
            Columna3.text = ""
            Columna4.text = ""
            
        }else if cuadroacc == "mostrarCuadroAcc6" {
            TitleColumna1.text = "Certificado A"
            TitleColumna2.text = "Certificado B"
            TitleColumna3.text = "Fijo"
            TitleColumna4.text = "Variable"
            Columna1.text = data["serieA"] as? String
            Columna2.text = data["serieB"] as? String
            Columna3.text = data["valores"] as? String
            Columna4.text = data["valores_var"] as? String
            
        }

        else{
            TitleColumna1.text = ""
            TitleColumna2.text = ""
            TitleColumna3.text = ""
            TitleColumna4.text = ""
            Columna1.text = ""
            Columna2.text = ""
            Columna3.text = ""
            Columna4.text = ""
        }



        
        var apepaterno = data["apepaterno"] as? String
        var apematerno = data["apematerno"] as? String
        var nombre = data["nombre"] as? String
        if apematerno == nil{
            apematerno = ""
        }
        if nombre == nil{
            nombre = ""
        }
        let space = " "
        NombreCompleto.text = apepaterno! + space + apematerno! + space + nombre!
    }
}
