import SwiftUI

struct AnimatedBackground: View {
    private let dotColor: Color = Color(hex: "4F81BD")
    private let dashColor: Color = Color(hex: "2E4E7E")
    
    private let dotSize: CGFloat = 6
    private let dashWidth: CGFloat = 8
    private let dashHeight: CGFloat = 4
    
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    @State private var dotPositions: [CGPoint] = []
    @State private var dashPositions: [CGPoint] = []
    @State private var isDotOn = true
    
    private let morseCode: [String] = [".", "-","-", "", ".", "-","", "-", ".","", ".", ".", ".","", ".","", "-","."]
    
    var body: some View {
        ZStack {
            ForEach(dotPositions.indices, id: \.self) { i in
                Circle()
                    .fill(dotColor)
                    .frame(width: dotSize, height: dotSize)
                    .opacity(isDotOn ? 1 : 0)
                    .offset(x: dotPositions[i].x, y: dotPositions[i].y)
            }
            
            ForEach(dashPositions.indices, id: \.self) { i in
                Rectangle()
                    .fill(dashColor)
                    .frame(width: dashWidth, height: dashHeight)
                    .opacity(isDotOn ? 1 : 0)
                    .offset(x: dashPositions[i].x, y: dashPositions[i].y)
            }
            ZStack{
                Text("WanSen")
                    .font(.system(size: 30, weight: .regular))
                    .foregroundColor(.gray)
                    .opacity(isDotOn ? 0 : 1)
                    .offset(y: -55)
            }
        }
        .onAppear {
            for i in 0..<morseCode.count {
                if morseCode[i] == "." {
                    dotPositions.append(CGPoint(x: CGFloat(i * 30 - 200), y: -50))
                } else if morseCode[i] == "-" {
                    dashPositions.append(CGPoint(x: CGFloat(i * 30 - 200), y: -50))
                    
                }
            }
        }
        .onReceive(timer) { _ in
            withAnimation {
                isDotOn.toggle()
                if dashPositions.isEmpty && dotPositions.isEmpty {
                    isDotOn = false
                }
            }
        }
    }
}




