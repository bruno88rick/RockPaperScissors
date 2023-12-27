//
//  LoadingView.swift
//  RockPaperScissors
//
//  Created by Bruno Oliveira on 27/12/23.
//

import SwiftUI

struct LoadingView: View {
    
    var loadingText: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.black)
                .opacity(0.75)
                .cornerRadius(50, corners: [.topLeft, .topRight, .bottomLeft])
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                ProgressView()
                Text(loadingText)
            }
            .background{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .frame(width: 250, height: 200)
            }
        }
    }
}

#Preview {
    LoadingView(loadingText: "Chosen, waiting for you...")
}
