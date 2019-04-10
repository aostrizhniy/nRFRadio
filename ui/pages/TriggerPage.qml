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

    property alias multiselect: pinsView.multiselect

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

        height: Math.max(pinToggle.height, gpioLabel.height, holdButton.height);

        Items.CustomSwitch {
            id: pinToggle

            width: 100
            height: 20

            text: qsTr("PinEdit");

            font: uikit.fonts.header3
        }

        Text {
            id: gpioLabel

            font: uikit.fonts.header3

            visible: !multiselect

            text: qsTr("GPIO_PIN:")

            anchors.verticalCenter: pinToggle.verticalCenter

            width: contentWidth
            height: contentHeight

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

            color: uikit.palette.verydarkgray
        }

        Rectangle {
            id: selectedPin

            visible: !multiselect

            anchors.verticalCenter: pinToggle.verticalCenter

            width: 80 - radius

            height: Math.max(pinToggle.height, gpioLabel.height)

            radius: height / 2

            color: uikit.palette.headerError

            Text {
                id: selectedPinName
                text: root.pinNameStr

                anchors.fill: parent

                font: uikit.fonts.header2

                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

                color: uikit.palette.white
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

        locked: !pinToggle.checked

        multiselect: false

        onPinAdded: {
            if (!pinsView.multiselect) {
                pinAdd(name);
            }
        }

        onPinRemoved: {
            if (!pinsView.multiselect) {
                pinRemove(name);
            }
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
