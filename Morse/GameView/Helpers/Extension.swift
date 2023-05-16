import SwiftUI

extension String {
    func toMorseCode() -> String {
        let morseCodeMapping: [Character: String] = [
            "a": ".-", "b": "-...", "c": "-.-.", "d": "-..", "e": ".", "f": "..-.", "g": "--.", "h": "....", "i": "..", "j": ".---", "k": "-.-", "l": ".-..", "m": "--", "n": "-.", "o": "---", "p": ".--.", "q": "--.-", "r": ".-.", "s": "...", "t": "-", "u": "..-", "v": "...-", "w": ".--", "x": "-..-", "y": "-.--", "z": "--..",
            "0": "-----", "1": ".----", "2": "..---", "3": "...--", "4": "....-", "5": ".....", "6": "-....", "7": "--...", "8": "---..", "9": "----.",
        ]
        let lowercaseSelf = self.lowercased()
        var morseCode = ""
        for character in lowercaseSelf {
            if let code = morseCodeMapping[character] {
                morseCode += code + " "
            } else {
                morseCode += "  " // add extra space for unsupported characters
            }
        }
        return morseCode
    }
}
extension String {
    func fromMorseCode() -> String {
        let morseCodeMapping: [String: Character] = [
            ".-": "a", "-...": "b", "-.-.": "c", "-..": "d", ".": "e", "..-.": "f", "--.": "g", "....": "h", "..": "i", ".---": "j", "-.-": "k", ".-..": "l", "--": "m", "-.": "n", "---": "o", ".--.": "p", "--.-": "q", ".-.": "r", "...": "s", "-": "t", "..-": "u", "...-": "v", ".--": "w", "-..-": "x", "-.--": "y", "--..": "z",
            "-----": "0", ".----": "1", "..---": "2", "...--": "3", "....-": "4", ".....": "5", "-....": "6", "--...": "7", "---..": "8", "----.": "9",
        ]
        let codes = self.components(separatedBy: " ")
        var message = ""
        for code in codes {
            if let character = morseCodeMapping[code] {
                message += String(character)
            } else {
                message += " " // add extra space for unsupported codes
            }
        }
        return message
    }
}


extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue >> 16) & 0xff
        let g = (rgbValue >> 8) & 0xff
        let b = rgbValue & 0xff
        
        self.init(red: Double(r) / 0xff, green: Double(g) / 0xff, blue: Double(b) / 0xff)
    }
}

