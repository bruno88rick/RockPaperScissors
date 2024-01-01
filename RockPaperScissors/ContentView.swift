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
    @State private var score = 0
    @State private var gameMatch = 0
    
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
                                        
                                } label: {
                                    ElementImage(image: elements[element])
                                        .shadow(color: .black, radius: 10, x: 0.1, y: 1.0)
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
                }
            
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
        
    }
}

#Preview {
    ContentView()
}
