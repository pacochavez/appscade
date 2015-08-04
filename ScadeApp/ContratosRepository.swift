//
//  ContratosRepository.swift
//  ScadeApp
//
//  Created by JCHAVEZ on 22/06/15.
//  Copyright (c) 2015 Grupo Arhe. All rights reserved.
//

import UIKit

class ContratosRepository {
    
    var id_empresa: String?
    var id_tipocontrato: String?
    var descrip: String?
    var razon_social : String?
    var tipo : String?
    var tipo_contrato : String?
    var rfc : String?
    var fecha : String?
    var fechavenc : String?
    var plazo : String?
    var monto : String?
    var tasa : String?
    var comision : String?
    var ruta_empresa : String?
    var ruta_archivo : String?
    
    init(json: NSDictionary) {
        self.id_empresa = json["id_empresa"] as? String
        self.id_tipocontrato = json["id_tipocontrato"] as? String
        self.descrip = json["descrip"] as? String
        self.razon_social = json["razon_social"] as? String
        self.tipo = json["tipo"] as? String
        self.tipo_contrato = json["tipo_contrato"] as? String
        self.rfc = json["rfc"] as? String
        self.fecha = json["fecha"] as? String
        self.fechavenc = json["fechavenc"] as? String
        self.plazo = json["plazo"] as? String
        self.monto = json["monto"] as? String
        self.tasa = json["tasa"] as? String
        self.comision = json["comision"] as? String
        self.ruta_archivo = json["ruta_archivo"] as? String
        self.ruta_empresa = json["ruta_empresa"] as? String
    }
}