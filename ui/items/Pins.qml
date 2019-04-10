import QtQuick 2.9
import QtQuick.Controls 2.3
import "../styles" as Style
import "../support" as Support

Item {
    id: root

    property bool locked: false

    property bool multiselect: false

    signal pinAdded (var name);
    signal pinRemoved (var name);

    function reset() {
        for (var index = 0; index !== model.count; index++) {
           if (model.get(index).selected === true) {
                model.set(index, {"selected": false});
           }
        }
    }

    function pinSet(number, state) {
        for (var index = 0; index != model.count; index++) {
            if ((model.get(index).pin === number) && (model.get(index).selected !== state)) {
                model.set(index, {"selected": state});
                if (!state) {
                    pinRemoved(model.get(index).main);
                }
                else {
                    pinAdded(model.get(index).main);
                }
            }

            if ((!multiselect)
                 &&(model.get(index).pin !== number)
                 &&(model.get(index).selected === true)) {
                model.set(index, {"selected": false});
                pinRemoved(model.get(index).main);
            }
        }
    }

    Component.onCompleted: {
        model.clear();
        for (var index = 0; index != uikit.pins.pintable.length; index++) {
            model.append({"pin": uikit.pins.pintable[index].pin,
                          "main": uikit.pins.pintable[index].main,
                          "select": uikit.pins.pintable[index].select,
                          "alt": uikit.pins.pintable[index].alt,
                          "selected": false
                         });
        }
    }

    GridView {
        id: view

        interactive: false

        cellWidth: uikit.pins.getPinsWidth(uikit.pins.default_step)
        cellHeight: uikit.pins.getPinsHeight(uikit.pins.default_step)
        width: 2 * cellWidth

        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
        }

        height: parent.height

        model: model

        delegate: Pin {
            id: pinItem
            number: model.pin
            main: model.main
            select: model.select
            alt: model.alt
            selected: model.selected

            onPinOn: {
                if (!root.locked) {
                    pinSet(model.pin, true);
                }
            }

            onPinOff: {
                if (!root.locked) {
                    pinSet(model.pin, false);
                }
            }
        }
    }

    ListModel {
        id: model
        dynamicRoles: true
    }

    Style.UiKit {
        id: uikit
    }

    Support.Support {
        id: support
    }
}
