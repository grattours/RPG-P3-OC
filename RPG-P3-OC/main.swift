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


// conflict game battle fight
var isWarOn: Bool = true
var reply: String = ""
//let currentGame =  Game()

//print("Jeu de rôles - P3 - formation OC")
//print("==== S I M U L A T I O N =======")

// Boucle sur les conflits (Conflict => Game(s) => Battle(s)=> fights)
while isWarOn {
    
    let currentGame =  Game()
    isWarOn = true
//        print(" (main) Prémises de la guerre ")
//        print(" (main) création équipes et personnages")
        print("  (main) jeu en cours ... ")
        print(" (main)jeu - batailles ")
        currentGame.battle()
        print(" (main) Equipe vainqueur - scores")
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
