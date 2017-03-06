
enum Player {
    case Red
    case White
    case Empty
}

struct Board {
    
    typealias BoardColumn = [Player]
    
    static let width = 5
    static let height = 5
    
    var _board: [BoardColumn]
    
    init() {
        _board = [
            [.Empty, .Empty, .Empty, .Empty, .Empty],
            [.Empty, .Empty, .Empty, .Empty, .Empty],
            [.Empty, .Empty, .Empty, .Empty, .Empty],
            [.Empty, .Empty, .Empty, .Empty, .Empty],
            [.Empty, .Empty, .Empty, .Empty, .Empty],
        ]
    }
    
    mutating func playAt(col: Int, player: Player) {
        guard col >= 0 && col < Board.width else {
            return
        }
        
        let column = _board[col]
        
        for (index, currentPlayer) in column.enumerated() {
            if currentPlayer == .Empty {
                _board[col][index] = player
                break
            }
        }
    }
    
    func playerAt(col: Int, row: Int) -> Player {
        guard col >= 0 && col < Board.width else {
            return .Empty
        }
        
        guard row >= 0 && row < Board.height else {
            return .Empty
        }
        
        return _board[col][row]
    }
}
