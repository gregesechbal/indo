import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .foregroundColor(Color.white) // Change text color to white
                .padding()
                .background(Color.blue) // Background color for contrast
            
            Button(action: {
                print("Button tapped!")
            }) {
                Text("Tap me")
                    .foregroundColor(Color.white) // Change button text color to white
                    .padding()
                    .background(Color.green) // Button background color
                    .cornerRadius(8)
            }
            
            // Example with Image
            Image(systemName: "star.fill")
                .foregroundColor(Color.yellow) // Change image color to yellow
                .padding()
                .background(Color.black) // Background color for contrast
                .clipShape(Circle())
        }
        .padding()
        .background(Color.gray) // Background color for the entire VStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
