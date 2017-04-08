/*
 * TestObjectClass.h
 *
 *  Created on: Apr 7, 2017
 *      Author: jgc
 */

#ifndef SRC_TESTOBJECTCLASS_H_
#define SRC_TESTOBJECTCLASS_H_

#include <QtCore/qobject.h>

class TestObjectClass: public QObject {
	Q_OBJECT
public:
	TestObjectClass();
	virtual ~TestObjectClass();

signals:
	void Finished();

private slots:
	void Done();
};

#endif /* SRC_TESTOBJECTCLASS_H_ */
