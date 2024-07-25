import SwiftUI

struct Screen5View: View {
    @State private var inputNumber: String = ""
    @State private var numbers: [Int] = []
    @State private var alertMessage: String? = nil
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter a number", text: $inputNumber)
                .keyboardType(.numberPad)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding([.leading, .trailing], 20)
            
            Button(action: addNumber) {
                Text("Add Number")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            List(numbers, id: \.self) { number in
                Text("\(number)")
            }
            
            NavigationLink(destination: ContentView()) {
                Text("Back to Main Screen")
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
        .alert(isPresented: .constant(alertMessage != nil), content: {
            Alert(title: Text("Info"), message: Text(alertMessage ?? ""), dismissButton: .default(Text("OK")) {
                alertMessage = nil
            })
        })
        .navigationTitle("Screen 5")
    }
    
    func addNumber() {
        if let number = Int(inputNumber) {
            if let index = numbers.lastIndex(of: number) {
                alertMessage = "Number \(number) was last added at position \(index + 1)"
            }
            numbers.append(number)
        }
        inputNumber = ""
    }
}

struct Screen5View_Previews: PreviewProvider {
    static var previews: some View {
        Screen5View()
    }
}
