import SwiftUI

struct ContentView: View {
    @State var inputTemperature: String = ""
    
    let temperature: Double = 37.0 //Celsius
    var resultTemperatura: Double = 0.0
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text("Insert temperature:")
            
            TextField("Type temperature in Celsius", text: $inputTemperature)
                .padding(16)
                .foregroundStyle(.white)
                .font(.title2)
                .background {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.black.opacity(0.1))
                }
            
            Button(action: {
                self.calculate()
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

            }
            
        }
        .multilineTextAlignment(.center)
        .padding()
    }
    
    func calculete() ->Double {
        if let inputToDouble = Double(inputTemperature) {
            var convertToFahrenheit: Double = (inputToDouble * 9 / 5) + 32
        } else {
            inputTemperature = 0.0
            
        }
    }
}

#Preview {
    ContentView()
}
