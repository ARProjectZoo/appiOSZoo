//
//  appTools.swift
//  ReproductorMusicaJulio
//
//  Created by alumnos on 17/1/18.
//  Copyright © 2018 julio. All rights reserved.
//

import Foundation
import UIKit
let URLprincipal = "http://localhost:8888/APIZOOAR/API%20/fuelphp/public/"
extension UITextField {
    func customAspect(){
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.init(red:0.13, green:0.55, blue:0.13, alpha:1.0).cgColor

    }
}
var myArrayProfile: [UIImage] = [#imageLiteral(resourceName: "fotousuario"),#imageLiteral(resourceName: "fotousuario"),#imageLiteral(resourceName: "fotousuario"),#imageLiteral(resourceName: "fotousuario"),#imageLiteral(resourceName: "fotousuario"),#imageLiteral(resourceName: "fotousuario"),#imageLiteral(resourceName: "fotousuario")]

