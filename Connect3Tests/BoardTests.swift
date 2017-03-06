//
//  BoardTests.swift
//  Connect3
//
//  Created by Daniel Ruiz on 06/03/2017.
//  Copyright © 2017 Daniel Ruiz. All rights reserved.
//

import XCTest

@testable import Connect3

class BoardTests: XCTestCase {
    
    var board: Board!
    
    override func setUp() {
        super.setUp()
        
        board = Board()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCanInitializeBoard() {
        XCTAssertNotNil(self.board)
    }
    
    func testCoinIsInTheRightPositionAfterAdded() {
        board.playAt(col: 0, player: .Red)
        var player = board.playerAt(col: 0, row: 0)
        XCTAssertEqual(player, .Red)

        board.playAt(col: 0, player: .White)
        player = board.playerAt(col: 0, row: 1)
        XCTAssertEqual(player, .White)
    }
    
    func testThatPlayerPositionIsEmpty() {
        
    }
}
