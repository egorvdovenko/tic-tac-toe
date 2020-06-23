import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.12
import MyQMLEnums 1.0

import "../components"

Rectangle {
    id: startScreen

    width: w.width
    height: w.height

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        Text {
            Layout.alignment: Qt.AlignHCenter
            text: "TicTackToe"
            font.pointSize: 48
            font.bold: true
        }

        CustomButton {
            Layout.preferredWidth: 200
            Layout.preferredHeight: 50
            Layout.alignment: Qt.AlignHCenter
            font.pointSize: 12
            text: "Start Game"
            layer.enabled: true
            layer.effect: DropShadow {
                horizontalOffset: 0
                verticalOffset: 0
                radius: 10.0
                samples: 10
                color: "#50000000"
            }

            onClicked: {
                w.currentScreen = ScreenEnum.SELECTION
            }
        }
    }
}
