import SwiftUI

struct Screen4View: View {
    var body: some View {
        VStack {
            Text("This is Screen 4")
                .font(.largeTitle)
                .padding()

            NavigationLink(destination: ContentView()) {
                Text("Back to Main Screen")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
        .navigationTitle("Screen 4")
    }
}

struct Screen4View_Previews: PreviewProvider {
    static var previews: some View {
        Screen4View()
    }
}
