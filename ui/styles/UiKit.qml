import QtQuick 2.9
import "../fonts" as Fonts

Item {
    id: uikit

    property alias fonts: fonts
    property alias palette: colors
    property alias appOptions: appOpts

    Fonts.Fonts {
        id: fontloader
    }

    Item {
        id: appOpts

        property int winWidth: 800
        property int winHeight: 480
        property int appWindowFlags: Qt.FramelessWindowHint
    }

    Item {
        id: fonts

        property font header: Qt.font({
            family: fontloader.roboto,
            pointSize: 13,
            bold: false
        })

        property font headerMessage: Qt.font({
            family: fontloader.roboto,
            pointSize: 30,
            bold: true
        })

        property font input: Qt.font({
            family: fontloader.roboto,
            pointSize: 36,
            bold: true
        })

        property font button: Qt.font({
            family: fontloader.roboto,
            pointSize: 18,
            bold: true
        })

        property font kbdButton: Qt.font({
            family: fontloader.roboto,
            pointSize: 20,
            bold: false,
            weight: Font.Light
        })
    }

    Item {
        id: colors

        property color black: "#000000"
        property color verydarkgray: "#262626"
        property color white: "#ffffff"
        property color stdButtonFace: "#f5f5f5"
        property color stdButtonFaceHighlited: "#858585"
        property color crossRed: "#EB5757"
        property color btnFace: "#167575"
        property color btnFaceHighlited: "#96F5F5"
        property color headerError: "#9C2525"
        property color dropShadow: Qt.rgba(0, 0, 0, 0.19)
        property color transparent: "transparent"
    }
}
