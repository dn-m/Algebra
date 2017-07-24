import XCTest
@testable import Algebra

class AlgebraTests: XCTestCase {

    func testOneIsOne() {
        XCTAssertEqual(1,1)
    }

    static var allTests = [
        ("testOneIsOne", testOneIsOne),
    ]
}
