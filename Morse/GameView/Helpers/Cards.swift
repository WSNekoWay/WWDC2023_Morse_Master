import SwiftUI


struct MorseCodeView: View {
    let code: String // Morse code string to display
    let color: Color // color of Morse code elements
    let backgroundColor: Color // background color of the card
    
    var body: some View {
        HStack(spacing: 3) {
            ForEach(Array(code), id: \.self) { char in
                if char == "." {
                    Circle()
                        .fill(color)
                        .frame(width: 8, height: 8)
                } else if char == "-" || char == "_" {
                    Rectangle()
                        .fill(color)
                        .frame(width: 20, height: 8)
                        .cornerRadius(10)
                } else if char == " " {
                    Rectangle()
                        .fill(backgroundColor)
                        .frame(width: 7, height: 8)

                }
            }
        }
        .padding(EdgeInsets(top: 45, leading: 40, bottom: 45, trailing: 40))
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(backgroundColor)
        )
        .frame(maxWidth: .infinity, minHeight: 40)
        .padding()
    }
}




struct MorseCodeView_Previews: PreviewProvider {
    static var previews: some View {
        MorseCodeView(code: "--- .--- ", color: .blue, backgroundColor: .yellow)


    }
}
