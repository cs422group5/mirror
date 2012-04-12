// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id:calendar_view
    width: 520
    height: 290
    color: "#00000000"
    radius: 10
    Button1 {
        id: button11
        x: 118
        y: 275
        width: 39
        height: 39
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 6
        btnText: "W"
    }

    Button1 {
        id: button12
        x: 61
        y: 275
        width: 39
        height: 39
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 6
        btnText: "D"
    }

    Button1 {
        id: button13
        x: 175
        y: 275
        width: 39
        height: 39
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 6
        btnText: "M"
    }

    Button1 {
        id: button14
        x: 233
        y: 275
        width: 39
        height: 39
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 6
        btnText: "4D"
    }

    Button1 {
        id: button15
        x: 290
        y: 275
        width: 39
        height: 39
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 6
        btnText: "A"
    }

    Button1 {
        id: button16
        x: 391
        y: 265
        width: 82
        height: 49
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 6
        btnText: "Options"
    }
}
