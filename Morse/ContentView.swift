import SwiftUI

struct ContentView: View {
    @State private var isSplashScreenPresented = true
    
    var body: some View {
        ZStack {
            if isSplashScreenPresented {
                SplashScreen()
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 1.5))
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                isSplashScreenPresented = false
                            }
                        }
                    }
            } else {
                MenuView()
            }
        }
    }
}
