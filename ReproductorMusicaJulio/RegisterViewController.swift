//
//  RegisterViewController.swift
//  ReproductorMusicaJulio
//
//  Created by alumnos on 16/1/18.
//  Copyright © 2018 julio. All rights reserved.
//

import UIKit


class RegisterViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var userEmailTF: UITextField!
    @IBOutlet weak var userPasswordTF: UITextField!
    @IBOutlet weak var repeatPasswordTF: UITextField!
    var URLprincipal = "http://localhost:8888/APIZOOAR/API%20/fuelphp/public/"
    @IBOutlet weak var warningLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
          userNameTF.customAspect()
          userEmailTF.customAspect()
          userPasswordTF.customAspect()
          repeatPasswordTF.customAspect()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userNameTF.customAspect()
    }
        
    @IBAction func passwordChange(_ sender: UITextField) {
        if ((userPasswordTF.text?.count)! < 5 )
        {
            warningLabel.isHidden = false
        }else{
            warningLabel.isHidden = true
        }
    }

    //Valid email
    func validateEmail(enteredEmail:String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
    }

    @IBAction func ocultarTeclado(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func register(_ sender: UIButton) {
        
    let userName = userNameTF.text
    let userEmail = userEmailTF.text
    let userPassword = userPasswordTF.text
    let userRepeatPassword = repeatPasswordTF.text
        
    //Check for empty fields
        if((userEmail?.isEmpty)! || (userPassword?.isEmpty)! ||
        (userRepeatPassword?.isEmpty)! || (userName?.isEmpty)!)
        {
            showAlert(message: "All fields are quired to fill in", view : self )
            return
        }
  
    //Check if password match
        if(userPassword != userRepeatPassword)
        {
            showAlert(message: "Password do not match", view : self )
            return
        }
        //Check if email is correct
        if(!validateEmail(enteredEmail: userEmail!))
        {
            showAlert(message: "Email not valid", view : self )
            return
        }
        //Store data
//        UserDefaults.standard.set(userEmail, forKey:"userEmail")
//        UserDefaults.standard.set(userName, forKey:"userName")
//        UserDefaults.standard.set(userPassword, forKey:"userPassword")
//        UserDefaults.standard.synchronize();
        
        //Create Activity Indicator
        let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        //Position Activity Indicator in the center of the main view
        myActivityIndicator.center = view.center
        
        //If needed, yo can prevent activity Idicantor from hiing ehen stopAnimating() is called
        myActivityIndicator.hidesWhenStopped = false
        
        //Start Activity Indicator
        myActivityIndicator.startAnimating()
        view.addSubview(myActivityIndicator)
 
        //Send HTTP Request to Register user
        let myUrl = URL(string:"http://localhost:8888/APIZOOAR/API%20/fuelphp/public/Users/register.json")
        var request = URLRequest(url:myUrl!)
        request.httpMethod = "POST"//compose a query string
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content-type")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Accept")
        
        let postString = "userName="+userNameTF.text!+"&password="+userPasswordTF.text!+"&email="+userEmailTF.text!+"&id_device=0000"
            request.httpBody = postString.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            removeActivityIndicator(activityIndicator: myActivityIndicator)
            
            if error != nil
            {
                showAlert(message: "Could not successfully perform this request. Please try again later", view : self)
                
                print("error=\(String(describing: error))")
            }
            
        // RESPONSE sent from a server side code to NSDictionary object:
        do{
            let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary

            if let parseJSON = json {
                let code = parseJSON["code"] as! Int
                    switch code {
                    case let (code) where code == 201:
                        print("registrado")
                        showAlert(message: "Registrado", view : self)
                        break
                     case let (code) where code == 400:
                       print("Please try again")
                        //showAlert(message: "Please try again")
                      
                        break
                    default :
                        print("Please try again")
                        //showAlert(message: "Please try again")
                        break
                    }
            }
        }catch{
            removeActivityIndicator(activityIndicator: myActivityIndicator)
            //showAlert(message: "Please try again")
            print(error)
        }
        }
    task.resume()
        }
    }


