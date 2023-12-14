//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Bruno Oliveira on 13/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var elements = ["Rock", "Paper", "Scissors"]
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.white, .green], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                ElementImage(image: "title")
                    .imageScale(.medium)
                    .foregroundStyle(.tint)
                Text("You")
                    .padding(10)
                    .font(.title.bold())
                    .foregroundStyle(.primary)
                VStack(alignment: .center, spacing: 10){
                    Text("Choose Your Element")
                        .font(.title2.bold())
                        .fontDesign(.rounded)
                        .foregroundStyle(.secondary)
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
                Spacer()
                Spacer()
                
                
            }
            .padding(30)
            .frame(alignment: .top)
        }
        
    }
}

#Preview {
    ContentView()
}
