function getWinnerSequence(shape, table) {
    if (table[0][0] === shape && table[1][1] === shape && table[2][2] === shape) {
        return [[0, 0], [1, 1], [2, 2]];
    }

    if (table[0][2] === shape && table[1][1] === shape && table[2][0] === shape) {
        return [[0, 2], [1, 1], [2, 0]];
    }

    for (var i = 0; i < 3; i++) {
        var shapesInRow = [];
        var shapesInCol = [];

        for (var j = 0; j < 3; j++) {
            if (table[i][j] === shape) {
                shapesInRow.push([i, j]);
            }

            if (table[j][i] === shape) {
                shapesInCol.push([j, i]);
            }
        }

        if (shapesInRow.length === 3) {
            return shapesInRow;
        }

        if (shapesInCol.length === 3) {
            return shapesInCol;
        }
    }
}

function checkGameStatus(table) {
    return table.every(function(row) {
        return row.every(function(col) {
            return col;
        });
    });
}

function getComputerMove(table, computerShape, playerShape) {
    var computerWinnerMove = _getWinnerMove(table, computerShape);

    if (computerWinnerMove) {
        return computerWinnerMove;
    }

    var playerWinnerMove = _getWinnerMove(table, playerShape);

    if (playerWinnerMove) {
        return playerWinnerMove;
    }

    var freeMove = _getFreeMove(table);

    return freeMove;
}

function _getWinnerMove(table, shape) {
    if (table[0][0] === shape && table[1][1] === shape && !table[2][2]) {
        return [2, 2];
    }

    if (table[1][1] === shape && table[2][2] === shape && !table[0][0]) {
        return [0, 0];
    }

    if (table[0][2] === shape && table[1][1] === shape && !table[2][0]) {
        return [2, 0];
    }

    if (table[1][1] === shape &&  table[2][0] === shape && !table[0][2]) {
        return [0, 2];
    }

    for (var i = 0; i < 3; i++) {
        if (table[i][0] === shape && table[i][1] === shape && !table[i][2]) {
            return [i, 2];
        }

        if (table[i][1] === shape && table[i][2] === shape && !table[i][0]) {
            return [i, 0];
        }

        if (table[0][i] === shape && table[1][i] === shape && !table[2][i]) {
            return [2, i];
        }

        if (table[1][i] === shape && table[2][i] === shape && !table[0][i]) {
            return [0, i];
        }
    }
}

function _getFreeMove(table) {    
    switch (0) {
        case table[0][0]: return [0, 0];
        case table[0][2]: return [0, 2];
        case table[2][0]: return [2, 0];
        case table[2][2]: return [2, 2];
        case table[1][1]: return [1, 1];
        case table[0][1]: return [0, 1];
        case table[1][0]: return [1, 0];
        case table[1][2]: return [1, 2];
        case table[2][1]: return [2, 1];
        default:
            console.error("_getFreeMove => Unknown error!");
    }
}
