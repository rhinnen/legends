//
//  AddCharacterViewController.swift
//  Legends
//
//  Created by Rory Hinnen on 7/20/19.
//  Copyright © 2019 Rory Hinnen. All rights reserved.
//

import UIKit

class AddCharacterViewController: UIViewController {

    @IBOutlet weak var characterTextField: UITextField!
    @IBOutlet weak var actionLabel: UILabel!
    @IBOutlet weak var actionStepper: UIStepper!

    @IBAction func cancelButton(_ sender: Any) {
    }
    
    @IBAction func acceptButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
