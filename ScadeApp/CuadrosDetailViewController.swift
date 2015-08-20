//
//  CuadrosDetailViewController.swift
//  ScadeApp
//
//  Created by JCHAVEZ on 25/06/15.
//  Copyright (c) 2015 Grupo Arhe. All rights reserved.
//

import UIKit


class CuadrosDetailViewController: UIViewController,NSURLSessionDownloadDelegate {
    
    @IBOutlet weak var Descrip: UILabel!
    
    @IBOutlet weak var RazonSocial: UILabel!
    @IBOutlet weak var Rfc: UILabel!
    @IBOutlet weak var TipoContrato: UILabel!
    @IBOutlet weak var Fecha: UILabel!
    @IBOutlet weak var Fechavenc: UILabel!
    @IBOutlet weak var Plazo: UILabel!
    @IBOutlet weak var Monto: UILabel!
    @IBOutlet weak var Tasa: UILabel!
    @IBOutlet weak var Comision: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var progressCount: UILabel!
    
    var task : NSURLSessionTask!
    
    var counter:Float = 0.0 {
        
        didSet {
            let fractionalProgress = Float(counter) / 100.0
            let animated = counter != 0
            
            progressBar.setProgress(fractionalProgress, animated: animated)
            progressCount.text = ("\(counter)%")
        }
        
    }
    
    lazy var session : NSURLSession = {
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        config.allowsCellularAccess = false
        let session = NSURLSession(configuration: config, delegate: self, delegateQueue: NSOperationQueue.mainQueue())
        return session
        }()
    
    override func viewDidLoad() {
        progressBar.setProgress(0.0, animated: true)  //set progressBar to 0 at start
        let RS = AllItems[CuadrosNumDetailSection][0].razon_social!
        let TIPO = AllItems[CuadrosNumDetailSection][0].tipo
        RazonSocial.text = RS + TIPO!
        Rfc.text = AllItems[CuadrosNumDetailSection][0].rfc

        let countTextos:Int = 3
        let width:CGFloat = self.view.frame.width/CGFloat(countTextos)
        let margin:CGFloat = 4
        let widthMargin:CGFloat = (width - margin)
        let point:CGFloat = (width)/2
        var cuadroacc = AllItems[CuadrosNumDetailSection][0].cuadroacc
        let Items_ = AllItems[CuadrosNumDetailSection].count - 1
       for row in 0...Items_{
            for num in 0...countTextos {
                var n:CGFloat = CGFloat(num)
                var Xpoint:CGFloat = point+(n * width)
                var label = UILabel(frame: CGRectMake(0, 0,widthMargin, 21))
                label.center = CGPointMake(Xpoint,(284+CGFloat(row*(21+4))))
                label.textAlignment = NSTextAlignment.Center
                
                if cuadroacc == "mostrarCuadroAcc1" {
                    if num == 0{
                        label.text = ""
                    }
                    if num == 1{
                        label.text = ""
                    }
                    if num == 2{
                        label.text = AllItems[CuadrosNumDetailSection][row].acciones
                    }
                    if num == 3{
                        label.text = AllItems[CuadrosNumDetailSection][row].valores
                    }
                }else if cuadroacc == "mostrarCuadroAcc2" {
                    if num == 0{
                        label.text = ""
                    }
                    if num == 1{
                        label.text = ""
                    }
                    if num == 2{
                        label.text = AllItems[CuadrosNumDetailSection][row].acciones
                    }
                    if num == 3{
                        label.text = AllItems[CuadrosNumDetailSection][row].valores
                    }
                    
                }else if cuadroacc == "mostrarCuadroAcc3" {
                    if num == 0{
                        label.text = ""
                    }
                    if num == 1{
                        label.text = AllItems[CuadrosNumDetailSection][row].acciones
                    }
                    if num == 2{
                        label.text = AllItems[CuadrosNumDetailSection][row].valores
                    }
                    if num == 3{
                        label.text = AllItems[CuadrosNumDetailSection][row].valores_var
                    }
                    
                }else if cuadroacc == "mostrarCuadroAcc4" {
                    if num == 0{
                        label.text = AllItems[CuadrosNumDetailSection][row].serieA
                    }
                    if num == 1{
                        label.text = AllItems[CuadrosNumDetailSection][row].serieB
                    }
                    if num == 2{
                        label.text = AllItems[CuadrosNumDetailSection][row].valores
                    }
                    if num == 3{
                        label.text = AllItems[CuadrosNumDetailSection][row].valores_var
                    }
                    
                }else if cuadroacc == "mostrarCuadroAcc5" {
                    
                    if num == 0{
                        label.text = ""
                    }
                    if num == 1{
                        label.text = ""
                    }
                    if num == 2{
                        label.text = ""
                    }
                    if num == 3{
                        label.text = ""
                    }
                    
                }else if cuadroacc == "mostrarCuadroAcc6" {
                    if num == 0{
                        label.text = AllItems[CuadrosNumDetailSection][row].serieA
                    }
                    if num == 1{
                        label.text = AllItems[CuadrosNumDetailSection][row].serieB
                    }
                    if num == 2{
                        label.text = AllItems[CuadrosNumDetailSection][row].valores
                    }
                    if num == 3{
                        label.text = AllItems[CuadrosNumDetailSection][row].valores_var
                    }
                }
                
                self.view.addSubview(label)
            }
        }

    }
    @IBAction func backLista(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func doElaborateHTTP (sender:AnyObject!) {
        
        progressCount.text = "0%"
        if self.task != nil {
            return
        }
        
        let s = "http://scade.mx/app/scade/php/documentos/UPC/"+ContratosDetailView.ruta_empresa!+ContratosDetailView.ruta_archivo!
        let url = NSURL(string:s)!
        let req = NSMutableURLRequest(URL:url)
        let task = self.session.downloadTaskWithRequest(req)
        self.task = task
        task.resume()
        
    }
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten writ: Int64, totalBytesExpectedToWrite exp: Int64) {
        println("downloaded \(100*writ/exp)")
        
        dispatch_async(dispatch_get_main_queue(), {
            self.counter = Float(100*writ/exp)
            return
        })
    }
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didResumeAtOffset fileOffset: Int64, expectedTotalBytes: Int64) {
        // unused in this example
    }
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {
        println("completed: error: \(error)")
    }
    
    // this is the only required NSURLSessionDownloadDelegate method
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL) {
    }
    
}

