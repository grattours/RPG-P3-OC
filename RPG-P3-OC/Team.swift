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
            // le type induit les points; l'arme et
            // alimenter tableac
            // tester nom existe ou pas (???)
       return nil
        // return Character
    }  // fin func

func parade(){
    //        print("===============EQUIPES ET PERSONNAGES ===============")
        print("");
    print("L'EQUIPE : \(teamName) est composée des personnages suivant :")
    var c : Int = 0
    for character in teamMembers {
        // REPRENDRE ICI
        print("  Nom : \(character.name) Type : \(character.type) Arme : \(character.weapon) Pts de vie : \(character.lifePoints) Nuisance : \(character.damage)")
        c += 1
    }
//        print(" Personnage : Nom - Type - Arme - Pts de vie - Force")
//    // print("  Personnage 1 : nom : \(Character.name)  - Type - Arme - Pts de vie - Force")
//        print("      Personnage 2 : Nom - Type - Arme - Pts de vie - Force")
//        print("      Personnage 3 : Nom - Type - Arme - Pts de vie - Force")
//        print("EQUIPE 2:")
//        print("      Personnage 1 : Nom - Type - Arme - Pts de vie - Force")
//        print("      Personnage 2 : Nom - Type - Arme - Pts de vie - Force")
//        print("      Personnage 3 : Nom - Type - Arme - Pts de vie - Force")
        print("")
    }
    
func isNameUnique(_ nameToTest: String) -> Bool {
 // si le nom est déja saisie dans l'Equipe ou dans toutes les équipes ?
    let contains = Team.allCharNames.contains(where: { $0 == "B" })
//    let strings = ["A", "B", "C", "D"]
//    let contains = Team.Scontains(where: { $0 == "B" })
//    let contains = strings.contains(where: { $0 == "B" })
    //contains == true
    return false
}
//    func selectMember(){
//        print("(Team) selectMember")
//        // choix du type
//        // saisie du nom
//    }
    // l'Equipe et le joueur sont assimilables - même nom par exemple.
    // 2 équipes (paramètrer le nombre ?)
    // nb personnages init 3
    // personnages - tableau
    // statut (enjeu / hors jeu)
    // suite
    
} //  fin classe
