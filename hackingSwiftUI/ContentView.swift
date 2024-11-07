import SwiftUI

struct ContentView: View {
    @State var inputTemperature: String = "0.0"
    
    @State var temperatureCelsius: Double = 0.0 //Celsius
    @State var resultTemperatura: Double = 0.0
    
    var body: some View {
        VStack(spacing: 32) {
            
            HStack(spacing: 16) {
                DisplayValue(value: temperatureCelsius, unit: .celsius, color: .orange)
                DisplayValue(value: resultTemperatura, unit: .farhenheit, color: .green)
            }
                        
            VStack(spacing: 8.0) {
                
                HStack {
                    Text("Insert temperature:")
                    Spacer()
                }
                
                HStack{
                    TextField("Type temperature in Celsius", text: $inputTemperature)
                        .foregroundStyle(.black)
                        .font(.title)
                        .onChange(of: inputTemperature) { newValue in
                            let filtered = newValue.filter { "0123456789.".contains($0) }
                            
                            // Prevent more than one decimal point
                            let decimalCount = filtered.filter { $0 == "." }.count
                            if decimalCount > 1 {
                                inputTemperature = String(filtered.dropLast())
                            } else {
                                inputTemperature = filtered
                            }
                            
                            if let result = Double(inputTemperature) {
                                temperatureCelsius = result
                            } else {
                                temperatureCelsius = 0.0
                            }
                        }
                    
                    Text("°C")
                        .foregroundStyle(.black)
                        .font(.title3)
                }
                .padding(16)
                .background {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.black.opacity(0.1))
                }
            }
            
            Button(action: {
                self.calculete()
            }) {
                HStack {
                    Spacer()
                    
                    Text("Calculate")
                        .disabled(inputTemperature.isEmpty)
                        .foregroundStyle(.white)
                        .padding(16)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .background(.blue)
                .cornerRadius(12)
            }
            .disabled(!self.inputTemperature.isEmpty)
        }
        .multilineTextAlignment(.center)
        .padding(16)
    }
    
    func calculete(){
        if let inputToDouble = Double(inputTemperature) {
            self.resultTemperatura = (inputToDouble * 9 / 5) + 32
        } else {
            self.resultTemperatura = 0.0
        }
    }
}

#Preview {
    ContentView()
}
