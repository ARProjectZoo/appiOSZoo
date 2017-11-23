//
//  ViewController.swift
//  ReproductorMusicaJulio
//
//  Created by alumnos on 17/10/17.
//  Copyright © 2017 julio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

   
    }
    @IBAction func ocultarTeclado(_ sender: UITextField) {
        sender.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBOutlet weak var userNameTF: UITextField!

    @IBOutlet weak var passwordTF: UITextField!
    
    @IBAction func Login(_ sender: UIButton) {
        let user = userNameTF.text!
        let pass = passwordTF.text!
        if(user == "julio" && pass == "gueme"){
            
        }else{
            mostarError(mensaje: "Log In incorrecto")
        }
        
    }
    func mostarError(mensaje : String){
        let alert = UIAlertController(title: "Error", message:
            "Formato incorrecto", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style:
            .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}


