import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            Color.white
            Image("180icon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
        }
    }
}

