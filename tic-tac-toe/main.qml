import QtQuick 2.12
import QtQuick.Window 2.12
import MyQMLEnums 1.0

import "./screens"

Window {
    id: w

    property var table: [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    property var winnerSequence
    property int currentScreen: ScreenEnum.START
    property int winnerShape
    property int playerShape
    property int computerShape
    property bool gameOver: false

    visible: true
    minimumWidth: 600
    maximumWidth: 600
    minimumHeight: 600
    maximumHeight: 600
    title: qsTr("TicTacToe")

    StartScreen {
        visible: currentScreen === ScreenEnum.START
    }

    SelectionScreen {
        visible: currentScreen === ScreenEnum.SELECTION
    }

    GameScreen {
        visible: currentScreen === ScreenEnum.GAME
    }

    FinishScreen {
        visible: currentScreen === ScreenEnum.FINISH
    }
}
