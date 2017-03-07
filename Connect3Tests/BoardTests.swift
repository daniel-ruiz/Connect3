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
    
    func testBoardWithEmptyPosition_isOccupiedByEmptyPlayer() {
        XCTAssertEqual(board.playerAt(col: 0, row: 0), .Empty)
        XCTAssertEqual(board.playerAt(col: 3, row: 4), .Empty)
        XCTAssertEqual(board.playerAt(col: 1, row: 2), .Empty)
    }
    
    func testBoardWithPlayer_hasPositionOccupiedByPlayer() {
        board.playAt(col: 2, player: .Red)
        board.playAt(col: 2, player: .Red)
    }
    
    func testFullColumn_doesntAcceptNewCoins() {
        board.playAt(col: 0, player: .Red)
        board.playAt(col: 0, player: .Red)
        board.playAt(col: 0, player: .Red)
        board.playAt(col: 0, player: .Red)
        board.playAt(col: 0, player: .Red)
        
        let alreadyFullBoard: Board! = board
        
        board.playAt(col: 0, player: .White)
        
        XCTAssertEqual(board, alreadyFullBoard)
    }
    
    func test2CopiedBoards_areEqual() {
        let emptyBoard = board
        XCTAssertEqual(emptyBoard, board)
        
        var board2 = board
        board.playAt(col: 0, player: .White)
        board2?.playAt(col: 0, player: .White)
        XCTAssertEqual(board2, board)
        
        XCTAssertNotEqual(emptyBoard, board)
        XCTAssertNotEqual(emptyBoard, board2)
        
        board2?.playAt(col: 3, player: .Red)
        XCTAssertNotEqual(board2, board)
    }
    
    func test2EqualBoards_haveSameHash() {
        
        let emptyBoard = board
        XCTAssertEqual(board.hashValue, emptyBoard?.hashValue)
        
        board.playAt(col: 3, player: .White)
        board.playAt(col: 1, player: .Red)
        let playedBoard = board
        XCTAssertEqual(board.hashValue, playedBoard?.hashValue)
        
        board.playAt(col: 0, player: .Red)
        XCTAssertNotEqual(emptyBoard?.hashValue, board.hashValue)
        XCTAssertNotEqual(playedBoard?.hashValue, board.hashValue)
        
    }
    
    func testBoard_hasStringRepresentation() {
        XCTAssertNotNil(board! as? CustomStringConvertible)
    }
    
    func testBoard_hasWinnerInColumn() {
        XCTAssertEqual(board.winnerInColumn(col: 0), .Empty)
        
        board.playAt(col: 3, player: .Red)
        board.playAt(col: 3, player: .Red)
        board.playAt(col: 3, player: .Red)
        
        XCTAssertEqual(board.winnerInColumn(col: 3), .Red)
        
        board.playAt(col: 2, player: .Red)
        board.playAt(col: 2, player: .Red)
        board.playAt(col: 2, player: .White)
        board.playAt(col: 2, player: .White)
        board.playAt(col: 2, player: .White)
        
        XCTAssertEqual(board.winnerInColumn(col: 2), .White)
        
        board.playAt(col: 1, player: .Red)
        board.playAt(col: 1, player: .White)
        board.playAt(col: 1, player: .Red)
        board.playAt(col: 1, player: .White)
        board.playAt(col: 1, player: .White)
        
        XCTAssertEqual(board.winnerInColumn(col: 1), .Empty)
    }
}
