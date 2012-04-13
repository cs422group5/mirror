// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id:weather_view
    width: 520
    height: 290
    color: "#00000000"
    property string city : "chicago"
    property string imageConstPath: "http://www.google.com"
    ListView {

         id: list
         y:0
         width: 200
         height: 227
         x:0

         anchors.right: parent.right
         anchors.rightMargin: 0
         model: weather4dayModel
         delegate: Weather_View_Item {

         }
    }
    XmlListModel {
        id: weather4dayModel

        source: "http://www.google.com/ig/api?weather=" +weather_view.city//"http://free.worldweatheronline.com/feed/weather.ashx?q="+chicago+"&format=xml&num_of_days=5&key=c789b90265135231121204"
        query: "/xml_api_reply/weather/forecast_conditions"


        XmlRole { name: "day_of_week"; query: "day_of_week/@data/string()" }
        XmlRole { name: "low"; query: "low/@data/string()" }
        XmlRole { name: "high"; query: "high/@data/string()" }
        XmlRole { name: "icon"; query: "icon/@data/string()" }
        XmlRole { name: "condition"; query: "condition/@data/string()" }
        onStatusChanged:{
            if(weather4dayModel.count>0){
                texth.text=weather4dayModel.get(0).high+"°C";
                textl.text=weather4dayModel.get(0).low+"°C";
            }
        }

    }

    XmlListModel {
        id: weathertodayModel
        source: "http://www.google.com/ig/api?weather=" +weather_view.city//"http://free.worldweatheronline.com/feed/weather.ashx?q="+chicago+"&format=xml&num_of_days=5&key=c789b90265135231121204"
        query: "/xml_api_reply/weather/current_conditions"
        XmlRole { name: "condition"; query: "condition/@data/string()" }
        XmlRole { name: "temp_f"; query: "temp_f/@data/string()" }
        XmlRole { name: "temp_c"; query: "temp_c/@data/string()" }
        XmlRole { name: "icon"; query: "icon/@data/string()" }
        XmlRole { name: "humidity"; query: "humidity/@data/string()" }
        onStatusChanged:{
            if(weathertodayModel.count>0){
                image1.source=weather_view.imageConstPath + weathertodayModel.get(0).icon;
                text1.text=weathertodayModel.get(0).temp_c+"°C";
            }
        }
        //Component.onCompleted: console.log(weathertodayModel);
    }
/*
    ListView {

         id: todayWeather
         y:0
         width: 250
         x:26
         height: parent.height
         anchors.right: parent.right
         anchors.rightMargin: 244
         model: weathertodayModel
         delegate: Weather_View_Today {

         }
    }*/



    Button1 {
        id: button11
        x: 442
        y: 236
        btnText: "F"
    }

    Image {
        id: image1
        x: 26
        y: 34
        width: 160
        height: 160
    }

    Text {
        id: text1
        x: 211
        y: 46
        width: 89
        height: 36
        color: "#ffffff"
        font.family: "Arial"
        font.pixelSize: 32
    }

    Text {
        id: text2
        x: 211
        y: 102
        width: 34
        height: 24
        color: "#ffffff"
        text: qsTr("H:")
        font.family: "Arial"
        font.pixelSize: 22
    }

    Text {
        id: text3
        x: 211
        y: 147
        width: 34
        height: 24
        color: "#ffffff"
        text: qsTr("L:")
        font.pixelSize: 22
        font.family: "Arial"
    }

    Text {
        id: texth
        x: 245
        y: 102
        width: 55
        height: 24
        color: "#ffffff"
        font.pixelSize: 22
        font.family: "Arial"
    }

    Text {
        id: textl
        x: 245
        y: 147
        width: 55
        height: 24
        color: "#ffffff"
        font.pixelSize: 22
        font.family: "Arial"
    }

}
