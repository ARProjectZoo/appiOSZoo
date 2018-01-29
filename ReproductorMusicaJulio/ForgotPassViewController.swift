

import UIKit

class ForgotPassViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var userEmailTF: UITextField!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    var URLprincipal = "http://localhost:8888/APIZOOAR/API%20/fuelphp/public/"
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.customAspect()
        userEmailTF.customAspect()
    }
    override func viewWillAppear(_ animated: Bool) {
        userNameTF.customAspect()
    }
    @IBAction func ocultarTeclado(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    
    @IBAction func check(_ sender: UIButton) {
        
        let userName = userNameTF.text;
        let userEmail = userEmailTF.text;
        let usedNameStored = UserDefaults.standard.string(forKey: "userName");
        let userEmailStored = UserDefaults.standard.string(forKey: "userEmail");
        
        
        if((userName?.isEmpty)! || (userEmail?.isEmpty)!)
        {
            showAlert(message: "All fields are required", view : self )
            return;
        }
        
        if(usedNameStored == userName){
            if(userEmailStored == userEmail)
            {
                UserDefaults.standard.set(true, forKey:"isUserLoggedIn");
                UserDefaults.standard.synchronize();
                
                self.dismiss(animated: true, completion:nil);
            }
        }
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
        let myUrl = URL(string:"http://localhost:8888/APIBUENA/API3/public/Users/forgotPassword.json")
        var request = URLRequest(url:myUrl!)
        request.httpMethod = "POST"//compose a query string
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content-type")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Accept")
        
        let postString = "userName="+userNameTF.text!+"&email="+userEmailTF.text!
        request.httpBody = postString.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            removeActivityIndicator(activityIndicator: myActivityIndicator)
            
            if error != nil
            {
                showAlert(message: "Could not successfully perform this request. Please try again later", view : self )
                print("error=\(String(describing: error))")
            }
            
            // RESPONSE sent from a server side code to NSDictionary object:
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                if let parseJSON = json {
                    
                    let code = parseJSON["code"] as! Int
                    switch code {
                    case let (code) where code == 200:
                        print("Forget completo")
                        print(parseJSON["token"] as! String)
                        DispatchQueue.main.async {
                            let storyboard: UIStoryboard =   UIStoryboard (name: "Main", bundle: nil)
                            let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: "changePassword") as UIViewController
                            self.present(vc ,animated: true, completion: nil )
                        }
                        break
                    case let (code) where code == 400:
                        print("Please try again")
                        break
                    default :
                        print("Please try again")
                        break
                    }
                }
            }catch{
                removeActivityIndicator(activityIndicator: myActivityIndicator)
                
                print(error)
            }
        }
        task.resume()
    }
   

}
