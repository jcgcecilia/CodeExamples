#include <QtWidgets/QApplication>
#include <QtWidgets/QPushButton>
#include <QtCore/QObject>
#include "TestObjectClass.h"

int main( int argc, char **argv )
{
    QApplication a( argc, argv );
    TestObjectClass obj;
    QPushButton hello( "Hello Viktor!", 0 );
    hello.resize( 500, 500 );

    hello.show();
    return a.exec();
}




