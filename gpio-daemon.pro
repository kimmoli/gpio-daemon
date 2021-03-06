TARGET = gpio-daemon

QT += dbus
QT -= gui

DEFINES += "APPVERSION=\\\"$${SPECVERSION}\\\""

target.path = /usr/sbin/

systemd.path = /etc/systemd/system/
systemd.files = config/$${TARGET}.service
dbus.path = /etc/dbus-1/system.d/
dbus.files = config/$${TARGET}.conf

INSTALLS += target systemd dbus

message($${INSTALLS})
message($${DEFINES})

INCLUDEPATH += ./inc

SOURCES += \
    src/toh.cpp \
    src/worker.cpp \
    src/gpio-daemon.cpp \
    src/gpio.cpp

HEADERS += \
    inc/toh.h \
    inc/worker.h \
    inc/gpio-daemon.h \
    inc/gpio.h

OTHER_FILES += \
    rpm/gpio-daemon.spec \
    config/gpio-daemon.service \
    config/gpio-daemon.conf
