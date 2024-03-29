//
//  Extensions.swift
//  RockPaperScissors
//
//  Created by Bruno Oliveira on 27/12/23.
//

import SwiftUI
import Foundation

enum Elements: Int {
    case Paper = 0
    case Rock = 1
    case Scissors = 2
}

enum GameError: Error  {
    case GameError
}

enum MatchResult {
    case victory
    case loose
    case tie
    case error
}

extension View {
    
    func isHiddenConditionaly(isHidden: Bool) -> some View {
        isHidden ? AnyView(self.hidden()) : AnyView(self)
    }
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
    
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
        
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
