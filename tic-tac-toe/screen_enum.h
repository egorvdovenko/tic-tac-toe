#ifndef SCREEN_ENUM_H
#define SCREEN_ENUM_H

#include <QObject>
#include <QtGlobal>
#include <QQmlEngine>

class Screen_Enum : public QObject
{ 
    Q_OBJECT
public:
    enum Screen {
        START = 1,
        SELECTION = 2,
        GAME = 3,
        FINISH = 4
    };
    Q_ENUMS(Screen)

    static void declareQML() {
        qmlRegisterType<Screen_Enum>("MyQMLEnums", 1, 0, "ScreenEnum");
    }
};

#endif // SCREEN_ENUM_H
