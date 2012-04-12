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
                                  "time_from": "12:00",
                                  "time_to": "16:00",
                                  "jobs": "test class" });
            listsModel.append( {
                                  "time_from": "17:00",
                                  "time_to": "18:00",
                                  "jobs": "test class2" });
            listsModel.append( {
                                  "time_from": "12:00",
                                  "time_to": "16:00",
                                  "jobs": "test class" });
            listsModel.append( {
                                  "time_from": "17:00",
                                  "time_to": "18:00",
                                  "jobs": "test class2" });
            listsModel.append( {
                                  "time_from": "12:00",
                                  "time_to": "16:00",
                                  "jobs": "test class" });
            listsModel.append( {
                                  "time_from": "17:00",
                                  "time_to": "18:00",
                                  "jobs": "test class2" });
        }

    }
}
