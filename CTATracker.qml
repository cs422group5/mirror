// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "request.js" as HTTP
Item {
    property string stop
    property string routeName
    property string route
    property string stpid
    property int eta
    width:parent.width
    height:40
    Rectangle{
        height:30
        radius:5
        width:parent.width
        color:"#004444"
        Item{
            x:10
            height:parent.height
            width: 200
            Text{
                anchors.left: parent.left
                font.pixelSize: 14
                text: routeName
                color:"#fff"
            }
            Text{
                anchors.bottom: parent.bottom
                text: stop
                color:"#fff"
            }
            Text{
                anchors.right: parent.right
                text: eta + " min"
                color:"#fff"
                font.pixelSize: 16
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }
    Timer{
        interval: 30000; running:true; repeat: true;
        onTriggered: HTTP.ctabustracker(parent);
        triggeredOnStart: HTTP.ctabustracker(parent);
    }
}
