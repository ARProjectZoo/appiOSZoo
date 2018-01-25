

import UIKit
import ZAlertView
import Device

class ProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate,UIAlertViewDelegate {
    
    //variables
    var isActive = true
    
    //outlets
    @IBOutlet weak var btnImage: UIButton!
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var addStoryButton: UIButton!
    
    //label
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var momentsLabel: UILabel!
    
    
    //layaout
    @IBOutlet weak var distanceLabelCollection: NSLayoutConstraint!
    @IBOutlet weak var distancetopMobile: NSLayoutConstraint!
    @IBOutlet weak var distanceLabels: NSLayoutConstraint!
    @IBOutlet weak var distanceButtonName: NSLayoutConstraint!
    
    //popup
    let dialog = ZAlertView()
        public var screenWidth: CGFloat{
            return UIScreen.main.bounds.width
        }
        public var screenHeight: CGFloat{
            return UIScreen.main.bounds.height
        }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.dataSource = self
        collection.delegate = self
        myFunc()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myArrayProfile.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewController", for: indexPath) as! ImageCollectionViewController
        cell.imgImage.image = myArrayProfile[indexPath.row]
        
        return cell
    }
    
    @IBAction func btnProfile(_ sender: Any) {
        let alertView = UIAlertController(title: "Image", message: "Do you want take photo or choose in your gallery?", preferredStyle: .actionSheet)
        let gallery = UIAlertAction(title: "Cancel", style: .default) {
            (action) in self.btnImage.imageView?.image = UIImage()
        }
        let camera = UIAlertAction(title: "Gallery", style: .default) {
            (action) in self.btnImage.imageView?.image = UIImage()
        }
        let cancel = UIAlertAction(title: "Camera", style: .default) {
            (action) in self.dismiss(animated: true, completion: nil)
        }
        alertView.addAction(cancel)
        alertView.addAction(camera)
        alertView.addAction(gallery)
        present(alertView, animated: true, completion: nil)
    }
    
    
    
    
    
    
    func myFunc() {
        
        switch Device.size() {
        //case .screen3_5Inch:  print("It's a 3.5 inch screen")
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
        //case .screen7_9Inch:  print("It's a 7.9 inch screen")
        //case .screen9_7Inch:  print("It's a 9.7 inch screen")
        //case .screen12_9Inch: print("It's a 12.9 inch screen")
        default:
            print("Unknown size")
        }
    }
    
    

    //tamaños pantalla
    func screen4Inch () {
        //perfect
        distanceLabels.constant = 50
    }
    func screen4_7Inch () {
        //perfect
        distanceLabels.constant = 40
        distancetopMobile.constant = 40
        distanceLabelCollection.constant = 40
        distanceButtonName.constant = 40
    }
    func screen5_5Inch (){
        //perfect
        //momentsLabel.font = UIFont(name: momentsLabel.font.fontName, size: 20)
        distanceLabels.constant = 90
        distancetopMobile.constant = 50
        distanceLabelCollection.constant = 40
        distanceButtonName.constant = 40
    }
    func screen5_8Inch (){
        //perfect
        //momentsLabel.font = UIFont(name: momentsLabel.font.fontName, size: 20)

        distanceLabelCollection.constant = 40
        distanceButtonName.constant = 40
        distanceLabels.constant = 100
        distancetopMobile.constant = 50

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        _ = segue.destination as! EditStoryViewController
        
    }
    
}
