import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.12
import MyQMLEnums 1.0

import "../components"
import "../scripts/game_engine.js" as GameEngine

GridLayout {
    id: gameScreen

    function setMove(move, shape) {
        var tmp = w.table;

        tmp[move[0]][move[1]] = shape;
        w.table = tmp;
    }

    function checkMove(shape) {
        w.winnerSequence = GameEngine.getWinnerSequence(shape, w.table);
        w.gameOver = GameEngine.checkGameStatus(w.table);

        if (w.winnerSequence || w.gameOver) {
            timer.startTimer(function () {
                w.winnerShape = shape;
                w.currentScreen = ScreenEnum.FINISH;
            }, 2000);
        }
    }

    function checkCellImageVisibility(i, j) {
        if (!w.winnerSequence) {
            return w.table[i][j];
        }

        return w.winnerSequence.some(function (item) {
            return item[0] === i && item[1] === j;
        });
    }

    width: w.width
    height: w.height
    columns: 3
    rows: 3
    columnSpacing: 0
    rowSpacing: 0

    Repeater {
        model: repeaterModel

        CustomButton {
            Layout.preferredWidth: 200
            Layout.preferredHeight: 200

            Image {
                anchors.centerIn: parent
                visible: checkCellImageVisibility(i, j)
                source: w.table[i][j] === ShapeEnum.CIRCLE
                        ? "../images/circle.svg"
                        : "../images/cross.svg"
            }

            onClicked: {
                if (w.table[i][j]) {
                    return;
                }

                setMove([i, j], w.playerShape);
                checkMove(w.playerShape);

                if (!w.winnerSequence && !w.gameOver) {
                    var computerMove = GameEngine.getComputerMove(w.table, w.computerShape, w.playerShape);

                    setMove(computerMove, w.computerShape);
                    checkMove(w.computerShape);
                }
            }
        }
    }

    ListModel {
        id: repeaterModel

        ListElement { i: 0; j: 0 }
        ListElement { i: 0; j: 1 }
        ListElement { i: 0; j: 2 }
        ListElement { i: 1; j: 0 }
        ListElement { i: 1; j: 1 }
        ListElement { i: 1; j: 2 }
        ListElement { i: 2; j: 0 }
        ListElement { i: 2; j: 1 }
        ListElement { i: 2; j: 2 }
    }

    Timer {
        id: timer

        function startTimer(callback, milliseconds) {
            timer.interval = milliseconds;
            timer.repeat = false;
            timer.triggered.connect(callback);
            timer.start();
        }
    }
}
