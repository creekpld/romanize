import XCTest
@testable import Romanize

class RomanizeTests: XCTestCase {

    // test edge cases - 가 체 힣
    func testGA() {
        XCTAssertEqual(romanize("가"), "ga")
    }
	func testCHE() {
		XCTAssertEqual(romanize("체"), "che")
	}
    func testHIH() {
		XCTAssertEqual(romanize("힣"), "hih")
	}

    // test divide syllables
    // 안녕 하세요 -> annyeong haseyo
    func testHello() {
		XCTAssertEqual(romanize("안녕 하세요"), "annyeong haseyo")
	}
    // 안녕 하세요 -> an-nyeong-ha-se-yo
    func testHello2() {
		XCTAssertEqual(romanize("안녕 하세요", true), "an-nyeong ha-se-yo")
	}

    // test sentence 
    // I’m sorry, I’m not from around here - 미안하지만 저는 이 근처 사람이 아니예요
    // -> mi-an-ha-ji-man jeo-neun i geun-cheo sa-ram-i a-ni-ye-yo
    func testSentence() {
		XCTAssertEqual(romanize("미안하지만 저는 이 근처 사람이 아니예요", true), 
        "mi-an-ha-ji-man jeo-neun i geun-cheo sa-ram-i a-ni-ye-yo")
	}
    static var allTests = [
        ("testGA", testGA), 
        ("testCHE", testCHE), 
        ("testHIH", testHIH), 
        ("testHello", testHello), 
        ("testHello2", testHello2),
        ("testSentence", testSentence),
    ]
}
