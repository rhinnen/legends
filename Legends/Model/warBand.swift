//
//  warBand.swift
//  Legends
//
//  Created by Rory Hinnen on 7/20/19.
//  Copyright © 2019 Rory Hinnen. All rights reserved.
//

import Foundation

struct Character {
    var name = ""
    var maxActions = 0
    var availableActions = 0
    var activated = false
    
    init(name: String, actions: Int) {
        self.name = name
        self.maxActions = actions
        self.availableActions = self.maxActions
        self.activated = false
    }
    
    mutating func decrementAction() {
        if self.availableActions > 0 {
            self.availableActions -= 1
        }
    }
    
    mutating func incrementAction() {
        if self.availableActions < self.maxActions {
            self.availableActions += 1
        }
    }
    
    mutating func reset() {
        self.availableActions = self.maxActions
    }
    
    func actionsLeft() -> Int {
        return self.availableActions
    }
}

struct Warband {
    var characters = [Character]()
    
    mutating private func reset() {
        for each in 0 ... self.characters.count-1 {
            self.characters[each].activated = false
            self.characters[each].reset()
        }
    }
    
    mutating func kill(index: Int) {
        characters.remove(at: index)
    }
    
    mutating func add(name: String, maxActions: Int) -> Bool {
        if characters.contains(where: {$0.name == name}) {
            return false
        } else {
            characters.append(Character(name: name, actions: maxActions))
            return true
        }
    }
    
    mutating func pull() -> Int? {
        // Checks if it's time for tea
        //   if it is, reset all the characters and return nil
        //
        //   if it's not, pulls a random character who hasn't had a turn yet
        //   and returns the index
        let howOftenWeTakeTea = 8
        if Int.random(in: 0...howOftenWeTakeTea) == 0 { // Tea break
            reset()
            return nil
        } else {
            let pool = self.characters.filter({$0.activated == false}) // We only draw from characters who haven't had a turn
            if pool.count > 0 { // We still have characters who want to do something
                if let char = pool.randomElement()?.name {
                    if let i = self.characters.firstIndex(where: {$0.name == char}) {
                        self.characters[i].activated = true
                        return i
                    }
                }
            } else { // Every has had a bite at the apple, the turn is over
                reset()
                return nil
            }
            return nil // We almost never hit this, only if there are no elements in the array
        }
    }
}
