import QtQuick 2.9
import QtQuick.Controls 2.4
import "../styles" as Style

Item {
    id: root

    property alias header: textString.text
    property alias from: control.from
    property alias to: control.to
    property alias value: control.value
    property alias step: control.stepSize
    property alias suffix: scale.suffix

    anchors {
        fill: parent
    }

    Text {
        id: textString

        font: uikit.fonts.headerMessage

        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }

        height: contentHeight

        color: uikit.palette.verydarkgray

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
    }

    Slider {
        id: control

        orientation: Qt.Vertical

        snapMode: Slider.SnapAlways

        anchors {
            horizontalCenter: parent.horizontalCenter
            horizontalCenterOffset: -textString.contentWidth / 2 + control.handle.width / 2
            bottom: parent.bottom
        }

        width: control.handle.width
        height: parent.height - textString.height - 5;
    }

    CustomVerticalScale {
        id: scale
        tagCount: 4

        anchors {
            left: control.right
            leftMargin: 5
            verticalCenter: control.verticalCenter
        }

        min: control.from
        max: control.to
        value: control.value
        height: control.background.height - control.handle.height
        width: 50
    }

    Style.UiKit {
        id: uikit
    }
}
