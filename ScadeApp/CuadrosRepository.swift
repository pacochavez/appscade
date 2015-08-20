//
//  CuadrosRepository.swift
//  ScadeApp
//
//  Created by JCHAVEZ on 22/06/15.
//  Copyright (c) 2015 Grupo Arhe. All rights reserved.
//

import UIKit
class CuadrosRepository {
    var acciones : String?
    var apematerno : String?
    var apepaterno : String?
    var cuadroacc : String?
    var escritura : String?
    var fecha : String?
    var fecha_inscrip : String?
    var nombre : String?
    var notario : String?
    var razon_social : String?
    var rfc : String?
    var ruta_archivo : String?
    var ruta_empresa : String?
    var serieA : String?
    var serieB : String?
    var serieC : String?
    var serieD : String?
    var tipo : String?
    var valores : String?
    var valores_c : String?
    var valores_d : String?
    var valores_var : String?
    var volumen : String?
    init(json: NSDictionary) {
        self.acciones = json["acciones"] as? String
        self.apematerno = json["apematerno"] as? String
        self.apepaterno = json["apepaterno"] as? String
        self.cuadroacc = json["cuadroacc"] as? String
        self.escritura = json["escritura"] as? String
        self.fecha = json["fecha"] as? String
        self.fecha_inscrip = json["fecha_inscrip"] as? String
        self.nombre = json["nombre"] as? String
        self.notario = json["notario"] as? String
        self.razon_social = json["razon_social"] as? String
        self.rfc = json["rfc"] as? String
        self.ruta_archivo = json["ruta_archivo"] as? String
        self.ruta_empresa = json["ruta_empresa"] as? String
        self.serieA = json["serieA"] as? String
        self.serieB = json["serieB"] as? String
        self.serieC = json["serieC"] as? String
        self.serieD = json["serieD"] as? String
        self.tipo = json["tipo"] as? String
        self.valores = json["valores"] as? String
        self.valores_c = json["valores_c"] as? String
        self.valores_d = json["valores_d"] as? String
        self.valores_var = json["valores_var"] as? String
        self.volumen = json["volumen"] as? String
    }
}