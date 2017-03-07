
import XCTest

class SequenceTest: XCTestCase {
    
    func testMap() {
        let original = [1, 2, 3, 4]
        let expected = [2, 3, 4, 5]
        
        XCTAssertEqual(expected, original.map{ $0 + 1 })
    }
    
    func testFlapMap() {
        let original = [1, Optional(2), nil, Optional(3), 4]
        let expected = [1, 2, 3, 4]
        
        XCTAssertEqual(expected, original.flatMap{ $0 })
    }
    
}
