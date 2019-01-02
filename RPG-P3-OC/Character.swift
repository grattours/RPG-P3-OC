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
//enum weapon {
//    case sword(damage: Int)
//    case wand(damage: Int)
//    case mace(damage: Int)
//    case axe(damage: Int)
//}

class Character{
    var name: String = ""
    var type: charType
    var weapon: String = "Axe"
    var lifePoints: Int = 0
    var damage: Int = 10
    static var allNames = [String]()
//    var resistance: Int = 0  , option ? bonus ? à voir
//  chaque personnage à un type, une arme et des points de vie
    init(type: charType) {
        self.type = type
        switch self.type {
        case .fighter:
//            self.weapon = .sword(damage: 10)
            self.weapon = "Sword"
            self.damage = 10
            self.lifePoints = 100
        case .magus:
//            self.weapon = .wand(damage: 20)
            self.weapon = "Wand"
            self.damage = 20
            self.lifePoints = 80
        case .colossus:
//            self.weapon = .mace(damage: 30)
            self.weapon = "Mace"
            self.damage = 30
            self.lifePoints = 60
        case .dwarf:
//            self.weapon = .axe(damage: 50)
            self.weapon = "Axe"
            self.damage = 50
            self.lifePoints = 40
        }
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
//???
//class Colossus: Character {
//
//}
//
//class Fighter: Character {
//
//}
//
//class Mage: Character {
//
//}
//
//class Dwarf: Character {
//
//}
