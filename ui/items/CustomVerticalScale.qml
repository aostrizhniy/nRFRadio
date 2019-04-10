import QtQuick 2.9
import "../styles" as Style

Item {
    id: root

    property int tagCount: 3
    property real min: 0.0
    property real max: 1.0
    property string suffix: ""
    property real value: min

    function getOffset(waiting) {
        var d = (max + min) / 2;
        var multiplier = 0;
        if (waiting > d) {
            multiplier = (value - d) / (max - d);
            return -((root.height / 2) * multiplier);
        } else if (waiting < d) {
            multiplier = 1 - ((value - min) / (d - min));
            return (root.height * multiplier) / 2
        }
        return 0;
    }

    Column {
        id: column

        anchors.fill: parent

        spacing: (root.height - (tagCount*2)) / (tagCount - 1)

        Repeater {
            model: tagCount

            Rectangle {
                width: 10
                height: 2
                color: uikit.palette.verydarkgray;
            }
        }


    }

    Rectangle {
        id: tag

        width: 80
        height: 20

        radius: 10

        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
            verticalCenterOffset: getOffset(value)
        }

        z: parent.z + 1

        color: uikit.palette.dropShadow

        Text {
            id: valText
            text: value + " " + suffix;
            font: uikit.fonts.header

            anchors.fill: parent

            color: uikit.palette.btnFace

            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
    }

    Style.UiKit {
        id: uikit
    }
}

