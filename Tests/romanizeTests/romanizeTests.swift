import XCTest
@testable import romanize

class romanizeTests: XCTestCase {
    func testGA() {
        XCTAssertEqual(romanize("가"), "ga")
    }
	func testCHE() {
		XCTAssertEqual(romanize("체"), "che")
	}


    static var allTests = [
        ("testGA", testGA), ("testCHE", testCHE),
    ]
}
