//
//  team.swift
//  RPG-P3-OC
//
//  Created by Luc Derosne on 20/12/2018.
//  Copyright © 2018 Luc Derosne. All rights reserved.
//

import Foundation

class Team {
 //   var name: String = ""
    var teamName: String = ""
    var teamMembers = [Character]()
    static var allCharNames = [String]()
// tableau de tous les noms pour test unicité ?
//    var charName: String = ""
//    var charactereName: String = ""
//    let nbMaxMembers = 3
//    var i = 1
    
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
        } // fin while
        while i <= nbMaxMembers {
            print(" ajout membre \(i) Equipe \(teamName)")
            i += 1
            teamMembers.append(chooseCharactere()!)
            // séparer choix du nom et choix du type avec :
            // teamMembers.append(chooseCharactereName()!)
            // teamMembers.append(chooseCharactereType()!)
//            teamMembers.append(charactereName)
        }// fin while
        
    } // fin func buildTeam
    
// choix du personnage
    func chooseCharactere() -> Character? {
 //       let inputName: String = ""
        var charName = ""
        while charName == "" || charName.first == " " || !Team.allCharNames.contains(charName) {
            print("choisir un nom de personnage")
//            print(Team.allCharNames)
            if let inputNameC = readLine(){
                charName = inputNameC
                if !(Team.allCharNames.contains(charName))  {
                    Team.allCharNames.append(charName)
                } else {
                    print("nom déja existant, essaie encore ")
                    charName = ""
                }
            } // fin if
         } // fin While
            print("personnage : \(charName)")
            print ("choisir: 1 fighter 2 magus 3 Colossus 4 Dwarf")
            repeat { reply = readLine() ?? "1"} while reply != "1" && reply != "2" && reply != "3" && reply != "4"
        // let character = Character(type: <#charType#>)
        // character.name = charName
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
        
    }  // fin func
//
//    func removeCharacterFromTheTeam(_ :Character) {
////        let idx1 = teamMembers.firstIndex(where: { $0 === Character.self })
////        print("idx \(idx1 ?? 0)")
////        print("mort ou pas ?")
//        if let idx = teamMembers.firstIndex(where: { $0 === Character.self }) {
//            teamMembers.remove(at: idx)
//        }
//        // print("idx \(idx)")
//        //let idx = 2
//        // teamMembers.remove(at: idx)
//
//        // teamMembers.remove(at: idx)
////        if let idx = objectArray.index(where: { $0 === objectToRemove }) {
////            objectArray.remove(at: idx)
////        }
//
//    }
    
    func chooseCharacterFromTheTeam(_ :Team) -> Character{
        var choosenCharactere: Character
         var isDead: Bool = false
        print()
         repeat {
            //print("🤛♜♜♜♜♜♜♜♜♜♜♜♜♜♜ 👑👑👑 ♜♜♜♜♜♜♜♜♜♜♜♜♜♜♜🤜")
             isDead = false
            print("=> ⚔️ Choisir un personnage vivant (1/2/ou 3) de l'équipe : \(teamName)")
            parade()
            repeat { reply = readLine() ?? "1"} while (reply != "1" && reply != "2" && reply != "3")
        
            choosenCharactere = teamMembers[Int(reply)!-1]
            print(" choix de \(choosenCharactere.name) avec \(choosenCharactere.lifePoints) points")
            // let pts: Int = teamMembers[Int(reply)!].lifePoints
             //if pts  <= 0 {
              if choosenCharactere.lifePoints <= 0 {
                print("Dommage, \(choosenCharactere.name) est mort, faut en choisir un autre")
                 isDead = true
              }
          }
         while isDead
       
        return choosenCharactere
    }
    
    
func parade(){
        print("");
    var c : Int = 0
    for character in teamMembers {
        // if character.lifePoints > 0 {
            print("\(c+1)   Nom : \(character.name) Type : \(character.type) Arme : \(character.weapon) Pts de vie : \(character.lifePoints) Nuisance : \(character.damage)")
            c += 1
       // }

    }
        print("")
    }
    
} //  fin classe
