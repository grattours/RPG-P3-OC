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
        print("(Game) initialisation du jeux")
        print("(Game) team1.buildTeam() ")
        team1.buildTeam()
        print("(Game) team2.buildTeam() ")
        team2.buildTeam()
        print("============== EQUIPES ET PERSONNAGES ===============")
        team1.parade()
        team2.parade()
        let totLifePtsEq1 = totalizePoints(team: team1, typePts: "lifePoints")
        let totLifePtsEq2 = totalizePoints(team: team2, typePts: "lifePoints")
        let totDamagePtsEq1 = totalizePoints(team: team1, typePts: "damage")
        let totDamagePtsEq2 = totalizePoints(team: team2, typePts: "damage")
        
        // print("Equipe 2 - total points de vie :  ")
        // gotprint(totalizePoints(team: team2, typePts: "lifePoints"))
        print("L'équipe \(team1.teamName) affronte l'équipe \(team2.teamName) avec \(totLifePtsEq1) points de vie contre \(totLifePtsEq2) ")
        print(" et un pouvoir de nuisance de \(totDamagePtsEq1): contre : \(totDamagePtsEq2) ")
        print("")
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
    func totalizePoints(team: Team, typePts: String)-> Int {
        var totpts = 0
        for characters in team.teamMembers {
            switch typePts {
            case  "lifePoints" :
                totpts = totpts + characters.lifePoints
            case  "damage" :
                totpts = totpts + characters.damage
            default :
                break
            }
        }
        return totpts
    }
    
    func battle(){
        print("(Game) battle")
    }
    
}
