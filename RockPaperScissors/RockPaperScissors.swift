//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by user239371 on 5/16/23.
//

import Foundation

//TODO: changed struct to class. Check if this is ok
class RockPaperScissors {
    let moves = ["Rock", "Paper", "Scissors"]
    var botsTurn = true
    var score = 0
    //array within array for outcomes of rock, paper, scissors
    //TODO: Add more comments
    let gameRule = [[-1,1,0],
                    [1,-2,2],
                    [0,2,-1]]
    func switchTurn() {
        self.botsTurn = !botsTurn
    }
}
