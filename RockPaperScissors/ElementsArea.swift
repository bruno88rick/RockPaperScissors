//
//  ElementsArea.swift
//  RockPaperScissors
//
//  Created by Bruno Oliveira on 14/12/23.
//

import SwiftUI

struct ElementsArea: View {
    
    var elements = [String]()
    var isOpponentElements: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 20){
            Spacer()
            Text(isOpponentElements ? "Opponent Element:" : "Choose your Element:" )
                .font(.title3.bold())
                .fontDesign(.rounded)
                .foregroundStyle(isOpponentElements ? .white : .primary)
            HStack(spacing: 30) {
                ForEach (0..<3) { element in
                    Button {
                        
                    } label: {
                        ElementImage(image: elements[element])
                            .shadow(color: .black, radius: 10, x: 0.1, y: 1.0)
                    }
                }
            }
            .padding(5)
        }
        .frame(maxWidth: 380, maxHeight: 250)
        .padding(.vertical, 5)
        .background(isOpponentElements ? LinearGradient(colors: [Color(red: 0.1, green: 0.2, blue: 0.45), Color(red: 0.1, green: 0.2, blue: 0.45)], startPoint: .topLeading, endPoint: .bottomTrailing) : LinearGradient(colors: [.white, .white], startPoint: .topLeading, endPoint: .bottomTrailing))
        .clipShape(.rect(cornerRadius: 50))
        .shadow(radius: 20)
    }
}

#Preview {
    ElementsArea(elements: ["Rock", "Paper", "Scissors"], isOpponentElements: true)
}
