//
//  RomanizePerformanceTest.swift
//  RomanizeTests
//
//  Created by Philipp Dylong on 01.09.18.
//

import XCTest
@testable import Romanize

class RomanizePerformanceTest: XCTestCase {
    
    var rom: Romanize?
    var hangulText: String?
    var generatedHangulText: String?

    override func setUp() {
        super.setUp()
        
        rom = Romanize()
        
        generatedHangulText = rom!.genHan(1000000)

        hangulText = """
        안녕하세요?
        EMR 학생들과 학부모님들의 참여로 진행되었던 시즌 7 출첵퀴즈가 모두 끝났습니다 ^ 이번 출첵퀴즈를 통해 학부모님과 학생들 모두 카페를 이용하여 정보가 공유되고 소통을 할수 있는 좋은 기회가 될수 있었던것 같습니다. 다시한번 출첵퀴즈의 목적을 말씀드리자면, 퀴즈를 통하여 우리 EMR 학생들과 학부모님들 께서 저희 카페의 구석구석을 살펴보며 유용한 정보도 얻으시고 앞으로도 자주 들어오셔서 많은 활동을 해주시도록 격려하기 위해서 였습니다 ^
        참여해 주신 모든 분들에게 감사의 말씀을 드립니다.
        하지만 안타깝게도 이번 출첵퀴즈는 매회 전 학생이 참여하지는 않았기에 약속되어있던 바베큐 파티는 못하게 되었습니다
        총 8번의 퀴즈로 진행된 이번 출첵퀴즈에서 학부모님들과 학생들의 각각 누적된 점수로 1,2,3등이 정해졌습니다. 축하드립니다~!!!
        학부모님 순위
        1위 김건우 부모님 73점 2위 박서겸 부모님 71점 3위 이준호 부모님 67점
        학생 순위
        1위 서진욱 83점 2위 이준호 80점 3위 박서겸 79점
        공지드렸던 대로 이번 출첵퀴즈 상품은 높은 점수 순으로 먼저 고를수 있는 기회가 있습니다.
        먼저 학부모님 상품목록은
        추억을 쌓을 수 있는 씨애틀 여행상품권 (2인 기준)
        최신 기술체험을 위한 VR
        음악감상을 위한 무선 이어폰
        즐겁게 탈 수 있는 자전거
        학생 상품은 다음과 같습니다.
        최신 핸드폰 3 개 (한명당 한개씩 고를수 있음)
        최신 영화관람을 위한 영화관람권 4장
        운동의 좋은 파트너가 되어줄 Fitbit
        건우 부모님, 서겸이 부모님, 준호 부모님 순서대로 댓글에 원하는 상품을 남겨주시면 전달하도록 하겠습니다.
        꼭 순서대로 댓글을 남겨주셔야되며 순서대로 댓글이 남겨지지않을 경우 상품 수령에 차질이 생길수있습니다. (예를들어 건우 부모님이 첫번째로 댓글로 원하시는 상품을 말씀하시면, 서겸이 부모님이 그 다음으로 댓글로 원하시는 상품을 말씀해 주시면 됩니다.)
        생각해 보시고 캐나다 시간으로 수요일 저녁 7까지 원하시는 상품을 알려주시기 바랍니다.
        앞으로도 EMR 학생들과 학부모님의 많은 카페 참여 부탁드립니다.
        감사합니다.
        """
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHangulGenerator() {
       print(rom!.genHan(100000))
    }

    func testPerformance_A() {
        // This is an example of a performance test case.
        self.measure {
            let test = rom!.romanize(hangulText!, true)
            //print(test)
        }
    }
    
    func testPerformance_B() {
        // This is an example of a performance test case.
        self.measure {
            let test = rom!
                .set(divider: "_")
                .romanize(hangulText!, true)
            //print(test)
        }
    }
    
    func testPerformance_C() {
        // This is an example of a performance test case.
        self.measure {
            let test =  rom!.romanize(generatedHangulText!)
            //print(test
        }
    }
    
    static var allTests = [
        ("testPerformance_A", testPerformance_A),
        ("testPerformance_B", testPerformance_B),
        ("testPerformance_C", testPerformance_C)
    ]

}
