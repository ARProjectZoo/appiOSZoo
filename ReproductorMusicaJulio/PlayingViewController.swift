
import UIKit

class PlayingViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var currentSong: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentSong = 0
        newSong(SongIndex: currentSong)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
        @IBAction func back(_ sender: Any) {
        if currentSong > 0{
            currentSong -= 1
            newSong(SongIndex: currentSong)
        }
    }
    @IBAction func forward(_ sender: Any) {
        if currentSong > 0{
            currentSong += 1
            newSong(SongIndex: currentSong)
        }
    }
    func newSong(SongIndex: Int){
        nameLabel.text = songs[SongIndex].name
        artistLabel.text = songs[SongIndex].artist
        imageView.image = songs[SongIndex].image
    }

    @IBAction func swipe(_ sender: UISwipeGestureRecognizer) {
        print(sender.direction)
    }
    @IBAction func rotationImage(_ sender: UIRotationGestureRecognizer) {
        sender.view?.transform = (sender.view?.transform.rotated(by:
            sender.rotation))!
        sender.rotation = 0
    }
    
}
    

