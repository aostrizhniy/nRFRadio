import QtQuick 2.9
import QtQuick.Controls 2.3
import "../styles" as Style
import "../support" as Support

Switch {
      id: control
      text: qsTr("Switch")

      indicator: Rectangle {
          implicitWidth: 48
          implicitHeight: 26
          x: control.leftPadding
          y: parent.height / 2 - height / 2
          radius: 13
          color: control.checked ? "#17a81a" : uikit.palette.headerError
          border.color: control.checked ? "#17a81a" : "#cccccc"

          Rectangle {
              x: control.checked ? parent.width - width : 0
              width: 26
              height: 26
              radius: 13
              color: control.down ? "#cccccc" : "#ffffff"
              border.color: control.checked ? (control.down ? "#17a81a" : "#21be2b") : "#999999"
          }
      }

      contentItem: Text {
          text: control.text
          font: control.font
          opacity: enabled ? 1.0 : 0.3
          color: uikit.palette.verticalCenter
          verticalAlignment: Text.AlignVCenter
          leftPadding: control.indicator.width + control.spacing
      }

      Style.UiKit {
          id: uikit
      }

      Support.Support {
          id: support
      }
  }
