//
//  team.swift
//  RPG-P3-OC
//
//  Created by Luc Derosne on 20/12/2018.
//  Copyright © 2018 Luc Derosne. All rights reserved.
//

import Foundation
// team => 3 members, choice of characters, parade
class Team {
    var teamName: String = ""
    var teamMembers = [Character]()
    static var allCharNames = [String]()
    
    // constitution of 2 teams of 3 characters
    func buildTeam(){
        let nbMaxMembers = 3
        var i = 1
        while teamName == "" || teamName.first == " " {
            print("")
            print("Saisir le nom de l'Equipe : ")
            if let inputNameT = readLine(){
                teamName = inputNameT
                print("Choix des membres de l'équipe (\(teamName) : ")
            }
        } // end while
        while i <= nbMaxMembers {
            print(" ajout membre \(i) Equipe \(teamName)")
            i += 1
            teamMembers.append(chooseCharactere()!)
        }// end while
        
    } // end func buildTeam
    
// character choice
    func chooseCharactere() -> Character? {
        var charName = ""
        while charName == "" || charName.first == " " || !Team.allCharNames.contains(charName) {
            print("choisir un nom de personnage")
            if let inputNameC = readLine(){
                charName = inputNameC
                if !(Team.allCharNames.contains(charName))  {
                    Team.allCharNames.append(charName)
                } else {
                    print("nom déja existant, essaie encore ")
                    charName = ""
                }
            } // end if
         } // end While
            print("personnage : \(charName)")
            print ("choisir: 1 fighter 2 magus 3 Colossus 4 Dwarf")
            repeat { reply = readLine() ?? "1"} while reply != "1" && reply != "2" && reply != "3" && reply != "4"
        switch reply {
        case "1":
            print("Fighter")
            let character = Character(type: .fighter)
            character.name = charName
            return character
        case "2":
            print("Magus")
            let character = Character(type: .magus)
            character.name = charName
            return character
        case "3":
            print("Colossus")
            let character = Character(type: .colossus)
            character.name = charName
            return character
        case "4":
            print("Dwarf")
            let character = Character(type: .dwarf)
            character.name = charName
            return character
        default:
            break
            
        }

       return nil
        
    }  // end func
    
    // selecting a character in a team
    func chooseCharacterFromTheTeam(_ :Team) -> Character{
        var choosenCharactere: Character
         var isDead: Bool = false
        print()
         repeat {  // we choose a living character, otherwise we ask again
            //print("🤛♜♜♜♜♜♜♜♜♜♜♜♜♜♜ 👑👑👑 ♜♜♜♜♜♜♜♜♜♜♜♜♜♜♜🤜")
             isDead = false
            print("=> ⚔️ Choisir un personnage vivant (1/2/ou 3) de l'équipe : \(teamName)")
            parade()
            // if isMageAlone alors le mage devient un guerrier
            repeat { reply = readLine() ?? "1"} while (reply != "1" && reply != "2" && reply != "3")
        
            choosenCharactere = teamMembers[Int(reply)!-1]
            print(" choix de \(choosenCharactere.name) avec \(choosenCharactere.lifePoints) points")
              if choosenCharactere.lifePoints <= 0 {
                print("Dommage, \(choosenCharactere.name) est mort, faut en choisir un autre")
                 isDead = true
              }
          }
         while isDead
       
        return choosenCharactere
    }
    
// presentation of living or dead characters
func parade(){
        print("");
    var c : Int = 0
    var nbAlive: Int = 0
    var status : String = "ALIVE"
    
    for character in teamMembers {
        if character.lifePoints > 0 {
            status = "ALIVE"
            nbAlive += 1
        } else {
            status = "DEAD"
        }
            print("\(c+1)   Nom : \(character.name) Type : \(character.type) Arme : \(character.weapon) Pts de vie : \(character.lifePoints) Nuisance : \(character.damage) - \(status)")
            c += 1
        
    }  // mage is alone
    if nbAlive == 1 {
        for character in teamMembers {
            if character.type == .magus {
                character.type = .fighter
                 print("MAGIE ! le mage est seul dans son équipe, il se transforme en guerrier")
                 parade()
            }
        }
    }
        print("")
    }
    
} //  fin classe
