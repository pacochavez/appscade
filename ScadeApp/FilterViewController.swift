//
//  FilterViewController.swift
//  ScadeApp
//
//  Created by JCHAVEZ on 18/06/15.
//  Copyright (c) 2015 Grupo Arhe. All rights reserved.
//

import UIKit

var UserName:String?
var UserPassword:String?
var IsUserLoggedIn:Bool?
var FilterViewTiposEmpresa:[NSDictionary] = [NSDictionary]()
var FilterViewEmpresas:[NSDictionary] = [NSDictionary]()
var Resultado: [NSDictionary] = [NSDictionary]()
var ResultadoAcc: NSDictionary = NSDictionary()
var tabla:String? = "catcontratos"

class FilterViewController: UIViewController {
    ///----------OULET GENERAL-----------///
    var FilterViewIdEmpresa: String? = ""
    var FilterViewIdTipoEmpresa: String? = ""
    var textfil:UITextField = UITextField()
   
    
    @IBOutlet weak var FilterViewSegmentedControl: UISegmentedControl!
    @IBOutlet weak var FilterViewTipoEmpresaTextField: UITextField!
    @IBOutlet weak var FilterViewEmpresaTextField: UITextField!
    @IBOutlet weak var FilterViewDescriptionTextField: UITextField!
    
    ///----------OULET CONTRATOS-----------///
    var ContratosFilterViewIdTipoContrato:String?
    var ContratosFilterViewIdPersonaEmpresa:String?
    
    @IBOutlet weak var ContratosFilterView: UIView!
    
    @IBOutlet weak var ContratosFilterViewVigentesSwitch: UISwitch!
    @IBOutlet weak var ContratosFilterViewVencidosSwitch: UISwitch!
    @IBOutlet weak var ContratosFilterViewFechasSwitch: UISwitch!
    @IBOutlet weak var ContratosFilterViewFechaDesdeTextField: UITextField!
    @IBOutlet weak var ContratosFilterViewFechaHastaTextField: UITextField!
    @IBOutlet weak var ContratosFilterViewTipoContratoTextField: UITextField!
    @IBOutlet weak var ContratosFilterViewPersonaEmpresaTextField: UITextField!
    ///----------OULET ESCRITURAS-----------///
     var EscriturasFilterViewIdNotario:String?
    @IBOutlet weak var EscriturasFilterView: UIView!
    @IBOutlet weak var EscriturasFilterViewEscrituraTextField: UITextField!
    @IBOutlet weak var EscriturasFilterViewNotarioTextField: UITextField!
    @IBOutlet weak var EscriturasFilterViewFechaEscrituraSwitch: UISwitch!
    @IBOutlet weak var EscriturasFilterViewFechaEscrituraDesdeTextField: UITextField!
    @IBOutlet weak var EscriturasFilterViewFechaEscrituraHastaTextField: UITextField!
    @IBOutlet weak var EscriturasFilterViewFechaAsambleaSwitch: UISwitch!
    @IBOutlet weak var EscriturasFilterViewFechaAsambleaDesdeTextField: UITextField!
    @IBOutlet weak var EscriturasFilterViewFechaAsambleaHastaTextField: UITextField!

    ///----------OULET CUADROS ACC-----------///
    
    @IBOutlet weak var CuadrosFilterView: UIView!
    @IBOutlet weak var CuadrosFilterViewVigentesSwitch: UISwitch!
    @IBOutlet weak var CuadrosFilterViewHistorialSwitch: UISwitch!
    @IBOutlet weak var CuadrosFilterViewAscendenteSwitch: UISwitch!
    @IBOutlet weak var CuadrosFilterViewDescendenteSwitch: UISwitch!
     ///----------OULET DATEPICKER-----------///
    @IBOutlet weak var FilterVIewDatePickerView: UIView!
    @IBOutlet weak var FilterVIewDatePicker: UIDatePicker!
    
    @IBOutlet weak var FilterViewDatePickerImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.FilterVIewDatePicker.backgroundColor = UIColor.whiteColor()
        self.FilterVIewDatePicker.layer.cornerRadius = 13.0
        self.FilterVIewDatePicker.clipsToBounds = true
        self.FilterViewDatePickerImage.layer.cornerRadius = 13.0
        self.FilterViewDatePickerImage.clipsToBounds = true

         clearVars("",IdEmpresa:"",TipoEmpresa:"",Empresa:"")
        if(IsUserLoggedIn == nil){
            self.performSegueWithIdentifier("LoginView", sender: self)
        }
        
    }
    ///----------ACTION GENERALES-----------///
    
    @IBAction func FilterViewSegmentAction(sender: AnyObject) {
           clearVars("",IdEmpresa:"",TipoEmpresa:"",Empresa:"")
        switch FilterViewSegmentedControl.selectedSegmentIndex{
        case 0:
            tabla = "catcontratos"
            self.ContratosFilterView.hidden = false
            self.EscriturasFilterView.hidden = true
            self.CuadrosFilterView.hidden = true
        case 1:
            tabla = "movpoderes"
            self.ContratosFilterView.hidden = true
            self.EscriturasFilterView.hidden = false
            self.CuadrosFilterView.hidden = true
        case 2:
            tabla = "movcuadros_acc"
            self.ContratosFilterView.hidden = true
            self.EscriturasFilterView.hidden = true
            self.CuadrosFilterView.hidden = false
        default:
            break;
        }
    }
    @IBAction func FilterViewTipoEmpresaTextFieldAction(sender: AnyObject) {
 
        clearVars("",IdEmpresa:"",TipoEmpresa:"",Empresa:"")
        ActionsFilter("Tipo de Empresas", options: FilterViewTiposEmpresa,TextFields:self.FilterViewTipoEmpresaTextField)
    }
    @IBAction func FilterViewEmpresaTextFieldAction(sender: AnyObject) {
        clearVars(FilterViewIdTipoEmpresa!,IdEmpresa:"",TipoEmpresa:self.FilterViewTipoEmpresaTextField.text!,Empresa:"")
        ActionsFilter("Empresa", options: FilterViewEmpresas,TextFields:self.FilterViewEmpresaTextField)

    }
    
    @IBAction func FilterViewMostrarButtonAction(sender: AnyObject) {
        let postString:String = PostString("")
        if tabla != "movcuadros_acc" {
            Jsondata(postString,typeData:tabla!,title:"",textField:self.textfil)
        }else{
            if self.FilterViewIdEmpresa != "" {
                Jsondata(postString,typeData:tabla!,title:"",textField:self.textfil)
            }else{
                print("introduce una empresa")
                var alert = UIAlertController(title: "Alert", message: "Introduce una empresa", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)

            }
        }
        
        
    }
    @IBAction func FilterViewCancelButtonAction(sender: AnyObject) {
         clearVars("",IdEmpresa:"",TipoEmpresa:"",Empresa:"")
    }
    ///----------ACTION CONTRATO-----------///
    @IBAction func ContratosFilterViewVigentesSwitchAction(sender: AnyObject) {
    }
    @IBAction func ContratosFilterViewVencidosSwitchAction(sender: AnyObject) {
    }
    @IBAction func ContratosFilterViewFechaSwitchAction(sender: AnyObject) {
        let on:Bool?
        if self.ContratosFilterViewFechasSwitch.on{
            on = false
        }else{
            on = true
        }
        self.ContratosFilterViewFechaDesdeTextField.text = ""
        self.ContratosFilterViewFechaHastaTextField.text = ""
        self.ContratosFilterViewFechaDesdeTextField.enabled = on!
        self.ContratosFilterViewFechaHastaTextField.enabled = on!
    }
    @IBAction func ContratosFilterViewFechaDesdeTextFieldAction(sender: AnyObject) {
        call(1)
    }
    @IBAction func ContratosFilterViewFechaHastaTextFieldAction(sender: AnyObject) {
        call(2)
    }
    @IBAction func ContratosFilterViewTipoContratoTextFieldAction(sender: AnyObject) {
        ContratosFilterViewIdTipoContrato = ""
        
        let postString:String = PostString("TipoContrato")
        Jsondata(postString,typeData:"TipoContrato",title:"Tipo de contrato",textField:self.ContratosFilterViewTipoContratoTextField)
    }
    @IBAction func ContratosFilterViewPersonaEmpresaTextFieldAction(sender: AnyObject) {
        ContratosFilterViewIdPersonaEmpresa = ""
        let postString:String = PostString("personas")
        
        Jsondata(postString,typeData:"personas",title:"Persona / Empresa",textField:self.ContratosFilterViewPersonaEmpresaTextField)
    }
    ///----------ACTION ESCRITURAS-----------///
    @IBAction func EscriturasFilterViewNotarioTextFieldAction(sender: AnyObject) {
        EscriturasFilterViewIdNotario = ""
        let postString:String = PostString("notario")
        
        Jsondata(postString,typeData:"notario",title:"Notario",textField:self.EscriturasFilterViewNotarioTextField)
    }
    @IBAction func  EscriturasFilterViewFechaEscrituraSwitchAction(sender: AnyObject) {
        let on:Bool?
        if self.EscriturasFilterViewFechaEscrituraSwitch.on{
            on = false
        }else{
            on = true
        }
        self.EscriturasFilterViewFechaEscrituraDesdeTextField.text = ""
        self.EscriturasFilterViewFechaEscrituraHastaTextField.text = ""
        self.EscriturasFilterViewFechaEscrituraDesdeTextField.enabled = on!
        self.EscriturasFilterViewFechaEscrituraHastaTextField.enabled = on!
        
    }
    @IBAction func EscriturasFilterViewFechaEscrituraDesdeTextFieldAction(sender: AnyObject) {
        call(3)
    }
    @IBAction func EscriturasFilterViewFechaEscrituraHastaTextFieldAction(sender: AnyObject) {
        call(4)
    }
    @IBAction func EscriturasFilterViewFechaAsambleaSwitchAction(sender: AnyObject) {
        let on:Bool?
        if self.EscriturasFilterViewFechaAsambleaSwitch.on{
            on = false
        }else{
            on = true
        }
        self.EscriturasFilterViewFechaAsambleaDesdeTextField.text = ""
        self.EscriturasFilterViewFechaAsambleaHastaTextField.text = ""
        self.EscriturasFilterViewFechaAsambleaDesdeTextField.enabled = on!
        self.EscriturasFilterViewFechaAsambleaHastaTextField.enabled = on!
        
    }
    @IBAction func EscriturasFilterViewFechaAsambleaDesdeTextFieldAction(sender: AnyObject) {
        call(5)
    }
    @IBAction func  EscriturasFilterViewFechaAsambleaHastaTextFieldAction(sender: AnyObject) {
        call(6)
    }
    ///----------ACTION CUADROS-----------///
    @IBAction func  CuadrosFilterViewVigentesSwitchAction(sender: AnyObject) {
        self.CuadrosFilterViewAscendenteSwitch.on = false
        self.CuadrosFilterViewDescendenteSwitch.on = false
        self.CuadrosFilterViewHistorialSwitch.on = false
        self.CuadrosFilterViewAscendenteSwitch.enabled = false
        self.CuadrosFilterViewDescendenteSwitch.enabled = false
        
    }
    @IBAction func  CuadrosFilterViewHistorialSwitchAction(sender: AnyObject) {
        self.CuadrosFilterViewAscendenteSwitch.on = false
        self.CuadrosFilterViewDescendenteSwitch.on = true
        self.CuadrosFilterViewVigentesSwitch.on = false
        self.CuadrosFilterViewAscendenteSwitch.enabled = true
        self.CuadrosFilterViewDescendenteSwitch.enabled = true
    }
    @IBAction func  CuadrosFilterViewAscendenteSwitchAction(sender: AnyObject) {
        self.CuadrosFilterViewDescendenteSwitch.on = false
        self.CuadrosFilterViewAscendenteSwitch.on = true
    }
    @IBAction func  CuadrosFilterViewDesendenteSwitchAction(sender: AnyObject) {
        self.CuadrosFilterViewAscendenteSwitch.on = false
         self.CuadrosFilterViewDescendenteSwitch.on = true

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
  ///----------ACTION DATEPICKER-----------///
    
    @IBAction func ok(sender: AnyObject) {
        datePickerChange(FilterVIewDatePicker)
    }
    @IBAction func close(sender: AnyObject) {
        
        if FilterVIewDatePicker.tag == 1{
            ContratosFilterViewFechaDesdeTextField.text = ""
        }else if FilterVIewDatePicker.tag == 2{
            ContratosFilterViewFechaHastaTextField.text = ""
        }else if FilterVIewDatePicker.tag == 3{
            EscriturasFilterViewFechaEscrituraDesdeTextField.text = ""
        }else if FilterVIewDatePicker.tag == 4{
            
             EscriturasFilterViewFechaEscrituraHastaTextField.text = ""
        }else if FilterVIewDatePicker.tag == 5{
             EscriturasFilterViewFechaAsambleaDesdeTextField.text = ""
        }else if FilterVIewDatePicker.tag == 6{
            EscriturasFilterViewFechaAsambleaHastaTextField.text = ""
        }
        FilterVIewDatePickerView.hidden = true
    }

    ///----------FUNCIONES GENERALES-----------///

    func clearVars(IdTipoempresa:String,IdEmpresa:String,TipoEmpresa:String,Empresa:String){
        ///----------CLEAER GENERAL-----------///
        let clear = ""
        
        self.FilterViewIdEmpresa = IdEmpresa
        self.FilterViewIdTipoEmpresa = IdTipoempresa
        
        self.FilterViewTipoEmpresaTextField.text = TipoEmpresa
        self.FilterViewEmpresaTextField.text = Empresa
        self.FilterViewDescriptionTextField.text = clear
        Resultado = [NSDictionary]()
        ///----------CLEAER CONTRATO-----------///
        self.ContratosFilterViewIdTipoContrato = clear
        self.ContratosFilterViewIdPersonaEmpresa = clear
        
        self.ContratosFilterViewFechaDesdeTextField.text = clear
        self.ContratosFilterViewFechaHastaTextField.text = clear
        self.ContratosFilterViewTipoContratoTextField.text = clear
        self.ContratosFilterViewPersonaEmpresaTextField.text = clear
        self.ContratosFilterViewVigentesSwitch.on = true
        self.ContratosFilterViewVencidosSwitch.on = true
        self.ContratosFilterViewFechasSwitch.on = true
        self.ContratosFilterViewFechaDesdeTextField.enabled = false
        self.ContratosFilterViewFechaHastaTextField.enabled = false
        ///----------CLEAER ESCRITURAS-----------///
        self.EscriturasFilterViewIdNotario = clear
        self.EscriturasFilterViewEscrituraTextField.text = clear
        self.EscriturasFilterViewNotarioTextField.text = clear
        self.EscriturasFilterViewFechaEscrituraSwitch.on = true
        self.EscriturasFilterViewFechaEscrituraDesdeTextField.text = clear
        self.EscriturasFilterViewFechaEscrituraHastaTextField.text = clear
        self.EscriturasFilterViewFechaAsambleaSwitch.on = true
        self.EscriturasFilterViewFechaAsambleaDesdeTextField.text = clear
        self.EscriturasFilterViewFechaAsambleaHastaTextField.text = clear
        
        self.EscriturasFilterViewFechaEscrituraDesdeTextField.enabled = false
        self.EscriturasFilterViewFechaEscrituraHastaTextField.enabled = false
        self.EscriturasFilterViewFechaAsambleaDesdeTextField.enabled = false
        self.EscriturasFilterViewFechaAsambleaHastaTextField.enabled = false
        ///----------CLEAER CUADROS-----------///
        self.CuadrosFilterViewVigentesSwitch.on = false
        self.CuadrosFilterViewHistorialSwitch.on = true
        self.CuadrosFilterViewAscendenteSwitch.on = false
        self.CuadrosFilterViewDescendenteSwitch.on = true
    
    }
    func PostString(option:String) -> String{
        let postString:String?
        postString = "loginUsername="+UserName!
        postString! += "&loginPassword="+UserPassword!
        postString! += "&tabla="+tabla!
        postString! += "&id_empresa="+self.FilterViewIdEmpresa!
        postString! += "&id_tipo_empresa="+self.FilterViewIdTipoEmpresa!
        
        if(tabla == "catcontratos"){
            var vigente:String? = ""
            var vencido:String? = ""
            if (self.ContratosFilterViewVigentesSwitch.on){
                vigente = "ok"
            }
            if (self.ContratosFilterViewVencidosSwitch.on){
                vencido = "ok"
            }
            postString! += "&fecha_desde="+self.ContratosFilterViewFechaDesdeTextField.text!
            postString! += "&fecha_hasta="+self.ContratosFilterViewFechaHastaTextField.text!
            postString! += "&fecha_vencido="+vencido!
            postString! += "&fecha_vigente="+vigente!
            postString! += "&id_tipocontrato="+self.ContratosFilterViewIdTipoContrato!
            postString! += "&id_persona="+self.ContratosFilterViewIdPersonaEmpresa!
            postString! += "&descrip="+self.FilterViewDescriptionTextField.text!
            postString! += "&option="+option
            
        }
        if(tabla == "movpoderes"){
            postString! += "&escritura="+self.EscriturasFilterViewEscrituraTextField.text!
            postString! += "&id_notario="+self.EscriturasFilterViewIdNotario!
            postString! += "&fechaEscrituraDesde="+self.EscriturasFilterViewFechaEscrituraDesdeTextField.text!
            postString! += "&fechaEscrituraHaste="+self.EscriturasFilterViewFechaEscrituraHastaTextField.text!
            postString! += "&fechaAsambleaDesde="+self.EscriturasFilterViewFechaAsambleaDesdeTextField.text!
            postString! += "&fechaAsambleaHasta="+self.EscriturasFilterViewFechaAsambleaHastaTextField.text!
            postString! += "&descrip="+self.FilterViewDescriptionTextField.text!
            postString! += "&option="+option
        }
        if(tabla == "movcuadros_acc"){
            var vigente:String? = ""
            var ascendente:String? = ""
            if (self.CuadrosFilterViewVigentesSwitch.on){
                vigente = "ok"
            }
            if (self.CuadrosFilterViewAscendenteSwitch.on){
                ascendente = "ok"
            }
            postString! += "&vigente="+vigente!
            postString! += "&ascendente="+ascendente!
        
        }

        return postString!
    }
    func ActionsFilter(title:String,options:[NSDictionary],TextFields:UITextField!) {
        //cancelTextfield(TextFields)
        let message = "Selecciona "+title
        let ActionSheet = UIAlertController(title:title, message:message,preferredStyle : UIAlertControllerStyle.ActionSheet)
        func addAction(Action:String,id_tipo_empresa_string:String){
            let createAction = UIAlertAction(title: Action, style: .Default){ _ in
                TextFields.text = Action
                if (title == "Tipo de Empresas"){
                    self.FilterViewIdTipoEmpresa  = id_tipo_empresa_string
                }else if(title == "Empresa" ){
                    self.FilterViewIdEmpresa  = id_tipo_empresa_string
                }else if(title == "Tipo de contrato" ){
                    self.ContratosFilterViewIdTipoContrato  = id_tipo_empresa_string
                }else if(title == "Persona / Empresa" ){
                    self.ContratosFilterViewIdPersonaEmpresa = id_tipo_empresa_string
                }else if(title == "Notario" ){
                    self.EscriturasFilterViewIdNotario = id_tipo_empresa_string
                }
            }
            ActionSheet.addAction(createAction)
            return
        }
        for option in options {
            if title == "Tipo de Empresas"{
                let value = option["tipo"] as? String;
                let string:String = value!
                let id_tipo_empresa = option["id_tipo_empresa"] as? String;
                let id_tipo_empresa_string : String = id_tipo_empresa!
                addAction(string,id_tipo_empresa_string)
            }
            if title == "Empresa"{
                let value = option["razon_social"] as? String;
                let string:String = value!
                let id_empresa = option["id_empresa"] as? String;
                let id_empresa_string:String  = id_empresa!
                let id_tipo_empresa_ = option["id_tipo_empresa"] as? String;
                let id_tipo_empresa_string : String = id_tipo_empresa_!
                if self.FilterViewIdTipoEmpresa  == ""{
                    addAction(string,id_empresa_string)
                }else if self.FilterViewIdTipoEmpresa  == id_tipo_empresa_string{
                    addAction(string,id_empresa_string)
                }
            }
            if title == "Tipo de contrato"{
                let value = option["tipo_contrato"] as? String;
                let string:String = value!
                let id_tipocontrato = option["id_tipocontrato"] as? String;
                addAction(string, id_tipocontrato!)
            }
            if title == "Notario"{
                let value = option["notario"] as? String;
                let string:String = value!
                let id_notario = option["id_notario"] as? String;
                addAction(string, id_notario!)
            }
            if title == "Persona / Empresa"{
                if(option["apepaterno"] != nil){
                    let space:String = " "
                    let nombre = option["nombre"] as? String
                    let apematerno = option["apematerno"] as? String
                    let apepaterno = option["apepaterno"] as? String
                    let string:String
                    if apematerno != nil{
                        string = apepaterno!+space+apematerno!+space+nombre!
                    }else{
                        string = apepaterno!
                    }
                    let id_persona = option["id_persona"] as? String;
                    addAction(string, id_persona!)
                }
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            //println("Cancelled")
            TextFields.text = ""
            if (title == "Tipo de Empresas"){
                self.FilterViewIdTipoEmpresa = ""
            }else if(title == "Empresa" ){
                 self.FilterViewIdEmpresa = ""
            }else if(title == "Tipo de contrato" ){
                self.ContratosFilterViewIdTipoContrato = ""
            }else if(title == "Persona / Empresa" ){
                self.ContratosFilterViewIdPersonaEmpresa = ""
            }
            
        })
        ActionSheet.addAction(cancelAction)
        
        self.presentViewController(ActionSheet, animated: true, completion: nil)
        
    }
    
    func Jsondata(postString:String,typeData:String,title:String,textField:UITextField){
        let myUrl = NSURL(string:"http://scade.mx/app/mobile/result.php")
        
        let request = NSMutableURLRequest(URL:myUrl!)
        request.HTTPMethod = "POST"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding);
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil
            {
                return
            }
            
            let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)
            
            var err: NSError?
            var myJSON = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error:&err) as? NSDictionary
            if let parseJSON = myJSON {
                var success = parseJSON["success"] as? Int!
                if success == 1{
                    // print(success)
                    
                    if typeData == "catcontratos"{
                        Resultado = (parseJSON["resultado"] as?[NSDictionary])!
                        NSOperationQueue.mainQueue().addOperationWithBlock {
                            self.performSegueWithIdentifier("ContratosTableView", sender: self)
                        }
                    }
                    if typeData == "movpoderes"{
                        Resultado = (parseJSON["resultado"] as?[NSDictionary])!
                        NSOperationQueue.mainQueue().addOperationWithBlock {
                            self.performSegueWithIdentifier("EscriturasTableView", sender: self)
                        }
                    }
                    if typeData == "movcuadros_acc"{
                        

                        ResultadoAcc = (parseJSON["resultado"] as? (NSDictionary))!
                       
                        NSOperationQueue.mainQueue().addOperationWithBlock {
                            self.performSegueWithIdentifier("CuadrosTableView", sender: self)
                        }
                    }
                    if typeData == "notario"{
                        var notario:[NSDictionary] = [NSDictionary]()
                        notario = (parseJSON["resultado"] as?[NSDictionary])!
                        NSOperationQueue.mainQueue().addOperationWithBlock {
                            self.ActionsFilter(title,options:notario,TextFields:textField)
                        }
                    }
                    if typeData == "personas" || typeData == "TipoContrato" {
                        var personas:[NSDictionary] = [NSDictionary]()
                        personas = (parseJSON["resultado"] as?[NSDictionary])!
                        NSOperationQueue.mainQueue().addOperationWithBlock {
                            self.ActionsFilter(title,options:personas,TextFields:textField)
                        }
                    }
                }
            }
        }
        task.resume()
    }

    func call(tag:Int){
        //  calldate()
        self.FilterVIewDatePickerView.hidden = false
        FilterVIewDatePicker.tag = tag
    }
    func datePickerChange(sender: UIDatePicker) {
        
        let fecha: String = "\(sender.date)"
        if sender.tag == 1{
            if ContratosFilterViewFechaDesdeTextField.enabled == true{
                ContratosFilterViewFechaDesdeTextField.text = fecha
            }
        }else if sender.tag == 2{
            if ContratosFilterViewFechaHastaTextField.enabled == true{
                ContratosFilterViewFechaHastaTextField.text = fecha
            }
        }else if sender.tag == 3{
            if EscriturasFilterViewFechaEscrituraDesdeTextField.enabled == true{
                EscriturasFilterViewFechaEscrituraDesdeTextField.text = fecha
            }
        }else if sender.tag == 4{
            if EscriturasFilterViewFechaEscrituraHastaTextField.enabled == true{
                EscriturasFilterViewFechaEscrituraHastaTextField.text = fecha
            }
        }else if sender.tag == 5{
            if EscriturasFilterViewFechaAsambleaDesdeTextField.enabled == true{
                EscriturasFilterViewFechaAsambleaDesdeTextField.text = fecha
            }
        }else if sender.tag == 6{
            if EscriturasFilterViewFechaAsambleaHastaTextField.enabled == true{
            EscriturasFilterViewFechaAsambleaHastaTextField.text = fecha
                //fecha_hasta = fecha_
            }
        }
        FilterVIewDatePickerView.hidden = true
    }
}
