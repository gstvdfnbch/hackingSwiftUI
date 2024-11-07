import SwiftUI

struct ContentView: View {
    @State var inputTemperature: String = ""
    @State var temperatureCelsius: Double = 0.0
    @State var resultTemperatura: Double = 0.0
    @FocusState private var isInputFocused: Bool // Track focus state of TextField

    var body: some View {
        ScrollViewReader { proxy in
            ZStack {
                ScrollView {
                    VStack(spacing: 32) {
                        Spacer()
                        
                        Text("Convert Celsius to Fahrenheit")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .lineLimit(2)
                        
                        VStack(spacing: 16) {
                            DisplayValue(value: temperatureCelsius,
                                         unit: .celsius,
                                         color: .orange)
                            
                            DisplayValue(value: resultTemperatura,
                                         unit: .farhenheit,
                                         color: .green)
                        }
                        
                        VStack(spacing: 8.0) {
                            HStack {
                                Text("Insert temperature:")
                                Spacer()
                            }
                            
                            HStack {
                                TextField("Temperature in Celsius", text: $inputTemperature)
                                    .foregroundStyle(.gray)
                                    .font(.title)
                                    .keyboardType(.decimalPad)
                                    .focused($isInputFocused) // Bind TextField focus to isInputFocused
                                    .id("temperatureField") // Assign an ID to the TextField
                                    .onChange(of: inputTemperature) { newValue in
                                        let sanitizedInput = newValue.replacingOccurrences(of: ",", with: ".")
                                        let filtered = sanitizedInput.filter { "0123456789.".contains($0) }
                                        
                                        let decimalCount = filtered.filter { $0 == "." }.count
                                        if decimalCount <= 1 && filtered.count <= 5 {
                                            inputTemperature = filtered
                                            if let result = Double(filtered) {
                                                temperatureCelsius = result
                                            } else {
                                                temperatureCelsius = 0.0
                                            }
                                        } else {
                                            inputTemperature = String(filtered.prefix(5))
                                        }
                                    }
                                    .onTapGesture {
                                        // When the TextField is tapped, scroll to it
                                        withAnimation {
                                            proxy.scrollTo("temperatureField", anchor: .center)
                                        }
                                    }
                                
                                Text("°C")
                                    .foregroundStyle(self.inputTemperature.isEmpty ? .black.opacity(0.2) : .gray)
                                    .font(.title3)
                            }
                            .padding(16)
                            .background {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.black.opacity(0.1))
                            }
                        }
                        Spacer()
                    }
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 32)
                }
                .scrollIndicators(.hidden)
                .onTapGesture {
                    isInputFocused = false // Dismiss keyboard when tapping outside TextField
                }
                
                VStack {
                    Spacer()
                    
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
                        .background(self.inputTemperature.isEmpty ? .gray : .blue)
                        .cornerRadius(12)
                    }
                }
            }
            .padding(16)
        }
    }
    
    func calculate() {
        if let inputToDouble = Double(inputTemperature) {
            self.resultTemperatura = (inputToDouble * 9 / 5) + 32
        } else {
            self.resultTemperatura = 0.0
        }
    }
}
