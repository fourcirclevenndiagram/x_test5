import SwiftUI

struct Screen2View: View {
    @State private var display = "0"
    @State private var currentNumber: Double = 0
    @State private var previousNumber: Double = 0
    @State private var operation: String? = nil
    
    var body: some View {
        VStack(spacing: 12) {
            Text(display)
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding([.leading, .trailing], 20)
            
            HStack(spacing: 12) {
                CalculatorButton(label: "7") { self.numberButtonTapped("7") }
                CalculatorButton(label: "8") { self.numberButtonTapped("8") }
                CalculatorButton(label: "9") { self.numberButtonTapped("9") }
                CalculatorButton(label: "/") { self.operationButtonTapped("/") }
            }
            HStack(spacing: 12) {
                CalculatorButton(label: "4") { self.numberButtonTapped("4") }
                CalculatorButton(label: "5") { self.numberButtonTapped("5") }
                CalculatorButton(label: "6") { self.numberButtonTapped("6") }
                CalculatorButton(label: "*") { self.operationButtonTapped("*") }
            }
            HStack(spacing: 12) {
                CalculatorButton(label: "1") { self.numberButtonTapped("1") }
                CalculatorButton(label: "2") { self.numberButtonTapped("2") }
                CalculatorButton(label: "3") { self.numberButtonTapped("3") }
                CalculatorButton(label: "-") { self.operationButtonTapped("-") }
            }
            HStack(spacing: 12) {
                CalculatorButton(label: "0") { self.numberButtonTapped("0") }
                CalculatorButton(label: "C") { self.clearButtonTapped() }
                CalculatorButton(label: "=") { self.equalsButtonTapped() }
                CalculatorButton(label: "+") { self.operationButtonTapped("+") }
            }
            
            NavigationLink(destination: ContentView()) {
                Text("Back to Main Screen")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
        .navigationTitle("Screen 2")
    }
    
    func numberButtonTapped(_ number: String) {
        if display == "0" {
            display = number
        } else {
            display += number
        }
        currentNumber = Double(display) ?? 0
    }
    
    func operationButtonTapped(_ operation: String) {
        self.operation = operation
        previousNumber = currentNumber
        display = "0"
    }
    
    func equalsButtonTapped() {
        if let operation = self.operation {
            switch operation {
            case "+":
                currentNumber = previousNumber + currentNumber
            case "-":
                currentNumber = previousNumber - currentNumber
            case "*":
                currentNumber = previousNumber * currentNumber
            case "/":
                currentNumber = previousNumber / currentNumber
            default:
                break
            }
            display = "\(currentNumber)"
            self.operation = nil
        }
    }
    
    func clearButtonTapped() {
        display = "0"
        currentNumber = 0
        previousNumber = 0
        operation = nil
    }
}

struct CalculatorButton: View {
    let label: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.largeTitle)
                .frame(width: 80, height: 80)
                .background(Color.blue.opacity(0.2))
                .cornerRadius(40)
        }
    }
}

struct Screen2View_Previews: PreviewProvider {
    static var previews: some View {
        Screen2View()
    }
}
