//
//  EscriturasDetailViewController.swift
//  ScadeApp
//
//  Created by JCHAVEZ on 22/06/15.
//  Copyright (c) 2015 Grupo Arhe. All rights reserved.
//

import UIKit

class EscriturasDetailViewController: UIViewController,NSURLSessionDownloadDelegate {
    @IBOutlet weak var Descrip: UILabel!
    
    @IBOutlet weak var RazonSocial: UILabel!
    @IBOutlet weak var Rfc: UILabel!
    @IBOutlet weak var Notario: UILabel!
    @IBOutlet weak var Fecha: UILabel!
    @IBOutlet weak var Escritura: UILabel!
    @IBOutlet weak var Volumen: UILabel!
    
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
        
        Descrip.text = EscriturasDetailView.descrip!
        RazonSocial.text = EscriturasDetailView.razon_social!
        Rfc.text = EscriturasDetailView.rfc!
        Notario.text = EscriturasDetailView.notario!
        Fecha.text = EscriturasDetailView.fecha!
        Escritura.text = EscriturasDetailView.escritura!
        Volumen.text = EscriturasDetailView.volumen!
    }
    @IBAction func backLista(sender: AnyObject) {
        EscriturasDetailView = nil
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func doElaborateHTTP (sender:AnyObject!) {
        
        progressCount.text = "0%"
        if self.task != nil {
            return
        }
        
        let s = "http://scade.mx/app/scade/documentos/UPC/"+EscriturasDetailView.ruta_empresa!+EscriturasDetailView.ruta_archivo!
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
        
    }}

