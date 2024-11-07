import SwiftUI

struct TextFieldCustom: View {
    @Binding var text: String
    
    var body: some View {
        VStack {
            TextField("Digite uma palavra", text: self.$text)
                .font(.title2)
                .padding()
        }
        .background(.white)
        .cornerRadius(12)
    }
}

#Preview {
    TextFieldCustom(text: .constant("teste"))
}
