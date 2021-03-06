//===------------------------------------------------------------------------------------------===//
//
// Romanize.swift
//
// Romanizes a String of (Korean) Hangul Characters
// Supports Hangul Unicode Syllables U+AC00 - U+D7A3
// Using Revised Romanization of Korean
// See https://en.wikipedia.org/wiki/Revised_Romanization_of_Korean
//
// Author Philipp Dylong
//
// See https://github.com/creekpld/romanize
//
// Acknowledgements:
// hangul character decomposition algorithm
// See https://github.com/zhangkaiyulw/kroman-swift
//
//===------------------------------------------------------------------------------------------===//

import Foundation

/* Romanize
Use this class and it's fluent API methodes to customize the syllable divider,
the romanization of every jamo and to generate random hangul characters.
*/
public class Romanize {
    
    public init() {
        #if os(Linux)
            srand(UInt32(time(nil)))
        #endif 
    }
    
    private var divider = "-"
    
    /// Romanizes a String of Hangul Characters Unicode Syllables U+AC00 - U+D7A3,
    /// other characters are unaffected.
    ///
    /// - Parameters:
    ///   - text: A text containing some Hangul characters.
    ///   - divideSyllables: using a divider for each romanized character,
    ///   if true = (hangeul) -> (han-geul).
    /// - Returns: The romanized String.
    public func romanize(_ text: String, _ divideSyllables: Bool = false) -> String {
        var textOut = "" // create the new string to return the romanized text output
        let ga = UnicodeScalar(0xac00)! // unicode start point value (the first char is 가 = "ga")
        let hih = UnicodeScalar(0xd7a3)! // unicode end point value (the last char is 힣 = "hih")
        let headInterval = 588
        let bodyInterval = 28
        var lastCharIsHangul = false
        // go through all the characters in the text
        for char in text.unicodeScalars {
            // checks if the character is hangul and decompose to jamo (consonats and vovels)
            if ga <= char && char <= hih {
                let head = (Int(char.value) - Int(ga.value)) / headInterval
                let headl = (Int(char.value) - Int(ga.value)) % headInterval
                let body = headl / bodyInterval
                let tail = headl % bodyInterval
                // if the last caracter was hangul, append - to separate the romanized Syllabels
                if lastCharIsHangul && divideSyllables {
                    textOut += self.divider
                }
                // append the matching romanized syllabels from the lookup tables
                textOut += headJamos[head][0]
                textOut += bodyJamos[body][0]
                textOut += tailJamos[tail][0]
                lastCharIsHangul = true
            // if the current character in not hangul, append it unchanged to the new string
            }else{
                lastCharIsHangul = false
                textOut.append(String(char))
            }
        }
        return textOut
    }
    
    /// Revised Romanization of Korean Initial Consonant letters
    private var headJamos = [
        ["g",   "ㄱ"],
        ["kk",  "ㄲ"],
        ["n",   "ㄴ"],
        ["d",   "ㄷ"],
        ["tt",  "ㄸ"],
        ["r",   "ㄹ"],
        ["m",   "ㅁ"],
        ["b",   "ㅂ"],
        ["pp",  "ㅃ"],
        ["s",   "ㅅ"],
        ["ss",  "ㅆ"],
        ["",    "ㅇ"],
        ["j",   "ㅈ"],
        ["jj",  "ㅉ"],
        ["ch",  "ㅊ"],
        ["k",   "ㅋ"],
        ["t",   "ㅌ"],
        ["p",   "ㅍ"],
        ["h",   "ㅎ"]
    ]
    
    /// Revised Romanization of Korean Vowel letters
    private var bodyJamos = [
        ["a",   "ㅏ"],
        ["ae",  "ㅐ"],
        ["ya",  "ㅑ"],
        ["yae", "ㅒ"],
        ["eo",  "ㅓ"],
        ["e",   "ㅔ"],
        ["yeo", "ㅕ"],
        ["ye",  "ㅖ"],
        ["o",   "ㅗ"],
        ["wa",  "ㅘ"],
        ["wae", "ㅙ"],
        ["oe",  "ㅚ"],
        ["yo",  "ㅛ"],
        ["u",   "ㅜ"],
        ["wo",  "ㅝ"],
        ["we",  "ㅞ"],
        ["wi",  "ㅟ"],
        ["yu",  "ㅠ"],
        ["eu",  "ㅡ"],
        ["ui",  "ㅢ"],
        ["i",   "ㅣ"]
    ]
    
    /// Revised Romanization of Korean Final Consonant letters
    private var tailJamos = [
        ["",    "ㅇ"],
        ["g",   "ㄱ"],
        ["k",   "ㄲ"],
        ["gs",  "ㄳ"],
        ["n",   "ㄴ"],
        ["nj",  "ㄵ"],
        ["nh",  "ㄶ"],
        ["t",   "ㄷ"],
        ["l",   "ㄹ"],
        ["lg",  "ㄺ"],
        ["lm",  "ㄻ"],
        ["lb",  "ㄼ"],
        ["ls",  "ㄽ"],
        ["lt",  "ㄾ"],
        ["lp",  "ㄿ"],
        ["lh",  "ㅀ"],
        ["m",   "ㅁ"],
        ["b",   "ㅂ"],
        ["bs",  "ㅄ"],
        ["s",   "ㅅ"],
        ["ss",  "ㅆ"],
        ["ng",  "ㅇ"],
        ["j",   "ㅈ"],
        ["ch",  "ㅊ"],
        ["k",   "ㅋ"],
        ["t",   "ㅌ"],
        ["p",   "ㅍ"],
        ["h",   "ㅎ"]
    ]
    
    /// Hangul Generator
    /// generates a string with random hangul characters of a given length.
    public func genHan(_ length: Int = 1) -> String {
        
        var arr = [Unicode.Scalar]()
        
        for _ in 0..<length {

            #if swift(>=4.2)
            let lead = Int.random(in: 0..<headJamos.count)
            let vowel = Int.random(in: 0..<bodyJamos.count)
            let tail = Int.random(in: 0..<tailJamos.count)
            #elseif os(Linux)
            let lead = Int(random() % headJamos.count)
            let vowel = Int(random() % bodyJamos.count)
            let tail = Int(random() % tailJamos.count)
            #else
            let lead = Int(arc4random_uniform(UInt32(headJamos.count)))
            let vowel = Int(arc4random_uniform(UInt32(bodyJamos.count)))
            let tail = Int(arc4random_uniform(UInt32(tailJamos.count)))
            #endif
            
            /// Unicode Code points for Jamo Index
            /// tail+(vowel)*28+(lead)*588+44032
            let hangulChar = Unicode.Scalar(Int(tail+(vowel)*28+(lead)*588+44032))!
            
            arr.append( hangulChar )
        }
        
        return String(unicodeScalars: arr)
    }
    
    /// Fluent API Methodes
    @discardableResult
    public func set(divider: String) -> Self {
        self.divider = divider
        return self
    }
    
    @discardableResult
    public func set(headJamo: HeadJamo, romanization: String) -> Self {
        self.headJamos[headJamo.hashValue][0] = romanization
        return self
    }
    
    @discardableResult
    public func set(bodyJamo: BodyJamo, romanization: String) -> Self {
        self.bodyJamos[bodyJamo.hashValue][0] = romanization
        return self
    }
    
    @discardableResult
    public func set(tailJamo: TailJamo, romanization: String) -> Self {
        self.tailJamos[tailJamo.hashValue+1][0] = romanization
        return self
    }
}

/// legacy method, from before there was a class.
public func romanize(_ text: String, _ divideSyllables: Bool = false) -> String {
    let r = Romanize()
    return r.romanize(text, divideSyllables)
}

public enum HeadJamo {
    case ㄱ
    case ㄲ
    case ㄴ
    case ㄷ
    case ㄸ
    case ㄹ
    case ㅁ
    case ㅂ
    case ㅃ
    case ㅅ
    case ㅆ
    case ㅇ
    case ㅈ
    case ㅉ
    case ㅊ
    case ㅋ
    case ㅌ
    case ㅍ
    case ㅎ
}

public enum BodyJamo {
    case ㅏ
    case ㅐ
    case ㅑ
    case ㅒ
    case ㅓ
    case ㅔ
    case ㅕ
    case ㅖ
    case ㅗ
    case ㅘ
    case ㅙ
    case ㅚ
    case ㅛ
    case ㅜ
    case ㅝ
    case ㅞ
    case ㅟ
    case ㅠ
    case ㅡ
    case ㅢ
    case ㅣ
}

public enum TailJamo {
    case ㄱ
    case ㄲ
    case ㄳ
    case ㄴ
    case ㄵ
    case ㄶ
    case ㄷ
    case ㄹ
    case ㄺ
    case ㄻ
    case ㄼ
    case ㄽ
    case ㄾ
    case ㄿ
    case ㅀ
    case ㅁ
    case ㅂ
    case ㅄ
    case ㅅ
    case ㅆ
    case ㅇ
    case ㅈ
    case ㅊ
    case ㅋ
    case ㅌ
    case ㅍ
    case ㅎ
}

extension String {
    init<S: Sequence>(unicodeScalars ucs: S)
        where S.Iterator.Element == UnicodeScalar
    {
        var s = ""
        s.unicodeScalars.append(contentsOf: ucs)
        self = s
    }
}
