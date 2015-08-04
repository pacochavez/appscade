//
//  LoginViewController.swift
//  ScadeApp
//
//  Created by JCHAVEZ on 18/06/15.
//  Copyright (c) 2015 Grupo Arhe. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userPasswordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
        UserName  = userNameTextField.text!
        UserPassword  = userPasswordTextfield.text!
        Jsondata( UserName! ,userPassword: UserPassword! )
    }
    
    func Jsondata(userName:String,userPassword:String){
        let myUrl = NSURL(string:"http://scade.mx/app/mobile/login.php")
        
        let request = NSMutableURLRequest(URL:myUrl!)
        
        request.HTTPMethod = "POST"
        
        let postString = "loginUsername="+userName+"&loginPassword="+userPassword+"&tabla="+tabla!;
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding);
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil
            {
                // println("error=\(error)")
                return
            }
            
            // You can print out response object
            //println("response = \(response)")
            
            // Print out response body
            let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)
            // println("responseString = \(responseString)")
            
            //Let's convert response sent from a server side script to a NSDictionary object:
            
            var err: NSError?
            var myJSON = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error:&err) as? NSDictionary
            if let parseJSON = myJSON {
                var success = parseJSON["success"] as? Int!
                if success == 1{
                    FilterViewTiposEmpresa = (parseJSON["tipo_de_empresa"] as?[NSDictionary])!
                    FilterViewEmpresas = (parseJSON["empresas"] as?[NSDictionary])!
                    IsUserLoggedIn = true
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
            }
            
            
        }
        
        task.resume()
        
    }
    




}
