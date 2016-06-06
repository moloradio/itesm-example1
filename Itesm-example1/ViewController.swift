//
//  ViewController.swift
//  Itesm-example1
//
//  Created by aldo ulises pena martinez on 06/06/16.
//  Copyright © 2016 fatimsoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var libro: UITextField!
    @IBOutlet weak var respuesta: UITextView!
    
    @IBAction func buscar(sender: AnyObject) {
        asincrono()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var limpiar: UIButton!
    
    @IBAction func limpiar(sender: AnyObject) {
        libro.text = ""
    }
    
    
    func asincrono(){
        let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:" + libro.text!
        let url = NSURL(string: urls)
        let sesion = NSURLSession.sharedSession()
        let bloque = {(datos: NSData?, resp:NSURLResponse?, error: NSError?) -> Void in
            let texto = NSString(data: datos!, encoding: NSUTF8StringEncoding)
            print(texto!)
            //self.respuesta.text = texto
        }
        
        let dt = sesion.dataTaskWithURL(url!, completionHandler: bloque)
        dt.resume()
    }
    
    func sincrono(){
        let urls = "http://dia.ccm.itesm.mx/"
        let url = NSURL(string: urls)
        let datos:NSData? = NSData(contentsOfURL: url!)
        let texto = NSString(data:datos!, encoding: NSUTF8StringEncoding)
        print(texto!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

