#ifndef HELPER_H
#define HELPER_H

#include <QObject>

class Helper : public QObject
{
    Q_OBJECT
public:
    explicit Helper(QObject *parent = nullptr);

signals:

public slots:
    int randboxvalue();
    int randmaxvalue();
};

#endif // HELPER_H
