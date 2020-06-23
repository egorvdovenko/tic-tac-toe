import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.15
import MyQMLEnums 1.0

import "../components"

Rectangle {
    id: selectionScreen

    width: w.width
    height: w.height

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        Text {
            Layout.alignment: Qt.AlignHCenter
            text: "CHOOSE YOUR SIDE"
            font.pointSize: 24
            font.bold: true
        }

        RowLayout {
            CustomButton {
                Layout.preferredWidth: 200
                Layout.preferredHeight: 200
                layer.enabled: true
                layer.effect: DropShadow {
                    horizontalOffset: 0
                    verticalOffset: 0
                    radius: 10.0
                    samples: 10
                    color: "#50000000"
                }

                Image {
                    anchors.centerIn: parent
                    source: "../images/circle.svg"
                }

                onClicked: {
                    w.playerShape = ShapeEnum.CIRCLE
                    w.computerShape = ShapeEnum.CROSS
                    w.currentScreen = ScreenEnum.GAME
                }
            }

            CustomButton {
                Layout.preferredWidth: 200
                Layout.preferredHeight: 200
                layer.enabled: true
                layer.effect: DropShadow {
                    horizontalOffset: 0
                    verticalOffset: 0
                    radius: 10.0
                    samples: 10
                    color: "#50000000"
                }

                Image {
                    anchors.centerIn: parent
                    source: "../images/cross.svg"
                }

                onClicked: {
                    w.playerShape = ShapeEnum.CROSS
                    w.computerShape = ShapeEnum.CIRCLE
                    w.currentScreen = ScreenEnum.GAME
                }
            }
        }
    }
}
