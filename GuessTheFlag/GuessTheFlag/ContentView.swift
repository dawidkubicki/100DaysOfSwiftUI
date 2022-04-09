//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Dawid Kubicki on 05/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var finalScore = 0
    @State private var questionNumber = 0
    
    private var endGameTitle = "This is the end of a game"
    @State private var showingEndGame = false

    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                if questionNumber != 8 {
                
                    VStack(spacing: 15) {
                        VStack {
                            Text("Tap the flag of")
                                .foregroundStyle(.secondary)
                                .font(.subheadline.weight(.heavy))
                            Text(countries[correctAnswer])
                                .font(.largeTitle.weight(.semibold))
                        }
                        
                        ForEach(0..<3) { number in
                            Button {
                                flagTapped(number)
                            } label: {
                                Image(countries[number])
                                    .renderingMode(.original)
                                    .clipShape(Capsule())
                                    .shadow(radius: 5)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    Spacer()
                    Spacer()
                }
                
                Text("Score: \(finalScore)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Text("Question: \(questionNumber+1)/8")
                    .foregroundColor(.white)
                    .font(.subheadline)
                
                Spacer()
            }
            .padding()
            
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(finalScore)")
        }
        .alert(endGameTitle, isPresented: $showingEndGame) {
            Button("Restart the game", action: restartGame)
        } message: {
            Text("You have ended game with score: \(finalScore)")
        }
    }
    
    func flagTapped(_ number: Int) {
        
        questionNumber += 1
        
        if number == correctAnswer {
            scoreTitle = "Correct"
            finalScore += 1
        } else {
            scoreTitle = "Wrong! Thats the flag of \(countries[number])"
        }
        
        showingScore = true
        
        if questionNumber >= 8 {
            showingEndGame = true
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func restartGame() {
        finalScore = 0
        questionNumber = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        ContentView().preferredColorScheme(.dark)
    }
}
