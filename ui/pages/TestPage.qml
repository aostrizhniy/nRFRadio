import QtQuick 2.9
import QtQuick.Controls 2.3
import "../items" as Items
import "../styles" as Style

Row {
    id: root

    property Item holdPage: null

    anchors {
        fill: parent
    }

    spacing: 20

    Component.onCompleted: {
        holdPage = container.addPage(Qt.resolvedUrl("qrc:/pages/TriggerPage.qml"), {"multiselect": true});
        container.currentIndex = 0;
    }

    Rectangle {
        id: modeBlock

        width: 0.2 * parent.width
        height: parent.height

        color: uikit.palette.dropShadow

        Text {
            id: modeText

            font: uikit.fonts.header3
            text: qsTr("Mode")

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

        Items.CustomSlider {
            id: modeSlider
            orientation: Qt.Vertical

            anchors {
                horizontalCenter: parent.horizontalCenter
                horizontalCenterOffset: - modeText.contentWidth / 2
                bottom: parent.bottom
            }

            width: 80
            height: parent.height - modeText.height - 5;
            values: ["Pulse", "Trigger", "Hold", "Linear"]
            current: 0
        }

        Items.CustomLegend {
            id: legend

            values: modeSlider.values

            current: modeSlider.current

            anchors {
                right: parent.right
                verticalCenter: modeSlider.verticalCenter
            }

            height: modeSlider.height
            width: 60
        }
    }

    Rectangle {
        id: controlBlock

        width: 0.8 * parent.width - 20
        height: parent.height

        color: uikit.palette.dropShadow

        PageContainer {
            id: container

            anchors {
                fill: parent
                margins: 10
            }
        }
    }

    Style.UiKit {
        id: uikit
    }
}
