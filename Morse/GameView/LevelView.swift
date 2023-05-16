import SwiftUI

struct LevelView: View {
    @Binding var isShowingLevels: Bool
    @State private var selectedLevel: Int = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                VStack(spacing: 20) {
                    Spacer()
                    Text("Choose Your Level")
                        .font(.system(size: 60, weight: .semibold, design: .default))
                        .foregroundColor(.blue)
                        .fontWeight(.semibold)
                        .padding(.bottom, 20)
                    
                    Button(action: {
                        self.selectedLevel = 1
                    }) {
                        Text("Beginner")
                            .font(.title)
                            .fontWeight(.semibold)
                            .frame(width: 300)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .fullScreenCover(isPresented: Binding(
                        get: { self.selectedLevel == 1 },
                        set: { _ in self.selectedLevel = 1 }
                    )) {
                        PlayView(selectedLevel: self.$selectedLevel)
                    }
                    
                    Button(action: {
                        self.selectedLevel = 2
                    }) {
                        Text("Intermediate")
                            .font(.title)
                            .fontWeight(.semibold)
                            .frame(width: 300)
                            .padding()
                            .background(Color.yellow)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .fullScreenCover(isPresented: Binding(
                        get: { self.selectedLevel == 2 },
                        set: { _ in self.selectedLevel = 2 }
                    )) {
                        PlayView(selectedLevel: self.$selectedLevel)
                    }
                    
                    Button(action: {
                        self.selectedLevel = 3
                    }) {
                        Text("Expert")
                            .font(.title)
                            .fontWeight(.semibold)
                            .frame(width: 300)
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .fullScreenCover(isPresented: Binding(
                        get: { self.selectedLevel == 3 },
                        set: { _ in self.selectedLevel = 3 }
                    )) {
                        PlayView(selectedLevel: self.$selectedLevel)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        self.isShowingLevels.toggle()
                    }) {
                        Text("Back")
                            .font(.title)
                            .fontWeight(.semibold)
                            .frame(width: 300)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Spacer()
                }
                .cornerRadius(10)
                .navigationBarHidden(true)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}


