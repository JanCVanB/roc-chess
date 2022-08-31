app "play"
    packages { pf: "roc/examples/interactive/tui-platform/main.roc" }
    imports [Chess, pf.Task]
    provides [main] to pf

main =
    player1 <- Task.await newPlayer "Player 1"
    player2 <- Task.await newPlayer "Player 2"
    game <- Task.await newGame player1 player2
    _ <- Task.forever nextMove game
    idk gameOver?
