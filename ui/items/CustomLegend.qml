import QtQuick 2.9
import QtQuick.Controls 2.4
import "../styles" as Style

Item {
    id: root

    property var values: []
    property int current: 0

    Component.onCompleted: {
        var invIndex = 0;
        for (var index = values.length - 1; index != -1;index--) {
            viewModel.append({text: values[index]});
        }

        view.spacing = (root.height - viewModel.count * 20) / (viewModel.count - 1);
    }

    ListView {
        id: view

        anchors.centerIn: parent

        width: parent.width
        height: parent.height

        orientation: Qt.Vertical

        interactive: false

        model: viewModel

        delegate: Rectangle {
            id: item

            width: parent.width
            height: 20

            color: (model.index === (values.length - root.current - 1)) ? uikit.palette.verydarkgray : uikit.palette.transparent

            Text {
                id: itemContent

                anchors.fill: parent

                font: uikit.fonts.header2

                text: model.text

                color: uikit.palette.white

                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }

    ListModel {
        id: viewModel
    }

    Style.UiKit {
        id: uikit
    }
}
