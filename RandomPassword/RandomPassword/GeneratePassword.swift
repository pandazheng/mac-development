//
//  GeneratePassword.swift
//  RandomPassword
//
//  Created by pandazheng on 1/28/16.
//  Copyright © 2016 pandazheng. All rights reserved.
//

import Foundation


private let characters = Array(("0123456789abcdefghijklmnopqrstuvwxyz" +
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ").characters)



func generateRandomString(length: Int) -> String {
    var string = ""
    
    for _ in 0..<length {
        string.append(generateRandomCharacter())
    }
    
    return string
}

func generateRandomCharacter() -> Character {
    let index = Int(arc4random_uniform(UInt32(characters.count)))
    
    let character = characters[index]
    return character
}