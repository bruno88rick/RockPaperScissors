//
//  ElementImage.swift
//  RockPaperScissors
//
//  Created by Bruno Oliveira on 14/12/23.
//

import SwiftUI

struct ElementImage: View {
    var image: String
    
    var body: some View {
        Image(image)
    }
}

#Preview {
    ElementImage(image: "Rock")
}
