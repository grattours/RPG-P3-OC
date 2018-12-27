//
//  character.swift
//  RPG-P3-OC
//
//  Created by Luc Derosne on 20/12/2018.
//  Copyright © 2018 Luc Derosne. All rights reserved.
//

import Foundation
// personnage - 3 personnages / équipes
enum charType {
    case fighter, magus, colossus, dwarf
}
enum weapon {
    case sword(damage: Int)
    case wand(damage: Int)
    case mace(damage: Int)
    case axe(damage: Int)
}

class Character{
    var name: String = ""
    var type: charType
    var weapon: weapon
    var lifePoint: Int = 0
// chaque personnage à un type, une arme et des points de vie
    init(type: charType) {
        self.type = type
        switch self.type {
        case .fighter:
            self.weapon = .sword(damage: 10)
            self.lifePoint = 100
        case .magus:
            self.weapon = .wand(damage: 20)
            self.lifePoint = 80
        case .colossus:
            self.weapon = .mace(damage: 10)
            self.lifePoint = 60
        case .dwarf:
            self.weapon = .axe(damage: 50)
            self.lifePoint = 40
        }
        print("Character")
    }
    
//let character1 = charType.fighter
//let character2 = charType.colossus


    // nom, type, vie, status (mort/vivant ?)
    // (vérifier que le nom n'est pas déja utilsé)
    // initialisation
    // jouer contre un adversaire
    // attaquer
    // soigner
    // recevoir des coups (losePoints) / (winPoints)
    // mourir
    // et la suite
}

class Colossus: Character {
    
}

class Fighter: Character {
    
}

class Mage: Character {
    
}

class Dwarf: Character {
    
}
