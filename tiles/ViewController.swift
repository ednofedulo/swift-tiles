//
//  ViewController.swift
//  tiles
//
//  Created by Edno Fedulo on 05/03/19.
//  Copyright © 2019 Edno Fedulo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tile = TileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tile.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tile)
        
        tile.widthAnchor.constraint(equalToConstant: 100).isActive = true
        tile.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        tile.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15).isActive = true
        tile.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        
        tile.title = "test tile"
        
        if let image = UIImage(named: "sample") {
            tile.backgroundImage = image
            tile.animateBackground(withDuration: 10.0)
        }
        
        tile.clipsToBounds = true
        
        tile.layoutIfNeeded()
        
    }


}

