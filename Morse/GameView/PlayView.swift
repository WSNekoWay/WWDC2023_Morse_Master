import SwiftUI


struct PlayView: View {
    @State private var targetWord = ""
    @State private var morseCode = ""
    @Binding var selectedLevel: Int
    @State var counter = 0
    @State private var isBeginner = false
    @State private var isShowingModal = false
    @State private var isShowingTutorial = false
     @State private var isShowingLevels = false
    @State private var isShowingHome = false
    @State private var isShowingResult = false
    @State private var isShowingConfirmation = false
    private let words = [
        "hello", "world", "swift", "morse", "code", "game", "fun", "dog", "chicken", "fish",
        "bird", "one", "usa", "winner", "mother", "father", "lucky", "banana", "orange", "coffee",
        "purple", "turtle", "planet", "rocket", "cookie", "summer", "rocket", "sunset", "singer",
        "dancer", "author", "puzzle", "camera", "jacket", "basket", "rocket", "hockey", "runner",
        "soccer", "beauty", "button", "bridge", "candle", "guitar", "school", "travel", "circle",
        "banana", "whiskey", "yellow", "dollar", "friend", "sister", "sweater", "cousin", "scarf",
        "ticket", "bottle", "season", "camera", "crayon", "garden", "market", "dinner", "cookie",
        "wwdc2023", "wansen", "master", "1945", "5June", "19April", "24","123", "jungle", "cactus",
        "trivia", "museum", "bishop", "castle", "hammer", "garden", "fossil", "magnet", "planet",
        "jigsaw", "tulip", "forest", "button", "velvet", "rugby", "pickle", "jockey", "wallet",
        "coffee", "purple", "banner", "camera", "circle", "market", "octave", "buzzer", "parrot",
        "floral", "paddle", "mosaic", "marble", "kitten", "orange", "butter", "bubble", "turkey",
        "carrot", "bangle", "rocket", "puzzle", "basket", "window", "ribbon", "sandal", "walnut",
        "thread", "waffle", "slalom", "pickle", "kayak", "violet", "amulet", "cupcake", "safari",
        "dungeon", "garden", "bridge", "sunset", "singer", "sweater", "hockey", "runner", "button",
        "candle", "school", "travel", "dollar", "friend", "scarf", "ticket", "season", "guitar",
        "market", "dinner", "master", "101", "fleece", "mitten", "wallet", "pickle", "hammer",
        "castle", "bishop", "buzzer", "fossil", "magnet", "tulip", "octave", "jockey", "velvet",
        "forest", "jigsaw", "parrot", "jungle", "mosaic", "marble", "coffee", "purple", "button",
        "circle", "market", "camera", "bangle", "rocket", "puzzle", "pickle", "basket", "slalom",
        "walnut", "window", "ribbon", "sandal", "thread", "amulet", "violet", "kitten", "safari",
        "cupcake", "kayak", "carrot", "turkey", "bubble", "butter", "orange", "rocket", "floral",
        "paddle", "banner"
    ]

    
    @State private var currentAnswer = ""
    @State private var availableLetters = [String]()
    @State private var isCompleted = false
    @State private var isCorrectAnswer = false
    @State private var currentRound = 1
    @State var isMenuVisible = false
    let maxAnswerLength = 16
    @State private var totalCorrect = 0
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack(spacing: 0) {
                    
                    Spacer()
                    Button(action: {
                        
                        if counter > 0 || isBeginner == true {
                                self.isShowingModal.toggle()
                                counter -= 1
                            }
                        
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(hex: "ADD8E6"))
                                .frame(width: 60, height: 60)
                                .shadow(radius: 5)
                            
                            Image(systemName: "book.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .padding(.trailing, 10)
                                .offset(x: 5.5)
                            
                            if isBeginner == true{
                                ZStack {
                                    Circle()
                                        .fill(Color.red)
                                        .frame(width: 20, height: 20)
                                    Text("8")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                        .rotationEffect(.degrees(90))
                                }
                                .offset(x: 15, y: 15)

                            }
                            else{
                                ZStack {
                                    Circle()
                                        .fill(Color.red)
                                        .frame(width: 20, height: 20)
                                    Text("\(counter)")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                }
                                .offset(x: 15, y: 15)
                            }
                        }
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .padding(.top, 16)
                    .padding(.trailing, 16)
                    
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
                        self.isShowingLevels = true
                    }) {ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.yellow)
                            .frame(width: 60, height: 60)
                            .shadow(radius: 5)
                        Image(systemName: "list.bullet")
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
                    .fullScreenCover(isPresented: $isShowingLevels) {
                        LevelView(isShowingLevels: $isShowingLevels)
                    }
                    
                    Button(action: {
                        start()
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.orange)
                                .frame(width: 60, height: 60)
                                .shadow(radius: 5)
                            Image(systemName: "arrow.clockwise.circle.fill")
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
                Spacer()
                VStack{
                    
                    Text("Morse Master")
                        .font(.system(size: 60, weight: .bold, design: .default))
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                    Text("Round \(currentRound) of 10")
                        .font(.subheadline)
                        .foregroundColor(.black)
                    
                }
                VStack(spacing:50){
                    VStack(spacing: 10){
                        MorseCodeView(code: morseCode, color: .blue, backgroundColor: .yellow)
                            .padding()
                        
                        HStack(){
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray)
                                    .frame(maxWidth: 500, maxHeight: 100)
                                    .padding()
                                
                                HStack {
                                    VStack {
                                        if currentAnswer.isEmpty {
                                            Text(isCompleted ? "Answer Submitted" : "Your Answer")
                                                .font(.headline)
                                                .foregroundColor(.white)
                                        } else {
                                            Text("Your Answer")
                                                .font(.headline)
                                                .foregroundColor(.white)
                                                .padding(.top, -10)
                                            Text(currentAnswer)
                                                .font(.title)
                                                .foregroundColor(.blue)
                                                .padding(.top, 2)
                                        }
                                    }
                                    
                                    
                                }
                            }.padding(.leading,90)
                           
                            Button(action: backward) {
                                Image(systemName: "delete.backward")
                                    .font(.title)
                                    .frame(width: 40)
                                    .padding()
                                    .background(Color.orange)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                           
                            .padding(.leading, 10)
                            
                        }
                        



                        
                        HStack(spacing: 16) {
                            ForEach(availableLetters, id: \.self) { letter in
                                Button(action: {
                                    if currentAnswer.count < maxAnswerLength {
                                        self.append(letter)
                                    }
                                }){
                                    Text(letter)
                                        .font(.title)
                                        .padding()
                                        .background(Color.blue)
                                        .foregroundColor(Color.white)
                                        .cornerRadius(8)
                                }
                                .disabled(isCompleted) // add the disabled modifier here
                            }
                        }
                        .padding(.top,30)
                        
                    }
                    .padding(.top,40)
                    
                    if isCompleted {
                        if currentRound < 10 {
                            VStack {
                                if isCorrectAnswer {
                                    Text("Correct!")
                                        .foregroundColor(.green)
                                        .font(.largeTitle)
                                    
                                } else {
                                    Text("Incorrect.")
                                        .foregroundColor(.red)
                                        .font(.largeTitle)
                                }
                                Button(action: nextRound) {
                                    Text("Next Round")
                                        .font(.title)
                                        .fontWeight(.semibold)
                                        .frame(width: 300)
                                        .padding()
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                                
                            }.padding(.top,55)
                        }
                    } else {
                        VStack(){
                            
                            Button(action: clear) {
                                Text("Clear")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .frame(width: 300)
                                    .padding()
                                    .background(Color.red)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            .padding(.bottom)
                            
                            Button(action: submit) {
                                Text("Submit")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .frame(width: 300)
                                    .padding()
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            
                        }
                        .padding(.top,30)
                        
                    }
                }
                Spacer()
                
            }
            .onAppear(perform: start)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.bottom,150)
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
                        Image("tutorial")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
                        
                    }
                    
                    
                    Spacer()
                }
                
            })
            .sheet(isPresented: $isShowingResult, content: {
                ZStack{
                    Rectangle()
                        .fill(Color.white)
                        .edgesIgnoringSafeArea(.all)
                    VStack(spacing: 20) {
                        
                        Text("Game Over!")
                            .font(.title)
                            .bold()
                            .foregroundColor(.blue)
                            .padding(.top, 30)
                        Text("You've correctly answered \(totalCorrect) out of 10 rounds so far. Keep it up!")
                            .font(.headline)
                            .foregroundColor(.blue)
                        Text("Your Score")
                            .font(.headline)
                            .foregroundColor(.blue)
                        Text("\(10 * totalCorrect)")
                            .font(.system(size: 150, weight: .bold))
                            .foregroundColor(.green)
                            .padding(.top, 30)
                        
                        Button(action: {
                            start()
                            isShowingResult = false
                        }) {
                            Text("Restart")
                                .font(.title)
                                .fontWeight(.semibold)
                                .frame(width: 300)
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                        
                        
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.white)
                    
                }
                
            })

           
                    
                
    }.background(Color.white.edgesIgnoringSafeArea(.all))
        
    }


    private func nextRound() {
        reset()
        currentRound += 1
    }
    private func reset() {
        targetWord = words.randomElement()!
        morseCode = targetWord.toMorseCode()
        currentAnswer = ""
        if isBeginner == true {
            counter = 999
        }
        isCompleted = false
        isCorrectAnswer = false
        
        let usedLetters = Set(targetWord.lowercased().filter { $0.isLetter })
        let alphabet = "abcdefghijklmnopqrstuvwxyz".filter { !usedLetters.contains($0) }
        
        var randomLetters = [String]()
        for letter in targetWord.lowercased() {
            if !randomLetters.contains(String(letter)) {
                randomLetters.append(String(letter))
            }
        }
        
        while randomLetters.count < 10 {
            let newLetter = String(alphabet.randomElement()!)
            if !randomLetters.contains(newLetter) {
                randomLetters.append(newLetter)
            }
        }
        
        availableLetters = randomLetters.shuffled()
    }
    private func start() {
        targetWord = words.randomElement()!
        morseCode = targetWord.toMorseCode()
        currentRound = 1
        totalCorrect = 0
        if selectedLevel == 1 {
            counter = 999
            isBeginner = true
        }
        else if selectedLevel == 2 {
            isBeginner = false
            counter = 5
        }
        else {
            isBeginner = false
            counter = 0
        }
        currentAnswer = ""
        isCompleted = false
        isCorrectAnswer = false
        
        let usedLetters = Set(targetWord.lowercased().filter { $0.isLetter })
        let alphabet = "abcdefghijklmnopqrstuvwxyz".filter { !usedLetters.contains($0) }
        
        var randomLetters = [String]()
        for letter in targetWord.lowercased() {
            if !randomLetters.contains(String(letter)) {
                randomLetters.append(String(letter))
            }
        }
        
        while randomLetters.count < 10 {
            let newLetter = String(alphabet.randomElement()!)
            if !randomLetters.contains(newLetter) {
                randomLetters.append(newLetter)
            }
        }
        
        availableLetters = randomLetters.shuffled()
    }
    
    private func append(_ letter: String) {
        currentAnswer += letter
    }
    
    private func backward() {
        guard !currentAnswer.isEmpty else { return }
        currentAnswer.removeLast()
    }
    
    private func clear() {
        currentAnswer = ""
    }
    
    private func submit() {
        if currentAnswer.lowercased() == targetWord.lowercased() {
            isCorrectAnswer = true
            totalCorrect += 1
        } else {
            isCorrectAnswer = false
        }
        isCompleted = true
        if currentRound == 10{
            isShowingResult = true
        }
     }
}






struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView(selectedLevel: .constant(1))
    }
}
