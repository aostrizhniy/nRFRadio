import QtQuick 2.9
import QtQuick.Controls 2.3
import "styles" as Style

ApplicationWindow {
    id: window

    width: uikit.appOptions.winWidth
    height: uikit.appOptions.winHeight
    flags: uikit.appOptions.appWindowFlags

    visible: true

    color: uikit.palette.white

    AppPage {
        id: content

        anchors {
            centerIn: parent
        }

        width: parent.width
        height: parent.height

        focus: true

        Keys.onPressed: {
            if (event.key === Qt.Key_Escape) {
                window.close();
            }
        }
    }

    Style.UiKit {
        id: uikit
    }
}
