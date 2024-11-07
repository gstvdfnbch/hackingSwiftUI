import SwiftUI

struct ContentView: View {
    @State var typeWord: String = ""
    @State var list: [String] = ["Fork", "Apple", "Trash", "Fork"]
    @State var isActived: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 0) {
                    ScrollView {
                        VStack(alignment: .leading) {
                            ForEach(self.list, id: \.self) { text in
                                ItemNameList(name: text)
                            }
                        }
                        .padding()
                    }
                    
                    VStack(spacing: 12) {
                        VStack(spacing: 8) {
                            HStack {
                                TextFieldCustom(text: self.$typeWord)
                                
                                ButtonCustom(text: "Add", isActive: true)
                                    .frame(minWidth: 100, maxWidth: 150)
                                    .onTapGesture {
                                        self.addNewWord()
                                    }
                            }
                            
                            ButtonCustom(text: "Adicionar aletório", isActive: true)
                                .onTapGesture {
                                    self.addRandonWord()
                                }
                        }
                        .padding(.horizontal)
                        
                        HStack(spacing: 8) {
                            DisplayComponent(text: String(self.list.count), subtitle: "Número total repetidos", color: .orange)
                            DisplayComponent(text: String(self.list.count - Set(self.list).count), subtitle: "Número total unicos", color: .green)
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .background(.gray.opacity(0.3))
            .toolbarBackground(Color.white, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationTitle("Lista de palavras")
        }
    }
    
    func addNewWord() {
        if !self.typeWord.isEmpty {
            self.list.append(self.typeWord)
            self.typeWord = ""
        }
    }
    
    func addRandonWord() {
        let i = Int.random(in: 0..<words.count)
        self.list.append(words[i])
        self.typeWord = ""
    }
}

#Preview {
    ContentView()
}
