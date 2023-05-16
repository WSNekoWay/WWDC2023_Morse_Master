import SwiftUI

struct MenuView: View {
    
    @State private var isShowingModal = false
    @State private var isShowingLevels = false
    @State private var isShowingConfirmation = false
    @State private var isShowingTutorial = false
    @State private var isShowingTranslate = false

    var body: some View {
        
        VStack {
            Text("Morse Master")
                .font(.system(size: 80, weight: .bold, design: .default))
                .foregroundColor(.black)
                .padding(.top, 250)
                .padding(.bottom, 10)
            
            Text("Morse Every Day!")
                .font(.title)
                .foregroundColor(.black)
                .padding(.bottom, 5)
            
            Text("Created by")
                .font(.headline)
                .foregroundColor(.gray)
                .padding(.bottom, 50)
            
            AnimatedBackground()
            
            
            
            Button(action: {
                self.isShowingLevels = true
            }) {
                Text("Play")
                    .font(.title)
                    .fontWeight(.semibold)
                    .frame(width: 300)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .fullScreenCover(isPresented: $isShowingLevels) {
                LevelView(isShowingLevels: $isShowingLevels)
            }




            
            Button(action: {
                self.isShowingTranslate = true
            }) {
                Text("Translate")
                    .font(.title)
                    .fontWeight(.semibold)
                    .frame(width: 300)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .fullScreenCover(isPresented: $isShowingTranslate) {
                TranslateView()
            }

            
            
            Button(action: {
                self.isShowingConfirmation = true
            }) {
                Text("Quit")
                    .font(.title)
                    .fontWeight(.semibold)
                    .frame(width: 300)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    self.isShowingModal.toggle()
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                            .frame(width: 60, height: 60)
                            .shadow(radius: 5)
                        
                        Image(systemName: "book.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .padding(.trailing, 10)
                            .offset(x: 5.5)
                    }
                }
                .buttonStyle(BorderlessButtonStyle())
                .padding(.bottom, 16)
                .padding(.trailing, 16)
                
                Button(action: {
                    self.isShowingTutorial.toggle()
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                            .frame(width: 60, height: 60)
                            .shadow(radius: 5)
                        
                        Image(systemName: "questionmark.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .padding(.trailing, 10)
                            .offset(x: 5.5)
                    }
                }
                .buttonStyle(BorderlessButtonStyle())
                .padding(.bottom, 16)
                .padding(.trailing, 16)
            }
            



        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .alert(isPresented: $isShowingConfirmation) {
            Alert(title: Text("Quit confirmation"), message: Text("Are you sure you want to quit?"), primaryButton: .destructive(Text("Quit")) {
                exit(0)
            }, secondaryButton: .cancel())
        }
        .sheet(isPresented: $isShowingModal, content: {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        self.isShowingModal.toggle()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(.trailing, 10)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
                
                Spacer()
                
                GeometryReader { geometry in
                    Image("codemorse")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
                    
                }
               
                
                Spacer()
            }
            
        })
        .sheet(isPresented: $isShowingTutorial, content: {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        self.isShowingTutorial.toggle()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(.trailing, 10)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
                
                Spacer()
                
                GeometryReader { geometry in
                    Image("home")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
                    
                }
                
                
                Spacer()
            }
            
        })








    }
}






struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
