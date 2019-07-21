//
//  ViewController.swift
//  Legends
//
//  Created by Rory Hinnen on 7/20/19.
//  Copyright © 2019 Rory Hinnen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ActionLabel: UILabel!
    @IBOutlet weak var CharacterLabel: UILabel!
    @IBOutlet var CharacterButton: UITapGestureRecognizer!
    @IBOutlet var Stepper: [UIStepper]!
    
    var warband = Warband()
    override func viewDidLoad() {
        super.viewDidLoad()
        if warband.characters.count == 0 {
            CharacterLabel.text = "Add Characters"
        }
        
        // Do any additional setup after loading the view.
    }


}

