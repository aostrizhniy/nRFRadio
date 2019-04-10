import QtQuick 2.9
import "../fonts" as Fonts

Item {
    id: uikit

    property alias fonts: fonts
    property alias palette: colors
    property alias appOptions: appOpts
    property alias pins: pins

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
            pointSize: 8,
            bold: false
        })

        property font header1: Qt.font({
            family: fontloader.roboto,
            pointSize: 13,
            bold: false
        })

        property font header2: Qt.font({
            family: fontloader.roboto,
            pointSize: 10,
            bold: false
        })

        property font header3: Qt.font({
            family: fontloader.roboto,
            pointSize: 15,
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
        property color orange: "#FF7F00"
        property color yellow: "#FFFF40"
        property color red: "#FF1E00"
        property color bluePinSelected: "#644AD8"
        property color upperPinHighlight: Qt.rgba(0.95, 0.0, 0.0, 0.3 )
    }

    Item {
        id: pins

        property string val_5v: "5v"
        property string val_3v3: "3v3"
        property string gnd: "GND"
        property string nc: "DNC"
        property string gpio: "GPIO"

        property int default_step: 15
        property int default_spacing: 2

        function getPinsWidth(val) {
            return 9 * val + 3 * default_spacing;
        }

        function getPinsHeight(val) {
            return val + default_spacing;
        }

        property var pintable: [
            {pin: 1, main: val_3v3, select: false, alt: ""},
            {pin: 2, main: val_5v, select: false, alt: ""},
            {pin: 3, main: "GPIO2", select: true, alt: "SDA1"},
            {pin: 4, main: val_5v, select: false, alt: ""},
            {pin: 5, main: "GPIO3", select: true, alt: "SCL1"},
            {pin: 6, main: gnd, select: false, alt: ""},
            {pin: 7, main: "GPIO4", select: true, alt: "GPCLK0"},
            {pin: 8, main: "GPIO14", select: true, alt: "TXD"},
            {pin: 9, main: gnd, select: false, alt: ""},
            {pin: 10, main: "GPIO15", select: true, alt: "RXD"},
            {pin: 11, main: "GPIO17", select: true, alt: "CE1_1"},
            {pin: 12, main: "GPIO18", select: true, alt: "CE0_1/PWM0"},
            {pin: 13, main: "GPIO27", select: true, alt: ""},
            {pin: 14, main: gnd, select: false, alt: ""},
            {pin: 15, main: "GPIO22", select: true, alt: ""},
            {pin: 16, main: "GPIO23", select: true, alt: ""},
            {pin: 17, main: val_3v3, select: false, alt: ""},
            {pin: 18, main: "GPIO24", select: true, alt: ""},
            {pin: 19, main: "GPIO10", select: true, alt: "MOSI_0"},
            {pin: 20, main: gnd, select: false, alt: ""},
            {pin: 21, main: "GPIO9", select: true, alt: "MISO_0"},
            {pin: 22, main: "GPIO25", select: true, alt: ""},
            {pin: 23, main: "GPIO11", select: true, alt: "SCLK_0"},
            {pin: 24, main: "GPIO8", select: true, alt: "CE0_0"},
            {pin: 25, main: gnd, select: false, alt: ""},
            {pin: 26, main: "GPIO7", select: true, alt: "CE1_0"},
            {pin: 27, main: nc, select: false, alt: ""},
            {pin: 28, main: nc, select: false, alt: ""},
            {pin: 29, main: "GPIO5", select: true, alt: "GPCLK1"},
            {pin: 30, main: gnd, select: false, alt: ""},
            {pin: 31, main: "GPIO6", select: true, alt: "GPCLK_2"},
            {pin: 32, main: "GPIO12", select: true, alt: "PWM0"},
            {pin: 33, main: "GPIO13", select: true, alt: "PWM1"},
            {pin: 34, main: gnd, select: false, alt: ""},
            {pin: 35, main: "GPIO19", select: true, alt: "PWM1/MISO_1"},
            {pin: 36, main: "GPIO16", select: true, alt: "CE2_1"},
            {pin: 37, main: "GPIO26", select: true, alt: ""},
            {pin: 38, main: "GPIO20", select: true, alt: "MOSI_1"},
            {pin: 39, main: gnd, select: false, alt: ""},
            {pin: 40, main: "GPIO21", select: true, alt: "SCLK_1"}
        ]

        property var pinPallette: [
            {key: val_5v, value: uikit.palette.red},
            {key: val_3v3, value: uikit.palette.orange},
            {key: gnd, value: uikit.palette.verydarkgray},
            {key: gpio, value: uikit.palette.yellow}
        ]

        function getColor(strValue) {
            var mstr = strValue;
            mstr = mstr.replace(/\d/gm, "");
            var retV = uikit.palette.verydarkgray;

            for (var index = 0; index != pinPallette.length; index++) {
                if ((pinPallette[index].key === mstr) || (pinPallette[index].key === strValue)) {
                    retV = pinPallette[index].value;
                }
            }

            return retV;
        }

        function getTextColor(bckgColor) {
            return (bckgColor === uikit.palette.verydarkgray) ? uikit.palette.white : uikit.palette.black;
        }

        function getPinColor(checkable, checked, strValue) {
            var retColor = uikit.palette.white;

            if (!checkable) {
                retColor = getColor(strValue);
            }

            if (checked) {
                retColor = uikit.palette.bluePinSelected;
            }

            return retColor;
        }
    }
}
