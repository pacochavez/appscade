//
//  ContratosDetailViewController.swift
//  ScadeApp
//
//  Created by JCHAVEZ on 22/06/15.
//  Copyright (c) 2015 Grupo Arhe. All rights reserved.
//

import UIKit

class ContratosDetailViewController: UIViewController,NSURLSessionDownloadDelegate {

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
        
        Descrip.text = ContratosDetailView.descrip
        RazonSocial.text = ContratosDetailView.razon_social
        Rfc.text = ContratosDetailView.rfc
        TipoContrato.text = ContratosDetailView.tipo_contrato
        Fecha.text = ContratosDetailView.fecha
        Fechavenc.text = ContratosDetailView.fechavenc
        Plazo.text = ContratosDetailView.plazo
        Monto.text = ContratosDetailView.monto
        Tasa.text = ContratosDetailView.tasa
        Comision.text = ContratosDetailView.comision
    }
    @IBAction func backLista(sender: AnyObject) {
        ContratosDetailView = nil
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func doElaborateHTTP (sender:AnyObject!) {
        
        progressCount.text = "0%"
        if self.task != nil {
            return
        }
        
        let s = "http://scade.mx/app/scade/php/download.php?f=documentos/UPC/"+ContratosDetailView.ruta_empresa!+ContratosDetailView.ruta_archivo!
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


