#ifndef DBMANAGER_H
#define DBMANAGER_H

#include <QObject>
#include <QSqlDatabase>
#include <QDir>
#include <QQmlApplicationEngine>

#define RAND_ID_LENGTH  32

typedef enum
{
    UStatus_Disabled = 0,
    UStatus_Enabled = 1,
    UStatus_Blocked = 2
}   eUStatus;

class DBManager : public QObject
{
    Q_OBJECT
public:
    explicit DBManager(QQmlApplicationEngine *engine, QObject *parent = nullptr);
    ~DBManager();

private:
    /* Database management */
    bool    initDB();
    bool    createUser(QString uname, QString upass, QString phone, QString email);
    bool    createTank(QString name, int type, int l, int w, int h);
    bool    isUserExist();
    bool    isTankExist();
    QString randId();

private:
    /* Gui methods */
    void    setInitialDialogStage(int stage, QString name);

signals:

public slots:
    void    onGuiUserCreate(QString uname, QString upass, QString email);
    void    onGuiTankCreate(QString name, int type, int l, int w, int h);

public:
    const QString   dbFolder = "db";
    const QString   dbFile = "db.db";

private:
    QString         dbFileLink;
    QSqlDatabase    db;

    QString         curUserName;

private:
    QQmlApplicationEngine   *qmlEngine = nullptr;
};

#endif // DBMANAGER_H