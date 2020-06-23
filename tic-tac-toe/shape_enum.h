#ifndef SHAPE_ENUM_H
#define SHAPE_ENUM_H

#include <QObject>
#include <QtGlobal>
#include <QQmlEngine>

class Shape_Enum : public QObject
{
    Q_OBJECT
public:
    enum class Shape {
        CROSS = 1,
        CIRCLE = 2
    };
    Q_ENUMS(Shape)

    static void declareQML() {
        qmlRegisterType<Shape_Enum>("MyQMLEnums", 1, 0, "ShapeEnum");
    }
};

#endif // SHAPE_ENUM_H
