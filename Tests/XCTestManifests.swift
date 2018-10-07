import XCTest

extension RomanizeFluentTests {
    static let __allTests = [
        ("testFluentGAtoKA", testFluentGAtoKA),
        ("testFluentReplaceBodyJamo", testFluentReplaceBodyJamo),
        ("testFluentReplaceHeadJamo", testFluentReplaceHeadJamo),
        ("testFluentReplaceTailJamo", testFluentReplaceTailJamo),
        ("testFluentSentence", testFluentSentence),
    ]
}

extension RomanizePerformanceTest {
    static let __allTests = [
        ("testHangulGenerator", testHangulGenerator),
        ("testPerformance_A", testPerformance_A),
        ("testPerformance_B", testPerformance_B),
        ("testPerformance_C", testPerformance_C),
    ]
}

extension RomanizeTests {
    static let __allTests = [
        ("testCHE", testCHE),
        ("testGA", testGA),
        ("testHello", testHello),
        ("testHello2", testHello2),
        ("testHIH", testHIH),
        ("testSentence", testSentence),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(RomanizeFluentTests.__allTests),
        testCase(RomanizePerformanceTest.__allTests),
        testCase(RomanizeTests.__allTests),
    ]
}
#endif
