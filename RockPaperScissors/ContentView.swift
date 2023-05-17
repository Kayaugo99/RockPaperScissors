//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by user239371 on 5/16/23.
//

import SwiftUI



struct ContentView: View {
   
    @State var botsTurn = true
    @State var score = 0
    @State var botChoice = Int.random(in:0...2)
    @State var usersChoice = -1
    @State var gameOutcome: String = "Not started"
    let moves = ["Rock", "Paper", "Scissors"]
    //array within array for outcomes of rock, paper, scissors
    //TODO: Add more comments
    let gameRule = [[-1,1,0],
                    [1,-2,2],
                    [0,2,-1]]

    var body: some View {
        VStack(spacing: 30) {
            Text("Computer has played...")
            Text(moves[botChoice])

            HStack {
                Button("Rock") {
                    gameOutcome = outcome(humanChoice: 0, droidChoice: botChoice)
                }
                Button("Paper") {
                    gameOutcome = outcome(humanChoice: 1, droidChoice: botChoice)
                }
                Button("Scissors") {
                    gameOutcome = outcome(humanChoice: 2, droidChoice: botChoice)
                }
            }
            Text(gameOutcome)
            Text("Score: \(score)")
        }
    }
    func outcome(humanChoice: Int, droidChoice: Int) -> String {

        let result = gameRule[droidChoice][humanChoice]
        
        if result == -1 {
            return "Tie"
        }
        if result == 0 {
            return "Rock"
        }
        if result == 1 {
            return "Paper"
        }
        if result == 2 {
            return "Scissors"
        }
        return "Wrong option"
    }
}
	



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
