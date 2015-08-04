//
//  CuadrosTableViewController.swift
//  ScadeApp
//
//  Created by JCHAVEZ on 22/06/15.
//  Copyright (c) 2015 Grupo Arhe. All rights reserved.
//

import UIKit

var CuadrosDetailView:NSArray!
class CuadrosTableViewController: UIViewController {
    var CuadrosSections = (ResultadoAcc["IndexEscritura"] as? NSArray)!
    var CuadrosItems = (ResultadoAcc["escritura"] as? NSArray)!
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return CuadrosSections.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CuadrosItems[section].count
    }
    
    func tableView(tableView:UITableView!,cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("CuadrosCell", forIndexPath: indexPath) as! CuadrosTableViewCell
        let data = CuadrosItems[indexPath.section][indexPath.row] as? NSDictionary
        cell.configCuadros(data!)
        return cell
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        var label : UILabel = UILabel()
        label.backgroundColor = UIColorFromRGB(0xEEEEEE)

        label.textColor = UIColorFromRGB(0x007aff)
        label.numberOfLines = 0
        label.font = UIFont.systemFontOfSize(13.0)
        label.text = "Escritura: \(CuadrosSections[section][0]) Volumen \(CuadrosSections[section][1])"
        return label
    }
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " Escritura: \(CuadrosSections[section][0]) Volumen \(CuadrosSections[section][1])"
    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat? {
        return 60
    }
    
    func tableView(tableView:UITableView!,didSelectRowAtIndexPath indexPath:NSIndexPath!){
        println("you select row #\(indexPath.section)")
        CuadrosDetailView = CuadrosItems[indexPath.section] as! NSArray
        print(CuadrosDetailView)
       self.performSegueWithIdentifier("CuadrosDetail", sender: self)
    }
  
    @IBAction func BackFiltro(sender: AnyObject) {
        Resultado = [NSDictionary]()
        ResultadoAcc = NSDictionary()
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
