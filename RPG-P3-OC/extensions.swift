//
//  extensions.swift
//  RPG-P3-OC
//
//  Created by Luc Derosne on 03/01/2019.
//  Copyright © 2019 Luc Derosne. All rights reserved.
//

import Foundation
// to facilitate the conversion of dates
extension Date {
    // return date in french text
    func toString() -> String {
        let formatter = DateFormatter()
        //formatter.dateStyle = .long
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return(formatter.string(from: self))
    }
    // returns hh mm ss from a date
    func toHHMSS() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        return(formatter.string(from: self))
    }
}
