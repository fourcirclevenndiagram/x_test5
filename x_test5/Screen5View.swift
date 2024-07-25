import SwiftUI

struct Screen5View: View {
    @State private var inputNumber: String = ""
    @State private var numbers: [(date: String, number: Int)] = []
    @State private var alertMessage: String? = nil
    @State private var selectedDate: Date = Date()
    @State private var showListView: Bool = false
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                DatePicker("날짜 선택", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding([.leading, .trailing], 20)
                
                HStack {
                    Button(action: applyDate) {
                        Text("날짜 적용")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                    Button(action: decrementDate) {
                        Text("전날 날짜로")
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .padding([.leading, .trailing], 20)
                
                TextField("금액을 입력하세요", text: $inputNumber)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding([.leading, .trailing], 20)
                
                Button(action: addNumber) {
                    Text("금액 추가")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Button(action: { showListView = true }) {
                    Text("리스트 보기")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                NavigationLink(destination: ContentView()) {
                    Text("메인 화면으로")
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
            .alert(isPresented: .constant(alertMessage != nil), content: {
                Alert(title: Text("정보"), message: Text(alertMessage ?? ""), dismissButton: .default(Text("확인")) {
                    alertMessage = nil
                })
            })
            .navigationTitle("화면 5")
            .sheet(isPresented: $showListView) {
                NumberListView(numbers: numbers)
            }
        }
    }
    
    func applyDate() {
        // Function to apply the selected date (Currently does nothing extra)
    }
    
    func decrementDate() {
        if let newDate = Calendar.current.date(byAdding: .day, value: -1, to: selectedDate) {
            selectedDate = newDate
        }
    }
    
    func addNumber() {
        if let number = Int(inputNumber) {
            let formattedDate = dateFormatter.string(from: selectedDate)
            if let index = numbers.lastIndex(where: { $0.number == number && $0.date == formattedDate }) {
                alertMessage = "숫자 \(number)은(는) 마지막으로 \(formattedDate)에 \(index + 1)번째로 추가되었습니다."
            }
            numbers.append((date: formattedDate, number: number))
        }
        inputNumber = ""
    }
}

struct NumberListView: View {
    let numbers: [(date: String, number: Int)]
    
    var body: some View {
        NavigationView {
            List(numbers, id: \.number) { entry in
                Text("\(entry.date): \(entry.number)")
            }
            .navigationTitle("숫자 리스트")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("닫기") {
                        // Dismiss the sheet
                        UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }
}

struct Screen5View_Previews: PreviewProvider {
    static var previews: some View {
        Screen5View()
    }
}
