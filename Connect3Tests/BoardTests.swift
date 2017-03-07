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
        let player = board.playerAt(col: 0, row: 0)
        
        XCTAssertEqual(player, .Empty)
    }
    
    func testNoMoreCoinsCanBeAddedInAFullColumn() {
        let columnIndex = 2
        
        for _ in 0..<Board.height {
            board.playAt(col: columnIndex, player: .White)
        }
        
        board.playAt(col: columnIndex, player: .Red)
        
        for rowIndex in 0..<Board.height {
            XCTAssertEqual(board.playerAt(col: columnIndex, row: rowIndex), .White)
        }
    }
    
    func testNoCoinsCanBeAddedInNonExistingColumns() {
        for columnIndex in [-1, Board.height + 2] {
            board.playAt(col: columnIndex, player: .Red)
            XCTAssertEqual(board.playerAt(col: columnIndex, row: 0), .Empty)
        }
    }
    
    func testForAWinInAColumn() {
        board.playAt(col: 0, player: .Red)
        board.playAt(col: 0, player: .Red)
        board.playAt(col: 0, player: .Red)
        
        XCTAssertEqual(board.hasWinner(), true)
        XCTAssertEqual(board.winner, .Red)
    }
    
    func testForNotAWinInAColumn() {
        board.playAt(col: 0, player: .Red)
        board.playAt(col: 0, player: .White)
        board.playAt(col: 0, player: .Red)
        board.playAt(col: 0, player: .Red)
        
        XCTAssertEqual(board.hasWinner(), false)
    }
    
}
