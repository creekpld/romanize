// romanize.swif
//
// Acknowledgements:
// The Hangul Character Decomposition code is from here: https://github.com/cheunghy/kroman-swift

/// Romanizes a String of Hangul Characters
/// - Supports Hangul Syllables (U+AC00-U+D7A3)
/// - Using Revised Romanization https://en.wikipedia.org/wiki/Revised_Romanization_of_Korean
public func romanize(_ text: String, _ divideSyllables: Bool = false) -> String {
    var textOut = ""               // create the new string to return the romanized text output
    let ga = UnicodeScalar(0xac00)!  // unicode start point value (the first char is 가 = "ga")
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
                textOut += "-"
            }
            // append the matching romanized syllabels from the lookup tables
            textOut += headJamos[head]
            textOut += bodyJamos[body]
            textOut += tailJamos[tail]
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
let headJamos = [
    "g",    // ㄱ
    "kk",   // ㄲ
    "n",    // ㄴ
    "d",    // ㄷ
    "tt",   // ㄸ
    "r",    // ㄹ
    "m",    // ㅁ
    "b",    // ㅂ
    "pp",   // ㅃ
    "s",    // ㅅ
    "ss",   // ㅆ
    "",     // ㅇ
    "j",    // ㅈ
    "jj",   // ㅉ
    "ch",   // ㅊ
    "k",    // ㅋ
    "t",    // ㅌ
    "p",    // ㅍ
    "h"     // ㅎ
]
/// Revised Romanization of Korean Vowel letters
let bodyJamos = [
    "a",    // ㅏ
    "ae",   // ㅐ
    "ya",   // ㅑ
    "yae",  // ㅒ
    "eo",   // ㅓ
    "e",    // ㅔ
    "yeo",  // ㅕ
    "ye",   // ㅖ
    "o",    // ㅗ
    "wa",   // ㅘ
    "wae",  // ㅙ
    "oe",   // ㅚ
    "yo",   // ㅛ
    "u",    // ㅜ
    "wo",   // ㅝ
    "we",   // ㅞ
    "wi",   // ㅟ
    "yu",   // ㅠ
    "eu",   // ㅡ
    "ui",   // ㅢ
    "i"     // ㅣ
]
/// Revised Romanization of Korean Final Consonant letters
let tailJamos = [
    "",     // ㅇ
    "g",    // ㄱ
    "k",    // ㄲ
    "gs",   // ㄳ
    "n",    // ㄴ
    "nj",   // ㄵ
    "nh",   // ㄶ
    "t",    // ㄷ
    "l",    // ㄹ
    "lg",   // ㄺ
    "lm",   // ㄻ
    "lb",   // ㄼ
    "ls",   // ㄽ
    "lt",   // ㄾ
    "lp",   // ㄿ
    "lh",   // ㅀ
    "m",    // ㅁ
    "b",    // ㅂ
    "bs",   // ㅄ
    "s",    // ㅅ
    "ss",   // ㅆ
    "ng",   // ㅇ
    "j",    // ㅈ
    "ch",   // ㅊ
    "k",    // ㅋ
    "t",    // ㅌ
    "p",    // ㅍ
    "h"     // ㅎ
]
