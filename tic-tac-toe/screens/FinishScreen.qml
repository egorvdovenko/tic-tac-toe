import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import MyQMLEnums 1.0

import "../components"

Rectangle {
    id: finishScreen

    function reset() {
        w.table = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
        w.winnerSequence = null
        w.gameOver = false
        w.currentScreen = ScreenEnum.SELECTION
    }

    function getText() {
        if (w.gameOver && !w.winnerSequence) {
            return "GAME OVER";
        }

        return w.playerShape === w.winnerShape
                ? "YOU WIN"
                : "YOU LOSE";
    }

    width: w.width
    height: w.height

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        Text {
            Layout.alignment: Qt.AlignHCenter
            text: getText();
            font.pointSize: 48
            font.bold: true
        }

        CustomButton {
            Layout.preferredWidth: 200
            Layout.preferredHeight: 50
            Layout.alignment: Qt.AlignHCenter
            font.pointSize: 12
            text: "Restart Game"

            onClicked: {
                reset();
            }
        }
    }
}
