import SwiftUI

struct Screen3View: View {
    var body: some View {
        VStack {
            Text("This is Screen 3")
                .font(.largeTitle)
                .padding()

            NavigationLink(destination: ContentView()) {
                Text("Back to Main Screen")
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
        .navigationTitle("Screen 3")
    }
}

struct Screen3View_Previews: PreviewProvider {
    static var previews: some View {
        Screen3View()
    }
}
