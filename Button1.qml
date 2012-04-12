// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: rectangle1
    width: 48
    height: 48
    color: "#000000"
    radius: 10
    border.width: 2
    border.color: "#ffffff"
    smooth: true
    property alias btnText: text1.text
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
        onClicked: btn_clicked()
    }
    function btn_clicked(){
        console.log('btn '+text1.text+' clicked');
    }
}
