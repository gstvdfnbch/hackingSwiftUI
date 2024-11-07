import SwiftUI

struct DisplayValue: View {
    var text: String
    var color: Color
    var unit: UnitsTemperature
    
    init(value: Double, unit: UnitsTemperature, color: Color = .black) {
        self.text = String(value)
        self.color = color
        self.unit = unit
    }
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack(spacing: 4) {
                HStack {
                    Text(text)
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text(unit == .celsius ? "°C" : "°F")
                        .foregroundStyle(.white)
                        .font(.title)
                        .fontWeight(.bold)
                }
                
                Text(self.unit.rawValue)
                    .foregroundStyle(.white)
                    .font(.title3)
            }
            
            Spacer()
        }
        .frame(height: 150)
        .background(color)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

#Preview {
    DisplayValue(value: 20, unit: .farhenheit, color: .yellow)
        .padding(16)
}
