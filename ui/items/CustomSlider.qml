import QtQuick 2.9
import QtQuick.Controls 2.4
import "../styles" as Style

Item {
    id: root

    property var values: []

    property real min: 0.0
    property real max: 1.0
    property real step: 0.5
    property real current: 0.5

    property alias orientation: control.orientation

    function installParams() {
        if (!values.length) {
            control.from = root.min;
            control.to = root.max;
            control.stepSize = root.step;
            control.value = root.current;
        }
        else {
            control.from = 0.0;
            control.to = values.length - 1;
            control.stepSize = 1;
            control.value = root.current;
        }
    }

    function getText(param) {
        if (!values.length) {
            return param;
        }
        return values[param];
    }

    Component.onCompleted: {
        installParams();
    }

    Slider {
        id: control

        value: 0.5

        anchors.fill: parent

        orientation: Qt.Horizontal

        background: Rectangle {
            id: back

            x: (control.orientation === Qt.Vertical) ? control.leftPadding + control.availableWidth / 2 - width / 2 : control.leftPadding
            y: (control.orientation === Qt.Vertical) ? control.topPadding : control.leftPadding + control.availableHeight / 2 - height / 2

            implicitWidth: (control.orientation === Qt.Vertical) ? 4 : 200
            implicitHeight: (control.orienation === Qt.Vertical) ? 200 : 4
            width: (control.orientation === Qt.Vertical) ? implicitWidth : control.availableWidth
            height: (control.orientation === Qt.Vertical) ? control.availableHeight : implicitHeight
            radius: 2
            color: (control.orientation === Qt.Vertical) ? "#21be2b" : "#bdbebf"

            Rectangle {
                width: (control.orientation === Qt.Vertical) ? parent.width : control.visualPosition * parent.width
                height: (control.orientation === Qt.Vertical) ? control.visualPosition * parent.height : parent.height
                color: (control.orientation === Qt.Vertical) ? "#bdbebf" : "#21be2b"
                radius: 2
            }
        }

        handle: Rectangle {
            id: indicator
            x: (control.orientation === Qt.Vertical) ? control.leftPadding + control.availableWidth / 2 - width / 2 : control.leftPadding + control.visualPosition * (control.availableWidth - width)
            y: (control.orientation === Qt.Vertical) ? control.topPadding + control.visualPosition * (control.availableHeight - height) : control.topPadding + control.availableHeight / 2 - height / 2
            implicitWidth: ((control.orientation === Qt.Vertical) && (!control.pressed)) ? 40 : 13
            implicitHeight: 13
            radius: 6.5
            color: control.pressed ? "#f0f0f0" : "#f6f6f6"
            border.color: "#bdbebf"

            Text {
                id: indicatorContent
                visible: (!control.pressed) && (control.orientation === Qt.Vertical)
                text: getText(control.value)
                font: uikit.fonts.header
                color: uikit.palette.btnFace
                anchors.fill: parent

                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        Rectangle {
            id: content
            z: parent.z + 1

            visible: control.pressed || (control.orientation === Qt.Horizontal)

            radius: 6.5

            width: 40
            height: 13

            x: (control.orientation === Qt.Vertical) ? indicator.x + indicator.implicitWidth : indicator.x - (width - indicator.width) / 2
            y: (control.orientation === Qt.Vertical) ? indicator.y : indicator.y + indicator.implicitHeight

            color: "#f6f6f6"

            Text {
                id: contentText
                text: getText(control.value)
                font: uikit.fonts.header
                color: uikit.palette.btnFace
                anchors.fill: parent

                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        onValueChanged: {
            current = value;
        }
    }

    Style.UiKit {
        id: uikit
    }
}
