import QtQuick 1.0
import "weather_func.js" as Wfunc
Component {
    id:weather_wiew_item
    Item {
        id: wrapper; width: wrapper.ListView.view.width; height: 56
        Item {
            id: moveMe

           Rectangle {
                x: 5;
                y: 5;
                width: 40;
                height:40;
                color: "black";
                smooth: true

                Image {
                    source: weather_view.imageConstPath + icon;
                    x: 0;
                    y: 0;
                    height:40
                    width:40
                }

            }

            Column {
                x: 80;
                y: 0; spacing: 2

            }


        }

        Text { x: 80; y: 32; text: condition; font.family: "Arial"; font.pixelSize: 12; elide: Text.ElideRight; color: "#ffffff"; style: Text.Raised; styleColor: "black" }

        Text { x: 80; y: 17; text:weather_view.temperature_f?Wfunc.ctof(low)+" - "+Wfunc.ctof(high):low+" - "+high; font.family: "Arial"; font.pixelSize: 12; elide: Text.ElideRight; color: "#ffffff"; style: Text.Raised; styleColor: "black" }

        Text { x: 80; y: 0; text: day_of_week; font.family: "Arial"; color: "orange"; font.pixelSize: 12; font.bold: true; elide: Text.ElideRight; style: Text.Raised; styleColor: "black"

        }








    }
}
