// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
Rectangle {
    id:clock_item_view
    width: 500
    height: 30
    color: clock_item_view.selected?"#222222":"#000000";
    property alias city: name.text
    property real offset:0
    property bool selected:false
    signal clicked(string cityname);
    Text {
        id: name
        x: 77
        y: 6
        width: 46
        height: 18
        color: "#ffffff"
        text: qsTr("text")
        font.family: "Arial"
        font.bold: true
        font.pixelSize: 15
    }

    Text {
        id: time
        x: 305
        y: 6
        width: 249
        height: 18
        color: "#ffffff"
        text: showtime(clock_item_view.offset);
        font.bold: true
        font.family: "Arial"
        font.pixelSize: 15
    }

    Text {
        id: name1
        x: 40
        y: 6
        width: 46
        height: 18
        color: "#ffffff"
        text: qsTr("City:")
        font.pixelSize: 15
        font.bold: true
        font.family: "Arial"
    }

    Text {
        id: time1
        x: 261
        y: 6
        width: 75
        height: 18
        color: "#ffffff"
        text: qsTr("Time:")
        font.pixelSize: 15
        font.family: "Arial"
        font.bold: true
    }

    MouseArea {
        id: mouse_area1
        anchors.fill: parent
        onClicked: {
            clock_item_view.clicked(clock_item_view.city);
        }
    }

    function showtime(offset){
        var d = new Date();
        var utc = d.getTime() + (d.getTimezoneOffset() * 60000);
        var nd = new Date(utc + (1000*offset));
        var hours = nd.getHours();
        if (hours < 12){
            var night = "AM";
        }
        else{
            var night = "PM";
        }
        if (hours == 0){
            hours = 12;
        }
        else if (hours >12){
            hours = hours-12;
        }

        var minutes = nd.getMinutes();
        var stringmin = "" + minutes;
        if (minutes < 10){
            stringmin = "0" + stringmin;
        }
        var fulldate = nd.toDateString();
        fulldate = fulldate.slice(0,fulldate.length-4);
        return "" + fulldate  + hours + ":" + stringmin + " "+ night;
    }
}
