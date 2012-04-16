// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id:calendar_view
    width: 520
    height: 290
    color: "#00000000"
    radius: 10
    clip: true
    ListView {
        id: calendar_list_view
        model: listsModel
        spacing: 1
        property real contentBottom: contentY + height
        x: 50
        y: 21
        width: 420
        height: 236
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        delegate:Calendar_View_Item{
                id:calendar_view_item
                theText:text
                theType: type
        }
        ListModel {
            id: listsModel
            Component.onCompleted: loadCalendarView()
            function loadCalendarView() {
                console.log("aa");
                listsModel.clear();
                listsModel.append( {"text":showdate(0)+" (Today)","type":1});
                listsModel.append( {"text":"09:30 - 10:45           CS 422","type":0});
                listsModel.append( {"text":"12:30 - 13:00           Office Hour","type":0});
                listsModel.append( {"text":"15:30 - 16:45           CS 525","type":0});
                listsModel.append( {"text":showdate(3600*24)+" (Tomorrow)","type":1});
                listsModel.append( {"text":"15:00 - 16:15           taking class","type":0});
                listsModel.append( {"text":showdate(3600*24*2),"type":1});
                listsModel.append( {"text":"10:30 - 16:30           Movie","type":0});
                listsModel.append( {"text":"18:00 - 20:00           Dinner with Joe","type":0});
            }
            function showdate(offset){
                var d = new Date();
                var utc = d.getTime() + (d.getTimezoneOffset() * 60000);
                var nd = new Date(utc + (1000*offset));
                var fulldate = nd.toDateString();
                fulldate = fulldate.slice(0,fulldate.length-4);
                return fulldate;
            }

        }


    }
}
