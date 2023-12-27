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
    @State private var opponentChoose = 0
    @State private var userChoose = 0
    
    var body: some View {
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
                
                ElementsArea(elements: elements, isOpponentElements: false)
                
                Spacer()
                Spacer()
                Spacer()
                
                Text("Your Opponent 👇")
                    .padding(10)
                    .font(.title2.bold())
                    .foregroundStyle(.black)
                
                Spacer()
                
                ElementsArea(elements: elements, isOpponentElements: true, opponentChoose: opponentChoose)
                    //.isHiddenConditionaly(isHidden: elementsAreaHidden)
            
                VStack(spacing: 5) {
                
                    Text("You Win!")
                        .font(.largeTitle.bold())
                        .isHiddenConditionaly(isHidden: true)
                    
                    Text("Your Score is YY of XX")
                        .font(.headline.bold())
                    
                }
                
            }
            .padding(30)
            .frame(alignment: .center)
            
        }
        
    }
    
    func newGame () {
        
        opponentChoose = Int.random(in: 0..<3)
        
    }
    
}

#Preview {
    ContentView()
}
