struct CircleMoving: AnimatableModifier {
    var hoursOffset: CGFloat
    var hour: CGFloat
    var size: CGFloat
    
    public var animatableData: CGFloat {
        get { hoursOffset }
        set { self.hoursOffset = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .position(CGPoint.onCircle(hours: hour + hoursOffset, size: size))
    }
}

struct CircleView: View {
    var hoursOffset: CGFloat
    
    var body: some View {
        GeometryReader() { geo in
            ForEach(0..<12) { hour in
                ZStack {
                    Text("\(hour)")
                        .modifier(CircleMoving(hoursOffset: self.hoursOffset, hour: CGFloat(hour), size: geo.size.width))
                }
            }
        }
    }
}
