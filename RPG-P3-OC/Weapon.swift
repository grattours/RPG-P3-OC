//
//  Weapon.swift
//  RPG-P3-OC
//
//  Created by Luc Derosne on 22/12/2018.
//  Copyright © 2018 Luc Derosne. All rights reserved.
//

// j'ai un doute....

import Foundation

class Weapon{
    let  weaponName: String
    let  deathPoints: Int
    init(weaponName: String, deathPoints: Int ){
        self.weaponName = weaponName
        self.deathPoints = deathPoints
    }
}
//
//class Sword: Weapon{
//    init(){
//        super.init(weaponName: "Sword", deathPoints: 40)
//    }
//}
