//
//  game.swift
//  RPG-P3-OC
//
//  Created by Luc Derosne on 20/12/2018.
//  Copyright © 2018 Luc Derosne. All rights reserved.
//

import Foundation

class Game{
    // Equipes (class ?) paramétrer le nombre de personnage ?
    // un jeu est un ensemble de batailles (à compter)
    var team1 = Team()
    var team2 = Team()
    init(){
        team1 = Team()
        team2 = Team()
        bootingGame()
    }
    // Personnages
    // presentation
    // bataille
    // suite
    func bootingGame() {
        print("(Game) initialisation du jeux"
        )
        print("(Game) team1.buildTeam() ")
        team1.buildTeam()
        print("(Game) team2.buildTeam() ")
        team2.buildTeam()
        team1.parade() // séparer par équipes pour la suite
    }
    
//    func parade(){
//       print("===============EQUIPES ET PERSONNAGES ===============")
//        print("");  print("")
//        print("EQUIPE 1:"\())
//        print("      Personnage 1 : Nom - Type - Arme - Pts de vie - Force")
//        print("      Personnage 2 : Nom - Type - Arme - Pts de vie - Force")
//        print("      Personnage 3 : Nom - Type - Arme - Pts de vie - Force")
//        print("EQUIPE 2:")
//        print("      Personnage 1 : Nom - Type - Arme - Pts de vie - Force")
//        print("      Personnage 2 : Nom - Type - Arme - Pts de vie - Force")
//        print("      Personnage 3 : Nom - Type - Arme - Pts de vie - Force")
//        print("");  print("")
//    }
    
    func battle(){
        print("(Game) battle")
    }
    
}
