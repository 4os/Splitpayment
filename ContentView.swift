//4os

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercantage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerson: Double {
        let peopleCount  = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercantage])
        let orderAmount  = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView{
        Form {
            
            Section {
                TextField("Amount", text: $checkAmount)
                    .keyboardType(.decimalPad)
                
                Picker("Number of people" , selection: $numberOfPeople) {
                    ForEach(2 ..< 100){
                        Text("\($0) people")
                    }
                }
            }
            Section {
                Picker("Tip Percantage", selection: $tipPercantage) {
                    ForEach(0 ..< tipPercentages.count) {
                        Text("\(self.tipPercentages[$0])%")
                    }
                }.pickerStyle(.segmented)
            } header: {
                Text("How much tip do you want to leave??")
                
            }
            
            Section {
                Text("$\(totalPerson, specifier: "%.2f")")
            }
            
            Section{
                Text("This is my first SwiftUI App. GitHub/4os")
            }
            
            .navigationTitle("Hesabını Paylaş ")
            .navigationBarTitleDisplayMode(.inline)
}
    }
        }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        }
}
}


