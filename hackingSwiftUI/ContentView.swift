import SwiftUI

struct ContentView: View {
    @State var inputTemperature: String = ""
    
    @State var temperatureCelsius: Double = 0.0 //Celsius
    @State var resultTemperatura: Double = 0.0
    
    var body: some View {
        VStack(spacing: 32) {
            Spacer()

            Text("Convert Celsius to Farehenheit")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
            
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
                    TextField("Temperature in Celsius", text: $inputTemperature)
                        .foregroundStyle(.black)
                        .font(.title)
                        .keyboardType(.decimalPad)
                        .onChange(of: inputTemperature) { newValue in
                            if let result = Double(newValue) {
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
            .disabled(self.inputTemperature.isEmpty)
        }
        .multilineTextAlignment(.center)
        .padding(16)

        Spacer()

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
