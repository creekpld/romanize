import XCTest
@testable import Romanize

class RomanizeFluentTests: XCTestCase {
    
    // test fluent API
    func testFluentGAtoKA() {
        let result = Romanize()
        .set(headJamo: .ㄱ, romanization: "k")
        .romanize("가", true)
        
        XCTAssertEqual(result, "ka")
    }
    
    func testFluentReplaceHeadJamo() {
        let result = Romanize()
            .set(headJamo: .ㅅ, romanization: "ß")
            .romanize("사")
        
        XCTAssertEqual(result, "ßa")
    }
    
    func testFluentReplaceBodyJamo() {
        let result = Romanize()
            .set(bodyJamo: .ㅔ, romanization: "ë")
            .romanize("체")
        
        XCTAssertEqual(result, "chë")
    }
    
    func testFluentReplaceTailJamo() {
        let result = Romanize()
            .set(tailJamo: .ㅎ, romanization: "H")
            .romanize("힣")
        
        XCTAssertEqual(result, "hiH")
    }
    
    // test fluent sentence
    // whith options: divider = "_", cange headJamo romanization of ㅁ to M
    // I’m sorry, I’m not from around here - 미안하지만 저는 이 근처 사람이 아니예요
    // -> mi-an-ha-ji-man jeo-neun i geun-cheo sa-ram-i a-ni-ye-yo
    func testFluentSentence() {
        
        let result = Romanize()
        .set(divider: "_")
        .set(headJamo: .ㅁ, romanization: "M")
        .romanize("미안하지만 저는 이 근처 사람이 아니예요", true)
        
        XCTAssertEqual(result, "Mi_an_ha_ji_Man jeo_neun i geun_cheo sa_ram_i a_ni_ye_yo")
    }
    
    
    static var allTests = [
        ("testFluentGAtoKA", testFluentGAtoKA),
        ("testFluentReplaceHeadJamo", testFluentReplaceHeadJamo),
        ("testFluentReplaceBodyJamo", testFluentReplaceBodyJamo),
        ("testFluentReplaceTailJamo", testFluentReplaceTailJamo),
        ("testFluentSentence", testFluentSentence)
        ]
}
