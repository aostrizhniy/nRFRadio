import QtQuick 2.9
import QtQuick.Controls 2.3
import "../styles" as Style
import "../support" as Support

Item {
    id: root

    property int step: uikit.pins.default_step

    property int number: 1

    property string main: "NoName"

    property string alt: ""

    property bool select: false

    property bool selected: false

    property font itemFont: uikit.fonts.header2

    width: uikit.pins.getPinsWidth(step)
    height: uikit.pins.getPinsHeight(step)

    signal pinOn()

    signal pinOff()

    Row {
        id: row
        spacing: 2

        layoutDirection: (root.number % 2) ? Qt.RightToLeft : Qt.LeftToRight

        anchors.fill: parent

        Rectangle {
            width: step
            height: step
            radius: (number - 1) ? step / 2 : 0

            border {
                color: uikit.palette.btnFace
                width: 1
            }

            color: uikit.pins.getPinColor(root.select, root.selected, root.main)

            Rectangle {
                anchors.centerIn: parent

                width: step / 2
                height: step / 2
                radius: step / 4

                border {
                    color: uikit.palette.btnFace
                    width: 1
                }

                color: uikit.palette.verydarkgray
            }
        }

        Rectangle {
            height: step
            width: step

            border {
                color: uikit.palette.btnFace
                width: 1
            }

            color: uikit.pins.getColor(root.main)

            Text {
                id: pinNum
                text: root.number

                anchors.centerIn: parent

                font: itemFont
                width: contentWidth
                height: contentHeight

                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

                color: uikit.pins.getTextColor(parent.color)
            }
        }

        Rectangle {
            height: step
            width: (root.alt == "") ? 7 * step + uikit.pins.default_spacing : 3 * step

            border {
                color: uikit.palette.btnFace
                width: 1
            }

            color: uikit.pins.getColor(root.main)

            Text {
                id: pinName
                text: root.main

                anchors.centerIn: parent

                font: itemFont
                width: contentWidth
                height: contentHeight

                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

                color: uikit.pins.getTextColor(parent.color)
            }
        }

        Rectangle {
            height: step
            width: 4 * step
            visible: (root.alt !== "")
            border {
                color: uikit.palette.btnFace
                width: 1
            }

            color: uikit.palette.verydarkgray

            Text {
                id: altName
                text: root.alt

                anchors.centerIn: parent

                font: itemFont
                width: contentWidth
                height: contentHeight

                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

                color: uikit.palette.white
            }
        }


    }

    Rectangle {
        anchors.fill: parent

        z: row.z + 1

        visible: root.selected

        color: uikit.palette.upperPinHighlight

        MouseArea {
            id: rectArea

            enabled: (root.selected) && root.select

            anchors.fill: parent

            onClicked: {
                pinOff();
            }
        }
    }

    MouseArea {
        id: rowArea

        enabled: (!root.selected) && root.select

        anchors.fill: parent

        onClicked: {
            pinOn();
        }
    }

    Style.UiKit {
        id: uikit
    }

    Support.Support {
        id: support
    }
}
