//
//  main.swift
//  RPG-P3-OC
//
//  Created by Luc Derosne on 21/12/2018.
//  Copyright © 2018 Luc Derosne. All rights reserved.
//

import Foundation

// conflict game battle fight
var isWarOn: Bool = true
var reply: String = ""
print("Jeu de rôles - P3 - formation OC")
print("==== S I M U L A T I O N =======")
while isWarOn {
    isWarOn = true
    // boule partie
    print(" Game started ")
    // instancier un game
    print(" création équipes et personnages")
    print("  ... currect game ... ")
    print(" ....jeu - batailles ")
    print(" ... Equipe vainqueur - scores")
    // déclencher une nouvelle guerre ?
    print ("Voulez vous déclencher un nouveau conflit (O/N) ?")
    repeat { reply = readLine() ?? "N"} while reply != "O" && reply != "N"
    // boucler sur une autre partie ?
    // fin boule partie
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
