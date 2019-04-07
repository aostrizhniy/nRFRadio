import QtQuick 2.9

Item {

    property alias roboto: fontRoboto.name
    property alias helvetica: fontHelvetica.name

    FontLoader {
        id: fontRoboto
        source: Qt.resolvedUrl("Roboto-Regular.ttf")
    }

    FontLoader {
        id: fontHelvetica
        source: Qt.resolvedUrl("HelveticaNeueRoman.otf")
    }
}
