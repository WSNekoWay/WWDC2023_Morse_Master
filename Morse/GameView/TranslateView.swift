

import SwiftUI

struct TranslateView: View {
    @State private var inputText = ""
    @State private var outputText = ""
    @State private var lastInputText = ""
    @State private var lastOutputText = ""
    @State private var isMorseToText = false
    @State private var isShowingHome = false
    @State private var isShowingTutorial = false
    @State private var isShowingConfirmation = false
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                
                Spacer()
                Button(action: {
                    isShowingTutorial = true
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(hex: "90EE90)"))
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
                .padding(.top, 16)
                .padding(.trailing, 16)
                Button(action: {
                    self.isShowingHome = true
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                            .frame(width: 60, height: 60)
                            .shadow(radius: 5)
                        Image(systemName: "house.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .padding(.trailing, 10)
                            .offset(x: 5.5)
                        
                    }
                }
                .buttonStyle(BorderlessButtonStyle())
                .padding(.top, 16)
                .padding(.trailing, 16)
                .fullScreenCover(isPresented: $isShowingHome) {
                    MenuView()
                }
                Button(action: {
                    self.isShowingConfirmation = true
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red)
                            .frame(width: 60, height: 60)
                            .shadow(radius: 5)
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .padding(.trailing, 10)
                            .offset(x: 5.5)
                        
                    }
                }
                .alert(isPresented: $isShowingConfirmation) {
                    Alert(title: Text("Quit confirmation"), message: Text("Are you sure you want to quit?"), primaryButton: .destructive(Text("Quit")) {
                        exit(0)
                    }, secondaryButton: .cancel())
                }
                .buttonStyle(BorderlessButtonStyle())
                .padding(.top, 16)
                .padding(.trailing, 16)
            }
            Text(isMorseToText ? "Morse Code Input" : "Text Input")
                .font(.title)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .padding()
            CustomTextEditor(text: $inputText)
                .padding()
                .padding(.bottom, 10)



            HStack {
                
                Button(action: {

                    isMorseToText.toggle()
                    switchtranslate()
                    
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                        .frame(width: 60, height: 60)
                            .shadow(radius: 5)
                        
                        Image(systemName:"arrow.up.arrow.down" )
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .padding(.trailing, 10)
                            .offset(x: 5.5)
                    }
                }
                Button(action: translate) {
                    Text(isMorseToText ? "Translate to Text" : "Translate to Morse Code")
                        .frame(height: 30)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
            }
            .padding()
           
            CustomTextEditor(text: $outputText)
                    .padding()
                    .disabled(true)
            
        }
        .background(Color.white)
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
                    Image("translate")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
                    
                }
                
                
                Spacer()
            }
            
        })
    }
    func switchtranslate(){
        if inputText == lastOutputText{
            inputText = lastInputText
            outputText = lastOutputText
            
            lastInputText = outputText
            lastOutputText = inputText
        }else{
            if isMorseToText {
                outputText = inputText
                inputText = outputText.toMorseCode()
                
            } else {
                outputText = inputText
                inputText = outputText.fromMorseCode()
            }
            
            lastInputText = outputText
            lastOutputText = inputText
        }
    }
    
    func translate() {
        if isMorseToText {
            outputText = inputText.fromMorseCode()
        } else {
            outputText = inputText.toMorseCode()
        }
        
        lastInputText = outputText
        lastOutputText = inputText
    }
}


    
struct TranslateView_Previews: PreviewProvider {
    static var previews: some View {
        TranslateView()
    }
}
