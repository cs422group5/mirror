// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "request.js" as HTTP
import "mirrorjs.js" as Handler
Item{
    property alias symbol: symbol.text
    property real change
    property real value
    property string company
    property string low
    property string high
    property string market
    property string closed
    property string open
    height: 20
    width:160
    Text{
        id: symbol
        color: "#fff"
        font.pixelSize: 12
    }
    Text{
        x: 50
        text: value
        color: "#fff"
        font.pixelSize: 12
    }
    Rectangle{
        x: 100
        width:50
        height:15
        color:if(change > 0)"#009900"
              else "#990000"
        radius:4
        Text{
            x: if(change > 0)5
                else 8
            text: if(change > 0)"+"+change
                  else change
            font.pixelSize: 12
            color:"#fff"
        }
    }
    Timer{
        interval: 5000; running:true; repeat: true;
        onTriggered: HTTP.googleFinance(parent, parent.symbol);
    }
    MouseArea{
        anchors.fill: parent
        onClicked: Handler.click_stock(parent);
    }
}
