import QtQuick 2.12
import QtQuick.Controls 2.12

Button {
    id: customButton

    property bool active: false

    background: Rectangle {
        color: active ? "#d6d6d6" : "#ffffff"
        border.color: "#282828"
        border.width: 2
    }

    onPressed: {
        active = true
    }
    onReleased: {
        active = false
    }
}

