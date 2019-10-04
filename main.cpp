#include "mylang.h"


#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QTranslator>
#include <QLocale>
//#include <QQmlEngine>
#include <QQmlContext>
#include <QQuickStyle>

#include "combobox_language.h"


int main(int argc, char *argv[])
{

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    qmlRegisterType<MyLang>("MyLang",0,1,"MyLang");

    QQuickStyle::setStyle("Material");

    combobox_language mTrans(&app);
//    QQuickView mViews;
//    mViews.engine()->rootContext()->setContextProperty("mytrans", (QObject*)&mTrans);
//    mViews.setSource(QUrl("qrc:/main.qml"));
//    mViews.show();
    QQmlApplicationEngine engine;


    engine.rootContext()->setContextProperty("Mytrans", (QObject*)&mTrans);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();

}
