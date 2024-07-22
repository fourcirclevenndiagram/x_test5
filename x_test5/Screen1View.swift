import SwiftUI

struct Screen1View: View {
    @State private var animate = false

    var body: some View {
        VStack {
            Text("This is Screen 1")
                .font(.largeTitle)
                .padding()
            
            Spacer()
            
            ZStack {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 250, height: 250)
                    .offset(x: animate ? 300 : -300, y: 0)
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                    .onAppear() {
                        self.animate.toggle()
                    }
            }
            .frame(height: 200)
            
            Spacer()

            NavigationLink(destination: ContentView()) {
                Text("Back to Main Screen")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
        .navigationTitle("Screen 1")
    }
}

struct Screen1View_Previews: PreviewProvider {
    static var previews: some View {
        Screen1View()
    }
}
