

import UIKit
import Device

class ViewStoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //layaout
    @IBOutlet weak var distanceLabelPhoto: NSLayoutConstraint!
    @IBOutlet weak var distancePhotoTF: NSLayoutConstraint!
    @IBOutlet weak var distanceTopLabel: NSLayoutConstraint!
    @IBOutlet weak var distanceButtonBottom: NSLayoutConstraint!
    @IBOutlet weak var distanceTFButton: NSLayoutConstraint!
    
    
  
    
    func myFunc() {
        
        switch Device.size() {
        case .screen4Inch:
            print("It's a 4 inch screen");
            screen4Inch()
        case .screen4_7Inch:
            print("It's a 4.7 inch screen")
            screen4_7Inch()
        case .screen5_5Inch:
            print("It's a 5.5 inch screen")
            screen5_5Inch()
        case .screen5_8Inch:
            print("It's a 5.8 inch screen")
            screen5_8Inch()
        default:
            print("Unknown size")
        }
    }
    
    
    
    //tamaños pantalla
    func screen4Inch () {
        distanceTopLabel.constant = 40
        distanceLabelPhoto.constant = 40
        distancePhotoTF.constant = 40
        distanceTFButton.constant = 40
        distanceButtonBottom.constant = 40
        
    }
    func screen4_7Inch () {
        distanceTopLabel.constant = 40
        distanceLabelPhoto.constant = 40
        distancePhotoTF.constant = 40
        distanceTFButton.constant = 50
        distanceButtonBottom.constant = 50
    }
    func screen5_5Inch (){
        
        distanceTopLabel.constant = 40
        distanceLabelPhoto.constant = 40
        distancePhotoTF.constant = 60
        distanceTFButton.constant = 70
        distanceButtonBottom.constant = 70
    }
    func screen5_8Inch (){
        
        distanceTopLabel.constant = 25
        distanceLabelPhoto.constant = 45
        distancePhotoTF.constant = 90
        distanceTFButton.constant = 100
        distanceButtonBottom.constant = 100
        
    }
    
    
    

   

}