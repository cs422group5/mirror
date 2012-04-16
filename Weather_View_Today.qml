import QtQuick 1.0



Component {

    Item {
        id: wrapper; width: 290 ;height: 290

        Text { x: 180; y: 181; text: humidity; font.family: "Arial"; font.pixelSize: 15; elide: Text.ElideRight; color: "#ffffff"; style: Text.Raised; styleColor: "black" }

        Text { x: 180; y: 122; text: temp_f+"°F"; font.family: "Arial"; font.pixelSize: 15; elide: Text.ElideRight; color: "#ffffff"; style: Text.Raised; styleColor: "black" }

        Text { x: 180; y: 64; text: condition; font.family: "Arial"; color: "orange"; font.pixelSize: 15; font.bold: true; elide: Text.ElideRight; style: Text.Raised; styleColor: "black"

        }

        Rectangle {
            x: 24
            y: 64
            width: 150
            height:150
            color: "black";
            smooth: true

            Image {
                anchors.fill: parent
                source: weather_view.imageConstPath + icon;
            }

        }










    }
}
