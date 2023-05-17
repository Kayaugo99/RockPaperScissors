//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by user239371 on 5/16/23.
//

import SwiftUI

struct ContentView: View {
   
    @State var winOrLose = true
    @State var score = 0
    @State var botChoice = Int.random(in:0...2)

    @State var gameOutcome: String = ""
    @State var invertedGameOutcome: String  = ""
    let moves = ["Rock", "Paper", "Scissors"]
    //array within array for outcomes of rock, paper, scissors
    //TODO: Add more comments
    let gameRule = [[-1,1,0],
                    [1,-1,2],
                    [0,2,-1]]
    
    let losingGameRule = [[-1, 0, 2],
                          [0, -1, 1],
                          [2, 1, -1]]

    var body: some View {
        VStack(spacing: 30) {
            Text("Computer has played...")
            Text(moves[botChoice])
            
            
            if winOrLose == true {
                Text("Which one will win?")
                    .foregroundColor(.green)
                    .bold()
            } else {
                Text("Which one will lose?")
                    .foregroundColor(.red)
                    .bold()
            }

            HStack {
                Button("Rock") {
                    if winOrLose == true {
                        gameOutcome = outcome(humanChoice: 0, droidChoice: botChoice)
                    } else {
                        invertedGameOutcome = invertedOutcome(humanChoice: 0, droidChoice: botChoice)
                    }
                }
                Button("Paper") {
                    if winOrLose == true {
                        gameOutcome = outcome(humanChoice: 1, droidChoice: botChoice)
                    } else {
                        invertedGameOutcome = invertedOutcome(humanChoice: 1, droidChoice: botChoice)
                    }
                }
                Button("Scissors") {
                    if winOrLose == true {
                        gameOutcome = outcome(humanChoice: 2, droidChoice: botChoice)
                    } else {
                        invertedGameOutcome = invertedOutcome(humanChoice: 2, droidChoice: botChoice)
                    }
                }
            }
            Text(gameOutcome)
            Text("Score: \(score)")
        }
    }
    func outcome(humanChoice: Int, droidChoice: Int) -> String {
        
        let result = gameRule[droidChoice][humanChoice]
        if score == 10 {
            score = 0
        }
        
        switch result {
        case -1:
            winOrLose.toggle()
            botChoice = Int.random(in:0...2)
            return "Tie game"
        case 0:
            if droidChoice == 0 {
                botChoice = Int.random(in:0...2)
                winOrLose.toggle()
                if score > 0 { score -= 1 }
                return "Wrong! Rock wins."
            } else {
                score += 1
                botChoice = Int.random(in:0...2)
                winOrLose.toggle()
                return "Correct! Rock wins."
            }
        case 1:
            if droidChoice == 1 {
                botChoice = Int.random(in:0...2)
                if score > 0 { score -= 1 }
                winOrLose.toggle()
                return "Wrong! Paper wins."
            } else {
                score += 1
                botChoice = Int.random(in:0...2)
                winOrLose.toggle()
                return "Correct! Paper wins."
            }
        case 2:
            if droidChoice == 2 {
                botChoice = Int.random(in:0...2)
                if score > 0 { score -= 1 }
                winOrLose.toggle()
                return "Wrong! Scissors wins."
            } else {
                score += 1
                botChoice = Int.random(in:0...2)
                winOrLose.toggle()
                return "Correct! Scissors wins."
            }
        default:
            return "Error 1"
        }
    }
    
    func invertedOutcome(humanChoice: Int, droidChoice: Int) -> String {
        
        let result = losingGameRule[droidChoice][humanChoice]
        if score == 10 {
            score = 0
        }
        switch result {
        case -1:
            winOrLose.toggle()
            botChoice = Int.random(in:0...2)
            return "Tie game"
        case 0:
            if humanChoice == 0 {
                botChoice = Int.random(in:0...2)
                winOrLose.toggle()
                score += 1
                return "Correct! Rock loses."
            } else {
                botChoice = Int.random(in:0...2)
                winOrLose.toggle()
                if score > 0 { score -= 1 }
                return "Wrong! Rock loses."
            }
        case 1:
            if humanChoice == 1 {
                botChoice = Int.random(in:0...2)
                score += 1
                winOrLose.toggle()
                return "Correct! Paper loses."
            } else {
                botChoice = Int.random(in:0...2)
                winOrLose.toggle()
                if score > 0 { score -= 1 }
                return "Wrong! Paper loses."
            }
        case 2:
            if humanChoice == 2 {
                botChoice = Int.random(in:0...2)
                score += 1
                winOrLose.toggle()
                return "Correct! Scissors loses."
            } else {
                botChoice = Int.random(in:0...2)
                winOrLose.toggle()
                if score > 0 { score -= 1 }
                return "Wrong! Scissors loses."
            }
        default:
            return "Error 2"
        }
    }
    
}
	



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
