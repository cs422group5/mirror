// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

ListView {
    id: calendar_mini_list_view
    model: listsModel
    delegate: list
    spacing: 1
    property real contentBottom: contentY + height
    Component
    {
        id:list
        Calendar_Mini_Item{
            id:calendar_mini_item
            theTimeFrom: time_from
            theTimeTo: time_to
            theJobs: jobs
            isVisible: (y>ListView.view.contentY-1)
        }
    }
    ListModel {
        id: listsModel
        Component.onCompleted: loadCalendarMini()
        function loadCalendarMini() {
            console.log("aa");
            listsModel.clear();
            listsModel.append( {
                                  "time_from": "09:30",
                                  "time_to": "10:45",
                                  "jobs": "CS 422" });
            listsModel.append( {
                                  "time_from": "12:30",
                                  "time_to": "13:00",
                                  "jobs": "Office Hour" });
            listsModel.append( {
                                  "time_from": "15:30",
                                  "time_to": "16:45",
                                  "jobs": "CS 525" });
        }

    }
}
