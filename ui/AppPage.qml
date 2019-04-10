import QtQuick 2.9
import QtQuick.Controls 2.3
import "styles" as Style
import "pages" as Pages
import "items" as Items

Page {
    id: appPage

    property Item radioPage: null

    function loadPages () {
        radioPage = pages.addPage(Qt.resolvedUrl("qrc:/pages/TestPage.qml"),
                                  {});
    }

    Component.onCompleted: {
        loadPages();
        pages.currentIndex = 0;
    }

    header: Rectangle {
        id: headers
        height: 50
        color: uikit.palette.verydarkgray

        Text {
            id: headtext

            font: uikit.fonts.headerMessage

            text: qsTr("Радиоуправление")

            color: uikit.palette.white

            anchors {
                centerIn: parent
            }
        }
    }

    Pages.PageContainer {
        id: pages

        anchors {
            margins: 20
            fill: parent
        }
    }

    Style.UiKit {
        id: uikit
    }
}
