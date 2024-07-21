import SwiftUI

struct Screen2View: View {
    var body: some View {
        VStack {
            Text("This is Screen 2")
                .font(.largeTitle)
                .padding()

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
}

struct Screen2View_Previews: PreviewProvider {
    static var previews: some View {
        Screen2View()
    }
}
