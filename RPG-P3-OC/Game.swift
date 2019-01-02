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
            
        print("  ⭐️⭐️⭐️⭐️⭐️⭐️⭐️ 🌝  EQUIPES ET PERSONNAGES  🌝 ⭐️⭐️⭐️⭐️⭐️⭐️⭐️")
        print("L'EQUIPE : \(team1.teamName) est composée des personnages suivants :")
        team1.parade()
        print("L'EQUIPE : \(team2.teamName) est composée des personnages suivants :")
        team2.parade()
        let totLifePtsEq1 = totalizePoints(team: team1, typePts: "lifePoints")
        let totLifePtsEq2 = totalizePoints(team: team2, typePts: "lifePoints")
        let totDamagePtsEq1 = totalizePoints(team: team1, typePts: "damage")
        let totDamagePtsEq2 = totalizePoints(team: team2, typePts: "damage")
    
        print("🔵 L'équipe \(team1.teamName) affronte l'équipe \(team2.teamName) avec \(totLifePtsEq1) points de vie contre \(totLifePtsEq2) 🔵 ")
        print(" et un pouvoir de nuisance de \(totDamagePtsEq1) 💣: contre : \(totDamagePtsEq2) 💣")
        print("")
        print("  ⭐️⭐️⭐️⭐️⭐️⭐️⭐️ 🌝  ⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️  🌝 ⭐️⭐️⭐️⭐️⭐️⭐️⭐️")
        print(""); print("")
    }
    
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
    
    
//une bataille c'est donc autant de duels qu'il en faut pour éliminer une équipe
// la bataille est lancée dans le main
    
    func battle(){
//  print("(Game) battle")
//        print("Equipe1 est attaquante" )
//        print("Equipe2 est défensive")
        var attackingTeam = team1
        var defendingTeam = team2
        var isTeamDead = false
        var defender: Character?
        var nbDuel: Int = 1
        
        attackingTeam = team2
        defendingTeam = team1
            // print("boucle  -repeat ")
        repeat {
            swap(&attackingTeam, &defendingTeam)
            print(" 🤜 DUEL \(nbDuel) 🔸🔹🔶🔷🔸🔹🔶🔷 Les \(attackingTeam.teamName) attaquent les  \(defendingTeam.teamName) 🔷🔶🔹🔸🔷🔶🔹🔸 🤛 " )
            // print("Choisir un attaquant dans l'Equipe \(attackingTeam.teamName)")
            let attacker = attackingTeam.chooseCharacterFromTheTeam(attackingTeam)
            print("l'attaquant est : \(attacker.name)")
//            print("     subtilité Etape3 =>  Tirage aléatoire 1 ou 2  (1 Coffre, 2 pas de coffre")
            // tirage au hasard si randombox ou pas -
//            if Int.random(in: 0...1) == 1 {
//                randombox()
//                print("Coffre magique")
//            } else {
//                print(" pas de coffre magique")
//            }
            //randombox()
            print("Choisir un adversaire dans l'Equipe \(defendingTeam.teamName)")
            //  si attaquant est mage alors soin même équipe sinon attaque
            // makeFight  DoCare
            if attacker.type == .magus {
                print("soins")
                // DoCare()
            } else {
                // makeFight()
                defender = defendingTeam.chooseCharacterFromTheTeam(defendingTeam)
                print("L'adversaire est : \(defender!.name)")
                defender!.lifePoints -= attacker.damage
                print("\(attacker.name) affronte \(defender!.name) qui passe à \(defender!.lifePoints) points de vie")
                if defender!.lifePoints <= 0 {
                    print(" 💀 qui meurt et sort du jeu 💀")
                    defender!.lifePoints = 0
                    // comment virer le personnage.
                    // print("va mourrir")
                    // defendingTeam.removeCharacterFromTheTeam(defender!)
                    // merci StackOverflow
                   // defender = nil

                    
                } else {
                    print(" et qui reste en vie")
            }
//                print(" point de la victime ")
//                print(defender!.lifePoints)
                let totLifePtsEq1 = totalizePoints(team: team1, typePts: "lifePoints")
                let totLifePtsEq2 = totalizePoints(team: team2, typePts: "lifePoints")
                print("🤼‍♀️👓👓🕶🕶👓👓🕶🕶 fin de duel 🕶🕶👓👓🕶🕶👓👓🕶🕶👓👓🤼‍♀️")
                print(" Equipe \(team1.teamName) a \(totLifePtsEq1) pts de vie")
                print(" Equipe \(team2.teamName) a \(totLifePtsEq2) pts de vie")
                print("🤼‍♀️👓👓🕶🕶👓👓🕶🕶👓👓🕶🕶👓👓🕶🕶👓👓🕶🕶👓👓🕶🕶👓👓🕶🤼‍♀️")
                print("")
            }
            // swap(&<#T##a: T##T#>, &<#T##b: T##T#>)  ??
            nbDuel += 1
            if totalizePoints(team: defendingTeam, typePts: "lifePoints") <= 0 {
                print(" L'Equipe \(defendingTeam.teamName) ⚰️ PERD ! ⚰️ ")
                print(" L'Equipe \(attackingTeam.teamName) 🏆 GAGNE ! 🏆")
                isTeamDead = true
            }
            print("")
        } while (!isTeamDead)
        print("fin de boucle - tant qu'une équipe n'est pas vide")
        
    }
    
    func randombox() {
    // avec une arme aléatoire
    // si mage => tirage aléatoire dans la pharmacie
    // sinon => tirage aléatoire dans l'armuerie
        // if attacker.type = "magus" {
//                let pharmacy = ["Perlinpimpim", "DOLIPRANE", "Poudre d'escampette", "COCAINE","limonade", "AMPHETAMINE", "Thé vert", "META", "Placebo" ]
//                //...
        // else {
//                let armory = ["cure-dent", "BAZOOKA", "Paquerette", "ROCKET", "Cerise", "CATAPULTE", "Fourchette", "MISSILE", "Chaussette", "TANK" ]
        //
        
        let armory : [String: Int] = ["cure-dent": 1, "BAZOOKA": 50, "Paquerette": 0, "ROCKET": 60, "Cerise": 4, "CATAPULTE": 30, "Fourchette": 5, "MISSILE": 80, "Chaussette": 3, "TANK": 60 ]
                //...
        let randomWeapon = armory.randomElement()
        print("Tirage aléatoire  de l'arme : \(String(describing: randomWeapon!.key))")
        print(" d'un pouvoir de  nuisance de : \(String(describing: randomWeapon!.value))")
        print()

    
    }
}
