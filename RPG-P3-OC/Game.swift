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
    var starDate = Date()
    var endDate = Date()
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
            
        introductionOfTheGame()
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
    
    fileprivate func randomize(_ attacker: Character) {
        //            print("     subtilité Etape3 =>  Tirage aléatoire 1 ou 2  (1 Coffre, 2 pas de coffre")
        //  tirage au hasard si randombox ou pas -
        if Int.random(in: 0...1) == 1 {
            randombox(charTarget: attacker)
            print("Tirage au sort => 📦 Coffre magique 📦!")
            print("c'est mieux ou c'est pire, la nouvelle arme de \(attacker.name)" )
            print("est : \(attacker.weapon) avec un pouvoir de nuisance de  \(attacker.damage)")
        } else {
            print(" Tirage au sort => 😰😰PAS de coffre magique😰😰")
        }
    }
    
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
            randomize(attacker)
            if attacker.type == .magus {
                // l'attaquant est alors soigneur
                print("Choisir un collégue à soigner  dans l'Equipe \(attackingTeam.teamName)")
                // DoCare()
                // choisir personnage à soigner dans la même équipe (sauf lui même ?)
                let charactereToCare = attackingTeam.chooseCharacterFromTheTeam(attackingTeam)
                print("Le collègue à soigner est : \(charactereToCare.name)")
                charactereToCare.lifePoints += attacker.damage
            } else {
                print()
                print("Choisir un adversaire dans l'Equipe \(defendingTeam.teamName)")
                // makeFight()
                defender = defendingTeam.chooseCharacterFromTheTeam(defendingTeam)
                // print("L'adversaire est : \(defender!.name)")
                defender!.lifePoints -= attacker.damage
                print("\(attacker.name) affronte \(defender!.name) qui passe à \(defender!.lifePoints) points de vie")
                if defender!.lifePoints <= 0 {
                    print(" 💀 qui meurt et sort du jeu 💀")
                    defender!.lifePoints = 0
                } else {
                    print(" et qui reste en vie")
            }
                print("Fin du DUEL\(nbDuel)")
                resultOfTheDuel()
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
        endDate = Date()
        print("début \(starDate.toString())")
        print("fin \(endDate.toString())")
    }
    // si l'attaquant n'est pas un mage, c'est un duel
    func makeFight() {
        
    }
    // si c'est un mage tirage au sort de son nouveau médicament dans la pharmacie
    // sinon tirage au sort d'un changement d'arme dans l'armurerie
    func randombox(charTarget : Character) {
        print()
        print(" 🎲🎲🎲🎲🎲⛑ 🥺😃   Tirage aléatoire dans la magicBox 😃🥺⛑ 🎲🎲🎲🎲🎲" )
        if charTarget.type == .magus {
            print("✚✚✚✚💊💊 dans la pharmacie 💊💊✚✚✚ ")
            let pharmacy : [String: Int] = ["Perlinpimpim": 3, "DOLIPRANE": 20, "Poudre d'escampette": 1, "COCAINE": 40,"limonade":5, "AMPHETAMINE": 30, "Thé vert": 8, "META": 25, "Placebo" : 4]
            let randomWeapon = pharmacy.randomElement()
            print("Tirage aléatoire  du nouveau pouvoir du mage : \(String(describing: randomWeapon!.key))")
            print(" d'une capacité de soin de : \(String(describing: randomWeapon!.value)) points")
            charTarget.weapon = randomWeapon!.key
            charTarget.damage = randomWeapon!.value
        } else {
            print("⚔️🗡🧨💀🧦 dans l'armurerie ⚔️🗡🧨💀🧦 ")
            let armory : [String: Int] = ["cure-dent": 1, "BAZOOKA": 50, "Paquerette": 0, "ROCKET": 60, "Cerise": 4, "CATAPULTE": 30, "Fourchette": 5, "MISSILE": 80, "Chaussette": 3, "TANK": 60 ]
            let randomWeapon = armory.randomElement()
            print("Tirage aléatoire  de l'arme : \(String(describing: randomWeapon!.key))")
            print(" d'un pouvoir de  nuisance de : \(String(describing: randomWeapon!.value))")
            charTarget.weapon = randomWeapon!.key
            charTarget.damage = randomWeapon!.value
        }
        print(" 🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲" )
    } // randombox
    
    fileprivate func introductionOfTheGame() {
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
    
    fileprivate func resultOfTheDuel() {
        let totLifePtsEq1 = totalizePoints(team: team1, typePts: "lifePoints")
        let totLifePtsEq2 = totalizePoints(team: team2, typePts: "lifePoints")
        print()
        print("🤼‍♀️👓👓🕶🕶👓👓🕶🕶     fin du Duel     🕶🕶👓👓🕶🕶👓👓🤼‍♀️")
        print(" Equipe \(team1.teamName) a \(totLifePtsEq1) pts de vie")
        print(" Equipe \(team2.teamName) a \(totLifePtsEq2) pts de vie")
        print("🤼‍♀️👓👓🕶🕶👓👓🕶🕶👓👓🕶🕶👓👓🕶🕶👓👓🕶🕶👓👓🕶🕶👓👓🕶🤼‍♀️")
        print("")
    }
    
    
} // fin Game

