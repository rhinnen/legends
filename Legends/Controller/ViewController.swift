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
    @IBOutlet weak var stepperValue: UIStepper!
    
    var warband = Warband()
    var currentChar:Int? = nil
    var stepperLink = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if warband.characters.count == 0 {
            CharacterLabel.text = "Add Characters"
            ActionLabel.text = "-"
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func finishCharacter(_ sender: Any) {
        pullCharacter()
        update()
    }
    
    @IBAction func stepperAction(_ sender: Any) {
        if let index = currentChar {
            if stepperLink > Int(stepperValue.value) {
                warband.characters[index].decrementAction()
            } else {
                warband.characters[index].incrementAction()
            }
            stepperLink = Int(stepperValue.value)
            update()
        }
    }

    @IBAction func removeCharacter(_ sender: Any) {
        if let index = currentChar {
            warband.kill(index: index)
        }
        if warband.characters.count == 0 {
            currentChar = .none
        } else {
            currentChar = warband.pull()
        }
        update()
    }
    
    @IBAction func addCharacter(_ sender: Any) {
        let alert = UIAlertController(title: "Character Name?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Add a new combatant's name."
        })
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Max number of actions"
        })
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler:
        { action in
            if let name = alert.textFields?.first?.text {
                if let maxActions = Int(alert.textFields?.last?.text ?? "6") {
                    if !self.warband.add(name: name, maxActions: maxActions) {
                        self.duplicateCharacter(self, name: name)
                    } else {
                        self.pullCharacter()
                        self.update()
                    }
                }
            }
        }))
        
        self.present(alert, animated: true)
    }
    
    func duplicateCharacter(_ sender: Any, name: String) {
        let alert = UIAlertController(title: name, message: "This name is already in the warband.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
    
        self.present(alert, animated: true)
    }
    
    func pullCharacter() {
        currentChar = warband.pull()
        if let current = currentChar {
            stepperLink = warband.characters[current].availableActions
            stepperValue.value = Double(stepperLink)
        }
    }
    
    func update() {
        if let current = self.currentChar {
            CharacterLabel.text = warband.characters[current].name
            ActionLabel.text = String(warband.characters[current].actionsLeft())
        } else {
            CharacterLabel.text = "End of Turn"
            ActionLabel.text = "-"
        }
    }
}

