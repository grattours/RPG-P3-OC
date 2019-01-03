//
//  extensions.swift
//  RPG-P3-OC
//
//  Created by Luc Derosne on 03/01/2019.
//  Copyright © 2019 Luc Derosne. All rights reserved.
//

import Foundation

extension Date {
    func toString() -> String {
        let formatter = DateFormatter()
        // formatter.dateStyle = .long
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return(formatter.string(from: self))
    }
}
