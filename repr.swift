import SwiftUI

@MainActor @frozen @preconcurrency public struct UnevenRoundedRectangle : Shape {
    var topLeftRadius: CGFloat
    var topRightRadius: CGFloat
    var bottomLeftRadius: CGFloat
    var bottomRightRadius: CGFloat

    public init(topLeftRadius: CGFloat = 0, 
                topRightRadius: CGFloat = 0, 
                bottomLeftRadius: CGFloat = 0, 
                bottomRightRadius: CGFloat = 0) {
        self.topLeftRadius = topLeftRadius
        self.topRightRadius = topRightRadius
        self.bottomLeftRadius = bottomLeftRadius
        self.bottomRightRadius = bottomRightRadius
    }

    public func path(in rect: CGRect) -> Path {
        var path = Path()

        // Starting point
        path.move(to: CGPoint(x: rect.minX + topLeftRadius, y: rect.minY))

        // Top edge and top-right corner
        path.addLine(to: CGPoint(x: rect.maxX - topRightRadius, y: rect.minY))
        path.addArc(center: CGPoint(x: rect.maxX - topRightRadius, y: rect.minY + topRightRadius),
                    radius: topRightRadius,
                    startAngle: Angle(degrees: -90),
                    endAngle: Angle(degrees: 0),
                    clockwise: false)

        // Right edge and bottom-right corner
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - bottomRightRadius))
        path.addArc(center: CGPoint(x: rect.maxX - bottomRightRadius, y: rect.maxY - bottomRightRadius),
                    radius: bottomRightRadius,
                    startAngle: Angle(degrees: 0),
                    endAngle: Angle(degrees: 90),
                    clockwise: false)

        // Bottom edge and bottom-left corner
        path.addLine(to: CGPoint(x: rect.minX + bottomLeftRadius, y: rect.maxY))
        path.addArc(center: CGPoint(x: rect.minX + bottomLeftRadius, y: rect.maxY - bottomLeftRadius),
                    radius: bottomLeftRadius,
                    startAngle: Angle(degrees: 90),
                    endAngle: Angle(degrees: 180),
                    clockwise: false)

        // Left edge and top-left corner
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + topLeftRadius))
        path.addArc(center: CGPoint(x: rect.minX + topLeftRadius, y: rect.minY + topLeftRadius),
                    radius: topLeftRadius,
                    startAngle: Angle(degrees: 180),
                    endAngle: Angle(degrees: 270),
                    clockwise: false)

        return path
    }
}

// Example usage in a SwiftUI View
struct ContentView: View {
    var body: some View {
        UnevenRoundedRectangle(topLeftRadius: 20, topRightRadius: 30, bottomLeftRadius: 40, bottomRightRadius: 50)
            .fill(Color.blue)
            .frame(width: 200, height: 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
