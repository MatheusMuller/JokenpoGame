//
//  ContentView.swift
//  JokenpoGame
//
//  Created by Matheus Müller on 06/02/23.
//

import SwiftUI

struct ContentView: View {
    @State private var move = Bool.random()
    @State private var gamePick = Int.random(in: 0...2)
    @State private var options = ["✊", "✋", "✌️"]
    @State private var scoreTitle = ""
    @State private var finalTitle = ""
    @State private var showScore = false
    @State private var showFinal = false
    @State private var score = 0
    @State private var round = 0
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text("Jokenpo Game")
                    .font(.largeTitle.bold())
                    .padding()
                
                Spacer()
                VStack(spacing: 15) {
                    VStack {
                        Text("The Game Selects: \(options[gamePick])")
                            .font(.title)
                        
                        Text(move == true ? "To: Win" : "To: Loose")
                            .font(.title)
                        
                        HStack {
                            ForEach(0..<3) { opt in
                                Button {
                                    selectOption(opt)
                                } label: {
                                    Text(options[opt])
                                        .font(.largeTitle)
                                        .clipShape(Capsule())
                                        .shadow(radius: 3)
                                }
                                .buttonStyle(.bordered)
                                .tint(.black)
                            }
                        }
                    }
                }
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .font(.title.bold())
                
                Spacer()
            }
        }
        .alert(scoreTitle, isPresented: $showScore) {
            Button("Continue", action: newRound)
        }
        
        .alert(finalTitle, isPresented: $showFinal) {
            Button("New Game", action: newGame)
        } message: {
            Text("Your Final score is: \(score)")
        }
    }
    
    func selectOption(_ opt: Int) {
        if gamePick == 0 && move { // When Rock
            if opt == 1 {
                score += 1
                scoreTitle = "Correct!"
            } else {
                score -= 1
                scoreTitle = "Wrong!"
            }
        } else if gamePick == 0 && !move {
            if opt == 2 {
                score += 1
                scoreTitle = "Correct!"
            } else {
                score -= 1
                scoreTitle = "Wrong!"
            }
        } else if gamePick == 1 && move { // When Paper
            if opt == 2 {
                score += 1
                scoreTitle = "Correct!"
            } else {
                score -= 1
                scoreTitle = "Wrong!"
            }
        } else if gamePick == 1 && !move {
            if opt == 0 {
                score += 1
                scoreTitle = "Correct!"
            } else {
                score -= 1
                scoreTitle = "Wrong!"
            }
        } else if gamePick == 2 && move { // When Scissors
            if opt == 0 {
                score += 1
                scoreTitle = "Correct!"
            } else {
                score -= 1
                scoreTitle = "Wrong!"
            }
        } else {
            if opt == 1 {
                score += 1
                scoreTitle = "Correct!"
            } else {
                score -= 1
                scoreTitle = "Wrong!"
            }
        }
        
        round += 1
        showScore = true
        
        if round == 10 {
            finalTitle = "Game Over"
            showFinal = true
            round = 0
        }
    }
    
    func newRound() {
        gamePick = Int.random(in: 0...2)
        move = Bool.random()
    }
    
    func newGame() {
        score = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
