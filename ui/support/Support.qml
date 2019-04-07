import QtQuick 2.9
import QtQuick.Controls 2.3

Item {

    /*!
      @brief addElement: динамическое добавление компонента в контейнер
      @param[in] url - путь к исходному компоненту
      @param[in] properties - свойства создаваемого компонента
      @param[in] target - контейнер
      @param[in] visibleStatus - bool значение видимости компонента по умолчанию
      @param[in] fill - bool компонент занимает весь контейнер

      @return компонент если все прошло успешно, null в противном случае
    */
    function addElement(url, properties, target, visibleStatus, fill) {
        var component = Qt.createComponent(url);
        var element = null;

        if (component.status === Component.Ready) {
            if (fill === true) {
                properties['anchors.fill'] = target;
            }

            properties['visible'] = visibleStatus;

            element = component.createObject(target, properties);
        }

        return element;
    }

    /*!
      @brief conditionPropertySet: установка свойства по условию
      @param[in] condition - условие
      @param[in] onTrue - значение при условии равном true
      @param[in] onFalse- значение при условии равном false

      @return onTrue || onFalse
    */
    function conditionPropertySet(condition, onTrue, onFalse) {
        return condition ? onTrue : onFalse;
    }

    /*!
      @brief installHighlight: подсветка элемента
      @param[in] hoverArea - MouseArea - перехватывающая события hovered
      @param[in] highlightColor - цвет подсветки
      @param[in] normalColor - цвет в нормальном состоянии

      @return highlightColor если мышь в области элемента
    */
    function installHighlight(hoverArea, highlightColor, normalColor) {
        return conditionPropertySet(hoverArea.containsMouse, highlightColor, normalColor);
    }
}
