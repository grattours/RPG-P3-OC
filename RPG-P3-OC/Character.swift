//
//  character.swift
//  RPG-P3-OC
//
//  Created by Luc Derosne on 20/12/2018.
//  Copyright © 2018 Luc Derosne. All rights reserved.
//

import Foundation
// character type
enum charType {
    case fighter, magus, colossus, dwarf
}

// character => type => weapon, damages, lifepoints
class Character{
    var name: String = ""
    var type: charType
    var weapon: String = "Axe"
    var lifePoints: Int = 0
    var damage: Int = 10
    static var allNames = [String]()
//  each character to a type, weapon and life points
    init(type: charType) {
        self.type = type
        switch self.type {
        case .fighter:
            self.weapon = "Sword"
            self.damage = 10
            self.lifePoints = 100
        case .magus:
            self.weapon = "Wand"
            self.damage = 20
            self.lifePoints = 80
        case .colossus:
            self.weapon = "Mace"
            self.damage = 30
            self.lifePoints = 60
        case .dwarf:
            self.weapon = "Axe"
            self.damage = 50
            self.lifePoints = 40
        }
    }

}

