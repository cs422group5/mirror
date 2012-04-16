// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "clock.js" as Clock
Rectangle {
    id: clock_view
    width: 520
    height: 290
    color: "#000000"
    Component.onCompleted: Clock.initTimeZoneDb();
    onVisibleChanged: clock_add1.visible=false;
    Flickable {
        id: flickable1
        x: 13
        y: 46
        width: 500
        height: 184
        clip:true
        ListView {
            id: list_view1
            anchors.fill: parent
            delegate: Clocks_View_Item{
                city: name
                offset: offsetseconds
                selected: itemselected
                onClicked:item_clicked(cityname);
            }
            model: ListModel {
                id:listsModel
                Component.onCompleted: loadClocks()
                function loadClocks() {
                    console.log("aa");
                    listsModel.clear();
                    var db = openDatabaseSync("QDeclarativeExampleDB", "1.0", "The Example QML SQL!", 1000000);
                        db.transaction(
                             function(tx) {
                                var rs = tx.executeSql('SELECT * FROM mytimezone');

                                for(var i = 0; i < rs.rows.length; i++) {
                                    var selected=false;
                                    if(i==0) selected=true;
                                    listsModel.append( {
                                                          "name": rs.rows.item(i).name,
                                                          "offsetseconds": rs.rows.item(i).offset,
                                                          "itemselected": selected
                                                      });

                                }
                             }
                         )
                }
            }
        }
    }

    Button1 {
        id: button11
        x: 78
        y: 235
        btnText: "＋"
        onClicked: clock_add1.visible=true;
    }

    Button1 {
        id: button12
        x: 226
        y: 235
        width: 69
        height: 24
        btnText: "up"
        onClicked: moveup();
    }

    Button1 {
        id: button13
        x: 226
        y: 259
        width: 69
        height: 24
        btnText: "down"
        onClicked: movedown();
    }

    Button1 {
        id: button14
        x: 392
        y: 235
        btnText: "－"
        onClicked: cut();
    }

    Clock_Add {
        id: clock_add1
        x: 0
        y: 295
        visible: false
        onFreshed: listsModel.loadClocks();
    }
    function item_clicked(city_name){
        var length=listsModel.count;
        for(var i=0;i<length;++i){
            if(listsModel.get(i).name == city_name){
                listsModel.setProperty(i, "itemselected", 1);
            }else{
                listsModel.setProperty(i, "itemselected", 0);
            }
        }
        console.log(city_name+"clicked");
    }

    function cut(){
        var length=listsModel.count;
        for(var i=0;i<length;++i){
            if(listsModel.get(i).itemselected){
                var db = openDatabaseSync("QDeclarativeExampleDB", "1.0", "The Example QML SQL!", 1000000);
                    db.transaction(
                         function(tx) {
                            tx.executeSql('DELETE FROM mytimezone WHERE name = \''+listsModel.get(i).name+'\'');
                         }
                     )
            }
        }
        listsModel.loadClocks();
    }

    function moveup(){
        var length=listsModel.count;
        for(var i=0;i<length;++i){
            if(listsModel.get(i).itemselected && i>0){
                var j=i-1;
                listsModel.move(i, j, 1);
                break;
            }
        }

    }
    function movedown(){
        var length=listsModel.count;
        for(var i=0;i<length;++i){
            if(listsModel.get(i).itemselected && i<(length-1)){
                var j=i+1;
                listsModel.move(i, j, 1);
                break;
            }
        }

    }
}
