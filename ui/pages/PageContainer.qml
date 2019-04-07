import QtQuick 2.9
import QtQuick.Controls 2.3
import "../support" as Support

FocusScope {
    id: pagesContainer

    property var pages: {0: null}
    property int currentIndex: -1
    property Item currentItem: null
    property int count: 0

    antialiasing: true

    function addPage(pageUrl, properties) {
        var page = support.addElement(pageUrl, properties, content, false, true);

        if (page !== null) {
            pages[count] = page;
            count++;
        }

        return page;
    }

    onCurrentIndexChanged: {
        if (currentItem !== null) {
            currentItem.visible = false;
        }

        currentItem = pages[currentIndex];
        currentItem.visible = true;
    }

    Item {
        id: content

        anchors.fill: parent
    }

    Support.Support {
        id:support
    }
}
