#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "Converter.h"

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    Converter obj;
    engine.rootContext()->setContextProperty("converter", &obj);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
