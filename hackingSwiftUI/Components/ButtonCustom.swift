import SwiftUI

struct ButtonCustom: View {
    var text: String
    var isActive: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Text(text)
                    .font(.title2)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
            .padding()
        }
        .background(self.isActive ? .blue : .gray)
        .cornerRadius(12)
        
    }
}

#Preview {
    ButtonCustom(text: "test", isActive: true)
}
