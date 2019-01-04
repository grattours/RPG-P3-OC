//
//  main.swift
//  RPG-P3-OC
//
//  Created by Luc Derosne on 21/12/2018.
//  Copyright © 2018 Luc Derosne. All rights reserved.
//
print("Jeu de rôles - P3 - formation OC")
print("==== S I M U L A T I O N =======")

import Foundation

// conflict game battle duel
var isWarOn: Bool = true
var reply: String = ""

// main loop  (Conflict => Game(s) => Battle(s)=> duels)
while isWarOn {
    
    let currentGame =  Game()
    isWarOn = true
        currentGame.battle()
        print()
        print()
        print ("Voulez vous déclencher un nouveau conflit (O/N) ?")
        repeat { reply = readLine() ?? "N"} while reply != "O" && reply != "N"
        switch reply {
        case "O" :
            isWarOn = true
        case "N" :
            isWarOn = false
        default :
            print("choix incorrect")
    }

}

print("au revoir")
print("  La guerre est finie ! ")
