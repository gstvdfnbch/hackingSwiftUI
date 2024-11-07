import SwiftUI

struct ItemNameList: View {
    var name: String
    
    var body: some View {
        HStack {
            Text(self.name)
                .font(.title2)
            Spacer()
        }
        .padding()
        .background()
        .cornerRadius(12)
    }
}

#Preview {
    ItemNameList(name: "Test")
}
