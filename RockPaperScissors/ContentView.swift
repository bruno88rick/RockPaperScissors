//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Bruno Oliveira on 13/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var elements = ["Rock", "Paper", "Scissors"]
    @State private var elementsAreaHidden = false
    @State private var buttonStartGameHidden = false
    @State private var rectangleBlurHidden = false
    @State private var matchTextResultHidden = true
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var alertButton = ""
    @State private var opponentChoose = 0
    @State private var userChoose = 0
    @State private var userScore = 0
    @State private var machineScore = 0
    @State private var gameMatch = 0
    @State private var totalMatch = 8
    @State private var userWin = MatchResult.tie
    
    var game = GameBackEnd()
    
    var body: some View {
        ZStack {
            
            ZStack{
                /*RadialGradient(stops: [
                 .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.25),
                 .init(color: .white, location: 0.3)
                 ], center: .top, startRadius: 345, endRadius: 700)*/
                
                LinearGradient(stops: [
                    .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.48),
                    .init(color: .white, location: 0.51)
                ], startPoint: .top , endPoint: .bottom )
                .ignoresSafeArea()
                
                VStack {
                    
                    ElementImage(image: "title")
                        .imageScale(.medium)
                    
                    Text("You 👇")
                        .padding(10)
                        .font(.title.bold())
                        .foregroundStyle(.white)
                    
                    //User Elements
                    //ElementsArea(elements: elements, isOpponentElements: false)
                    
                    ZStack{
                        
                        VStack(alignment: .center, spacing: 20){
                            Spacer()
                            Text("Choose your Element:")
                                .font(.title3.bold())
                                .fontDesign(.rounded)
                                .foregroundStyle(.primary)
                            HStack(spacing: 30) {
                                ForEach (0..<3) { element in
                                    Button {
                                        newMatch()
                                        if gameMatch == 8 {
                                            matchTextResultHidden = false
                                            alertTitle = "End Game!"
                                            alertMessage = "Total Score was: \(userScore) and Machine Score was \(machineScore)"
                                            alertButton = "End Game"
                                            showingAlert = true
                                            buttonStartGameHidden = false
                                            rectangleBlurHidden = false
                                            
                                        } else {
                                            elementsAreaHidden = true
                                            userWin = game.elementTapped(userChoose: element, opponentChoose: opponentChoose)
                                            if userWin == MatchResult.victory {
                                                calculateScore(userWin: true)
                                            } else if userWin == MatchResult.loose {
                                                calculateScore(userWin: false)
                                            }
                                            matchTextResultHidden = false
                                            alertTitle = "Match \(gameMatch) of \(totalMatch)"
                                            alertMessage = "Go around!"
                                            alertButton = "Next Mach"
                                            showingAlert = true
                                        }
                                    } label: {
                                        ElementImage(image: elements[element])
                                            .shadow(color: .black, radius: 10, x: 0.1, y: 1.0)
                                    }.alert(alertTitle, isPresented: $showingAlert){
                                        Button(alertButton, action: nextMatchUI)
                                    } message: {
                                        Text(alertMessage)
                                    }
                                }
                            }
                        }
                        .padding(5)
                        .frame(maxWidth: 380, maxHeight: 250)
                        .padding(.vertical, 5)
                        .background(LinearGradient(colors: [.white, .white], startPoint: .topLeading, endPoint: .bottomTrailing))
                        //.clipShape(.rect(cornerRadius: 50))
                        .cornerRadius(50, corners: [.topLeft, .topRight, .bottomRight] )
                        .shadow(radius: 20)
                    }
                    
                    //End of User Elements
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    Text("Your Opponent 👇")
                        .padding(10)
                        .font(.title2.bold())
                        .foregroundStyle(.black)
                    
                    Spacer()
                    
                    //oppoent elements
                    
                    ZStack{
                        
                        VStack(alignment: .center, spacing: 20){
                            Spacer()
                            Text("Opponent Element:")
                                .font(.title3.bold())
                                .fontDesign(.rounded)
                                .foregroundStyle(.white)
                            HStack(spacing: 30) {
                                
                                ElementImage(image: elements[opponentChoose])
                                
                            }
                        }
                        .padding(5)
                        .frame(maxWidth: 380, maxHeight: 250)
                        .padding(.vertical, 5)
                        .background(LinearGradient(colors: [Color(red: 0.1, green: 0.2, blue: 0.45), Color(red: 0.1, green: 0.2, blue: 0.45)], startPoint: .topLeading, endPoint: .bottomTrailing))
                        //.clipShape(.rect(cornerRadius: 50))
                        .cornerRadius(50, corners: [.topLeft, .topRight, .bottomLeft])
                        .shadow(radius: 20)
                        LoadingView(loadingText: "Chosen, waiting for you...")
                            .isHiddenConditionaly(isHidden: elementsAreaHidden)
                    }
                    
                    VStack(spacing: 5) {
                        
                        switch userWin {
                        case MatchResult.tie:
                            Text("It's a Tie! Try Again!")
                                .font(.headline.bold())
                                .foregroundStyle(.green)
                                .isHiddenConditionaly(isHidden: matchTextResultHidden)
                        case MatchResult.loose:
                            Text("You Loose this Match! Try Again!")
                                .font(.headline.bold())
                                .foregroundStyle(.red)
                                .isHiddenConditionaly(isHidden: matchTextResultHidden)
                        case MatchResult.victory:
                            Text("You Win this Match! Congrats!")
                                .font(.headline.bold())
                                .foregroundStyle(.blue)
                                .isHiddenConditionaly(isHidden: matchTextResultHidden)
                        case MatchResult.error:
                            Text("There was an Error! Restart the game")
                        }
                    
                        Text("Score: You: \(userScore) Machine: \(machineScore)")
                            .font(.headline.bold())
                        
                    }
                }
                .padding(30)
                .frame(alignment: .center)
            }
        
            Rectangle()
                .ignoresSafeArea()
                .background(.regularMaterial)
                .blur(radius: 0, opaque: true)
                .isHiddenConditionaly(isHidden: rectangleBlurHidden)
                
            
            Button {
                newGameUI()
            } label: {
                Text("Touch to Start a New Game")
                    .foregroundStyle(.white)
            }
            .isHiddenConditionaly(isHidden: buttonStartGameHidden)
        }
    }
    
    func newGameUI () {
        
        buttonStartGameHidden = true
        rectangleBlurHidden = true
        opponentChoose = Int.random(in: 0..<3)
        gameMatch = 0
        userScore = 0
        machineScore = 0
        
    }
    
    func restartGameUI() {
        buttonStartGameHidden = false
        rectangleBlurHidden = false
    }
    

    func nextMatchUI () {
        elementsAreaHidden = false
        opponentChoose = Int.random(in: 0..<3)
        matchTextResultHidden = true
    }
    
    func calculateScore(userWin: Bool) {
        if userWin { 
            userScore += 1
        } else {
            machineScore += 1
        }
    }
    
    func newMatch() {
        gameMatch += 1
        
    }
    
}

#Preview {
    ContentView()
}
