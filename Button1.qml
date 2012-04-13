// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: button1
    width: 48
    height: 48
    color: "#000000"
    radius: 10
    border.width: 2
    border.color: "#ffffff"
    smooth: true
    property alias btnText: text1.text
    signal clicked()
    Text {
        id: text1
        x: 13
        y: 19
        color: "#ffffff"
        text: qsTr("text")
        font.bold: true
        font.family: "Arial"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 18
    }

    MouseArea {
        id: mouse_area1
        anchors.fill: parent
        onClicked: button1.clicked()
    }
}
