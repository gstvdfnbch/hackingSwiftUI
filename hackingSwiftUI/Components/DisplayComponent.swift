//
//  DisplayComponent.swift
//  hackingSwiftUI
//
//  Created by Gustavo Diefenbach on 07/11/24.
//

import SwiftUI

struct DisplayComponent: View {
    var text: String
    var subtitle: String
    var color: Color
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack {
                Text(self.text)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(self.subtitle)
                    .font(.title3)
            }
            .padding()
            .foregroundStyle(.white)
            .multilineTextAlignment(.center)
            
            Spacer()
        }
        .background(self.color)
        .cornerRadius(12)
    }
}

#Preview {
    HStack(spacing: 8) {
        DisplayComponent(text: "21", subtitle: "Número total", color: .orange)
        DisplayComponent(text: "2131", subtitle: "Número total", color: .green)
    }
    
}
