//
//  ContratosTableViewController.swift
//  ScadeApp
//
//  Created by JCHAVEZ on 22/06/15.
//  Copyright (c) 2015 Grupo Arhe. All rights reserved.
//

import UIKit
var ContratosDetailView:ContratosRepository!
class ContratosTableViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var repositories = [ContratosRepository]()
    override func viewDidLoad() {
        super.viewDidLoad()
        for result in Resultado {
            repositories.append(ContratosRepository(json: result))
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section:Int)->Int{
        return repositories.count
    }
    
    func tableView(tableView:UITableView!,cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("ContratosCell", forIndexPath: indexPath) as! ContratosTableViewCell
        if tabla == "catcontratos"{
            
            let cell = tableView.dequeueReusableCellWithIdentifier("ContratosCell", forIndexPath: indexPath) as! ContratosTableViewCell
            let data = repositories[indexPath.row]
            cell.configContratos(data)
            
        }
        return cell
    }
    
    func tableView(tableView:UITableView!,didSelectRowAtIndexPath indexPath:NSIndexPath!){
        println("you select row #\(indexPath.row)")
        ContratosDetailView = repositories[indexPath.row]
        self.performSegueWithIdentifier("ContratosDetail", sender: self)
    }
    
    @IBAction func BackFiltro(sender: AnyObject) {
        Resultado = [NSDictionary]()
        self.dismissViewControllerAnimated(true, completion: nil)
    }


}
