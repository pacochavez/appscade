//
//  EscriturasRepository.swift
//  ScadeApp
//
//  Created by JCHAVEZ on 22/06/15.
//  Copyright (c) 2015 Grupo Arhe. All rights reserved.
//

import UIKit
class EscriturasRepository {
    var descrip: String?
    var razon_social : String?
    var rfc : String?
    var tipo : String?
    var fecha : String?
    var escritura : String?
    var volumen : String?
    var notario : String?
    var ruta_empresa : String?
    var ruta_archivo : String?
    init(json: NSDictionary) {
        self.descrip = json["descrip"] as? String
        self.razon_social = json["razon_social"] as? String
        self.rfc = json["rfc"] as? String
        self.tipo = json["tipo"] as? String
        self.fecha = json["fecha"] as? String
        self.escritura = json["escritura"] as? String
        self.volumen = json["volumen"] as? String
        self.notario = json["notario"] as? String
        self.ruta_archivo = json["ruta_archivo"] as? String
        self.ruta_empresa = json["ruta_empresa"] as? String
        
        
    }
}
