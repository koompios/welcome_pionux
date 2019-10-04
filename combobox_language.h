#ifndef COMBOBOX_LANGUAGE_H
#define COMBOBOX_LANGUAGE_H

#include <QObject>
#include <QGuiApplication>
#include <QQuickView>
#include <QTranslator>
#include "mylang.h"
#include <QDebug>


class combobox_language : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString emptyString READ getEmptyString NOTIFY languageChanged)

public:

    combobox_language(QGuiApplication* app){ mApp = app ;}
    QString getEmptyString(){return "";}

signals:
   void languageChanged();

public slots:
    void updateLanguage(int lang){
        switch(lang){
//            case mylang::ENG:
//             qDebug()<<"read Eng";
//             mTranslator.load("welcome",":/lang");
//             mApp->installTranslator(&mTranslator);

//            break;
        case MyLang::KH:


            if(mTranslator.load("welcome_kh",":/lang")){
                qDebug()<<"read Kh";
                mApp->installTranslator(&mTranslator);
               }
            else{
                qDebug()<<"read KH fail";
            }




            break;
        case MyLang::FR:
            qDebug() << "changed FR"<<endl;
           if( mTranslator.load("welcome_fr",":/lang")){
             qDebug()<<"read FR";
            if( mApp->installTranslator(&mTranslator)){
                qDebug()<< "translate Fr success";
            }
            else{
                qDebug() << "Fail translate";
            }
           }
           else{
               qDebug()<<"read FR failed";
           }
//         mTranslator.load("welcome_fr",":/lang");
        break;
        default:
            mApp->removeTranslator(&mTranslator);
            break;

        }
        qDebug()<<"emit language change";
        emit languageChanged();

    }


private:

    QGuiApplication* mApp;
    QTranslator mTranslator;
};

#endif // COMBOBOX_LANGUAGE_H
