interface Chess
    exposes []
    imports []


## # Types

UniqueId : Str

Player : {
    id: UniqueId,
    name: PersonalName,
    rating: EloRating,
}
EloRating : U16
PersonalName : Str

LiveGame : {
    id: UniqueId,
    timeControl: TimeControl,
    blackPlayerId: UniqueId,
    whitePlayerId: UniqueId,
    state: GameState,
}
PastGame : {
    id: UniqueId,
    timeControl: TimeControl,
    blackPlayerId: UniqueId,
    whitePlayerId: UniqueId,
    finalState: GameState,
}
GameState : {
    blackPieces: List Piece,
    blackTimeRemaining: TimeRemaining,
    whitePieces: List Piece,
    whiteTimeRemaining: TimeRemaining,
    whoToMove: [Black, White],
}
TimeControl : {
    minutesToSpend: Minutes U8,
    secondsToGain: Seconds U8,
}
TimeRemaining : Seconds U16


## # Workflows

StartGame : Player, Player -> Game
StartGameEvents : {
    gameStarted: ...,
}

MakeMoveError : [ValidationError MoveValidationError]
MoveValidationError : {
    pieceMove: PieceMove,
    errorDescription: Str,

MakeMove : GameState, PieceMove -> Result MakeMoveEvents MakeMoveError
PieceMove : {
    before: Piece,
    after: Piece,
}
MakeMoveEvents : {
    moveMade: ...,
    gameStateChanged: ...,
}
MakeMoveError : [ValidationError MoveValidationError]
MoveValidationError : {
    pieceMove: PieceMove,
    errorDescription: Str,
}

