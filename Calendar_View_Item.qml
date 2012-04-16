// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: rectangle1
    width: 420
    height: 30
    color: theType==1?"#444444":"#00000000"
    property int theType: 0
    property alias theText: inner_text.text
    Text {
        id: inner_text
        x: 28
        y: 5
        width: 364
        height: 20
        color: "#ffffff"
        text: qsTr("inner_text")
        horizontalAlignment: Text.AlignHCenter
        font.family: "Arial"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 17
    }
}
