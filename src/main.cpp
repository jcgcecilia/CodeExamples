#include <QtWidgets/QApplication>
#include <QtWidgets/QPushButton>


int main( int argc, char **argv )
{
    QApplication a( argc, argv );

    QPushButton hello( "Hello Viktor!", 0 );
    hello.resize( 500, 500 );

    hello.show();
    return a.exec();
}



