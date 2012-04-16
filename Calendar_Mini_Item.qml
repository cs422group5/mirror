// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id:calendar_mini_item;
    width:198
    height:45
    color: "#00000000"
    property alias theTimeFrom: time_from.text
    property alias theTimeTo: time_to.text
    property alias theJobs: jobs.text
    property alias isVisible : calendar_mini_item.visible

    Text {
        id: time_from
        x: 5
        y: 4
        width: 44
        height: 17
        color: "#ffffff"
        text: qsTr("12:00")
        font.bold: true
        font.family: "Arial"
        font.pixelSize: 15
    }

    Text {
        id: time_link
        x: 43
        y: 5
        width: 12
        height: 12
        color: "#ffffff"
        text: qsTr("-")
        font.bold: true
        font.family: "Arial"
        font.pixelSize: 12
    }

    Text {
        id: time_to
        x: 51
        y: 4
        width: 44
        height: 17
        color: "#ffffff"
        text: qsTr("18:00")
        font.bold: true
        font.family: "Arial"
        font.pixelSize: 15
    }

    Text {
        id: jobs
        x: 94
        y: 24
        width: 88
        height: 17
        color: "#ffffff"
        text: qsTr("class")
        font.bold: true
        font.family: "Arial"
        font.pixelSize: 15
    }
}
