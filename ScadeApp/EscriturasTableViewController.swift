//
//  EscriturasTableViewController.swift
//  ScadeApp
//
//  Created by JCHAVEZ on 22/06/15.
//  Copyright (c) 2015 Grupo Arhe. All rights reserved.
//

import UIKit
    var EscriturasDetailView:EscriturasRepository!
    class EscriturasResultViewController: UIViewController {
        
        @IBOutlet var tableView: UITableView!
        var repositories = [EscriturasRepository]()
        override func viewDidLoad() {
            super.viewDidLoad()
            for result in Resultado {
                repositories.append(EscriturasRepository(json: result))
                
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
            
            
            let cell = tableView.dequeueReusableCellWithIdentifier("EscriturasCell", forIndexPath: indexPath) as! EscriturasTableViewCell
            let data = repositories[indexPath.row]
            cell.configEscritura(data)
            
            
            return cell
        }
        
        func tableView(tableView:UITableView!,didSelectRowAtIndexPath indexPath:NSIndexPath!){
            println("you select row #\(indexPath.row)")
            EscriturasDetailView = repositories[indexPath.row]
            self.performSegueWithIdentifier("EscriturasDetail", sender: self)
        }
        
        @IBAction func BackFiltro(sender: AnyObject) {
            Resultado = [NSDictionary]()
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
    }

