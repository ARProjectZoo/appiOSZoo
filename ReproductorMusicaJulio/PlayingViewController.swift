//
//  PlayingViewController.swift
//  ReproductorMusicaJulio
//
//  Created by alumnos on 23/11/17.
//  Copyright © 2017 julio. All rights reserved.
//

import UIKit

class PlayingViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = songs[0].name
        artistLabel.text = songs[0].artist
        imageView.image = songs[0].image
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
