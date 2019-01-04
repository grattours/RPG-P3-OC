//
//  game.swift
//  RPG-P3-OC
//
//  Created by Luc Derosne on 20/12/2018.
//  Copyright © 2018 Luc Derosne. All rights reserved.
//

import Foundation
// class game => start of play, battles in loops
class Game{
    // a game is a set of battles
    var team1 = Team()
    var team2 = Team()
    var starDate = Date()
    var endDate = Date()
    var nbDuel: Int = 1
    var tabOfDuelStartTime:[Date] = [Date()]
    var tabOfDuelEndTime:[Date] = [Date()]
    init(){
        team1 = Team()
        team2 = Team()
        bootingGame()
    }
    
    func bootingGame() {
        team1.buildTeam()
        team2.buildTeam()
            
        introductionOfTheGame()
    }
    // a battle is a set of duels
    func battle(){
        var attackingTeam = team1
        var defendingTeam = team2
        var isTeamDead = false
        var defender: Character?
        
        attackingTeam = team2
        defendingTeam = team1
        
        // As long as a team is not empty
        repeat {
            swap(&attackingTeam, &defendingTeam)
            print(" 🤜 DUEL \(nbDuel) 🔸🔹🔶🔷🔸🔹🔶🔷 Les \(attackingTeam.teamName) attaquent les  \(defendingTeam.teamName) 🔷🔶🔹🔸🔷🔶🔹🔸 🤛 " )
            tabOfDuelStartTime.append(Date())
            let attacker = attackingTeam.chooseCharacterFromTheTeam(attackingTeam)
            print("l'attaquant est : \(attacker.name)")
            randomize(attacker)
            if attacker.type == .magus {
                doCare(attackingTeam, attacker)
            } else {
                makeFight(defendingTeam, &defender, attacker)
                print()
                print("Fin du DUEL\(nbDuel)")
                resultOfTheDuel()
            }
            tabOfDuelEndTime.append(Date())
            nbDuel += 1
            if totalizePoints(team: defendingTeam, typePts: "lifePoints") <= 0 {
                let score = totalizePoints(team: attackingTeam, typePts: "lifePoints")
                print ("🏆🏅🏆🎖🏆🏅🏆    GAME OVER    🏅🏆🎖🏆🏅🏆🎖🏆🏅🏆")
                print(" L'Equipe \(attackingTeam.teamName) 🏆 GAGNE ! avec \(score) pts 🏆")
                print(" contre L'Equipe \(defendingTeam.teamName) ⚰️ ")
                print ("🏆🏅🏆🎖🏆🏅🏆🎖🏆🏅🏆🎖🏆🏅🏆🎖🏆🏅🏆🎖🏆🏅🏆🎖🏆🏅")
                isTeamDead = true
            }
            print("")
        } while (!isTeamDead)
        
        awardsCeremony()
        
    }
    
    // if the attacker is not a mage, it's a duel
    fileprivate func makeFight(_ defendingTeam: Team, _ defender: inout Character?, _ attacker: Character) {
        print()
        print("Choisir un adversaire dans l'Equipe \(defendingTeam.teamName)")
        defender = defendingTeam.chooseCharacterFromTheTeam(defendingTeam)
        defender!.lifePoints -= attacker.damage
        print("\(attacker.name) affronte \(defender!.name) qui passe à \(defender!.lifePoints) points de vie")
        if defender!.lifePoints <= 0 {
            print(" 💀 qui meurt et sort du jeu 💀")
            defender!.lifePoints = 0
        } else {
            print(" et qui reste en vie")
        }
    }
    
    // if it's a mage draw of his new drug in the pharmacy
    // if not draw a change of weapon in the armory
    func randombox(charTarget : Character) {
        print()
        print(" 🎲🎲🎲🎲🎲⛑🥺😃 Tirage aléatoire dans la magicBox 😃🥺⛑ 🎲🎲🎲🎲🎲" )
        if charTarget.type == .magus {
            print("✚✚✚✚💊💊 dans la pharmacie 💊💊✚✚✚ ")
            let pharmacy : [String: Int] = ["Perlinpimpim": 3, "DOLIPRANE": 20, "Poudre d'escampette": 1, "COCAINE": 40,"limonade":5, "AMPHETAMINE": 30, "Thé vert": 8, "META": 25, "Placebo" : 4]
            let randomWeapon = pharmacy.randomElement()
            charTarget.weapon = randomWeapon!.key
            charTarget.damage = randomWeapon!.value
        } else {
            print("⚔️🗡🧨💀🧦 dans l'armurerie ⚔️🗡🧨💀🧦 ")
            let armory : [String: Int] = ["cure-dent": 5, "BAZOOKA": 50, "Paquerette": 1, "ROCKET": 60, "Cerise": 6, "CATAPULTE": 40, "Fourchette": 10, "MISSILE": 90, "Chaussette": 7, "TANK": 70 ]
            let randomWeapon = armory.randomElement()
            charTarget.weapon = randomWeapon!.key
            charTarget.damage = randomWeapon!.value
        }
        print(" 🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲🎲" )
    } // end randombox
    
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
        
        print(" 🥁🔻🔺🔹🔶🔷 Equipe  \(team1.teamName) - \(totLifePtsEq1) points de vie - pouvoir de nuisance de \(totDamagePtsEq1) - contre :  ")
        print(" 🔷🔶🔹🔻🔺🥁 Equipe \(team2.teamName)  \(totLifePtsEq2) points de vie - pouvoir de nuisance de \(totDamagePtsEq2)")
    
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
    
    // a battle is so many duels that it takes to eliminate a team
    fileprivate func randomize(_ attacker: Character) {
        //  random option magic chest or no magic chest
        if Int.random(in: 0...1) == 1 {
            print("Tirage au sort => 📦 Coffre magique 📦!")
            randombox(charTarget: attacker)
            print("c'est mieux ou c'est pire, la nouvelle arme de \(attacker.name)" )
            print("est : \(attacker.weapon) avec un pouvoir de nuisance de  \(attacker.damage)")
        } else {
            print(" Tirage au sort => 😰😰PAS de coffre magique😰😰")
        }
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
    
    fileprivate func doCare(_ attackingTeam: Team, _ attacker: Character) {
        // the attacker is then healer
        print()
        print("Choisir un collégue à soigner  dans l'Equipe \(attackingTeam.teamName)")
        // choose a character to look after in the same team
        let charactereToCare = attackingTeam.chooseCharacterFromTheTeam(attackingTeam)
        print("Le collègue à soigner est : \(charactereToCare.name)")
        charactereToCare.lifePoints += attacker.damage
    }
    
    
    fileprivate func awardsCeremony() {
        endDate = Date()
        let elapsedTime = endDate.timeIntervalSince(starDate)
        print("la partie c'est déroulé entre le \(starDate.toString()) et le \(endDate.toString())")
        
        let hhI:Int = Int(elapsedTime/3600)
        let minI:Int = Int((elapsedTime / 60)) % 60
        let secI:Int = Int(elapsedTime) % 60
        let hhS:String = String(format: "%02d", hhI)
        let minS:String = String(format: "%02d", minI)
        let secS:String = String(format: "%02d", secI)
        let playtime = "\(hhS) heure(s):\(minS) mn :\(secS) sec"
        
        print("soit une durée de : \(Int(elapsedTime)) secondes = " + playtime)
        print("avec \(nbDuel-1) duels")
        let avg = Int(elapsedTime) / nbDuel
        print("soit une moyenne de \(avg) secondes par duels")
        print()
        let maxStart = tabOfDuelStartTime.count - 1
        let maxEnd = tabOfDuelEndTime.count - 1
        print("maxStart \(maxStart) maxEnd \(maxEnd)")
        for i in 0...maxStart - 1 {
            let elapsedDuel =
                timeBetweenToDateInHHMMSS(tabOfDuelEndTime[i], tabOfDuelStartTime[i])
            print("Duel N° \(i+1) Début  : \(tabOfDuelStartTime[i].toHHMSS()) Fin  : \(tabOfDuelEndTime[i].toHHMSS()) soit \(elapsedDuel)")
        }
        print("♠️♥️♣️♦️♠️♥️♣️♦️♠️♥️♣️♦️♠️ E N D ♥️♣️♦️♠️♥️♣️♦️♠️♥️♣️♦️♠️♥️♣️♦️")
    }
    
    // transforms a date difference into a String in the format hh: mm: ss
    func timeBetweenToDateInHHMMSS(_ endDte:Date, _ startDte :Date) -> String  {
        let elapsedTime = endDte.timeIntervalSince(startDte)
//        let hhI:Int = Int(elapsedTime/3600)
//        let minI:Int = Int((elapsedTime / 60)) % 60
        let secI:Int = Int(elapsedTime) % 60
//        let hhS:String = String(format: "%02d", hhI)
//        let minS:String = String(format: "%02d", minI)
        let secS:String = String(format: "%02d", secI)
        // let playtime = "\(hhS) heure(s):\(minS) mn :\(secS) sec"
        let playtime = "\(secS) sec"
        return playtime
    }
    
} // fin Game

