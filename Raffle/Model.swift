//
//  Model.swift
//  Raffle
//
//  Created by Drayton Lavender on 8/10/22.
//

import Foundation

struct Model {
    var raffleParticipants: [String]
    var chosenParticipantIdx: Int?
    
    init () {
        raffleParticipants = []
        chosenParticipantIdx = nil
    }
    
    mutating func choseParticipant() -> Int {
        chosenParticipantIdx = Int.random(in: 0..<raffleParticipants.count)
        return chosenParticipantIdx!
    }
    
    mutating func resetChosnParticipant() { chosenParticipantIdx = nil }
}
