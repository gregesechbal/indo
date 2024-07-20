struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .frame(width: 100, height: 50)
            .anchorPreference(key: AnchorKey.self, value: .topLeading) { anchor in
                [AnchorData(id: UUID(), anchor: anchor)]
            }
    }
}

struct AnchorData: Identifiable {
    let id: UUID
    let anchor: Anchor<CGPoint>
}
