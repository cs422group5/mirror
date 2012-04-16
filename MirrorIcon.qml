// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    property alias text: iconText.text
    width: 40
    height: 40
    radius: 5
    color:"#000"
    Rectangle{
        radius:5
        color:"#000"
        width: parent.width
        height:parent.height-10
    }
    Rectangle{
        color:"#000"
        y:30
        radius:5
        width: parent.width
        height:parent.height-30
        Text {
            id: iconText
            anchors.centerIn: parent
            color:"#fff"
        }
    }
}
