import QtQuick 2.9
import QtQuick.Controls 2.3
import "../items" as Items
import "../styles" as Style
import "../support" as Support

Rectangle {
    id: root

    anchors.fill: parent

    color: uikit.palette.transparent

    property int pinActivated: -1

    property bool holdPressed: false

    property string pinNameStr: "Not defined"

    function installPins() {
        for (var index = 0; index != uikit.pins.pintable.length; index++) {
            if (uikit.pins.pintable[index].select === true) {
                pinModel.append({"text": uikit.pins.pintable[index].main, "pin": uikit.pins.pintable[index].pin});
            }
        }

        pins.currentIndex = 0;
    }

    function pinAdd (name) {
        if (name !== pinNameStr) {
            pinNameStr = name;
        }
    }

    function pinRemove (name) {
        if (pinNameStr === name) {
            pinNameStr = "Not defined";
        }
    }

    Component.onCompleted: {

    }

    Row {
        id: controlPanel

        spacing: 20

        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }

        height: Math.max(holdButton.height, gpioLabel.height, holdButton.height);

        Rectangle {
            id: holdButton

            width: 100
            height: 20

            radius: 10

            color: support.installHighlight(holdButtonArea, uikit.palette.stdButtonFaceHighlited, uikit.palette.stdButtonFace)
            Text {
                id: holdText

                font: uikit.fonts.header2

                text: qsTr("Hold")

                anchors.fill: parent

                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

                color: support.installHighlight(holdButtonArea, uikit.palette.btnFaceHighlited, uikit.palette.btnFace)
            }

            MouseArea {
                id: holdButtonArea

                hoverEnabled: true

                anchors.fill: parent

                onPressed: {
                    if (mouse.button === Qt.LeftButton) {
                        holdPressed = true;
                    }
                }

                onReleased: {
                    if (mouse.button === Qt.LeftButton) {
                        holdPressed = false;
                    }
                }
            }
        }
        Text {
            id: gpioLabel

            font: uikit.fonts.header3

            text: qsTr("GPIO_PIN:")

            anchors.verticalCenter: holdButton.verticalCenter

            width: contentWidth
            height: contentHeight

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

            color: uikit.palette.verydarkgray
        }

        Rectangle {
            id: selectedPin

            anchors.verticalCenter: holdButton.verticalCenter

            width: 200

            height: Math.max(holdButton.height, gpioLabel.height)

            radius: height / 2

            color: uikit.palette.headerError

            Text {
                id: selectedPinName
                text: root.pinNameStr

                anchors.fill: parent

                font: uikit.fonts.header2

                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

                color: uikit.palette.verydarkgray
            }
        }
    }

    Items.Pins {
        id: pinsView

        anchors {
            left: parent.left
            right: parent.right
            top: controlPanel.bottom
            topMargin: 10
        }

        height: 0.9 * parent.height

        locked: root.holdPressed

        selectUnique: true

        onPinAdded: {
            pinAdd(name);
        }

        onPinRemoved: {
            pinRemove(name);
        }
    }

    ListModel {
        id: pinModel
    }

    Style.UiKit {
        id: uikit
    }

    Support.Support {
        id: support
    }
}
