/*!
  Базовые настройки для тестирования UI/UX
*/

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QObject>
#include <QDebug>
#include <QQmlContext>

int main (int argc, char** argv) {
    QGuiApplication::setApplicationName(QObject::tr("Терминал"));
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QStringList options = QCoreApplication::arguments();

    QQmlApplicationEngine engine;

    engine.load(QUrl("qrc:/MainWindow.qml"));

    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    return app.exec();
}
