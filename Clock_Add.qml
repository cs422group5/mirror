// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "clock.js" as Clock
Rectangle {
    id: clock_add
    width: 520
    height: 290
    color: "#000000"
    Component.onCompleted: Clock.initTimeZoneDb();
    signal freshed();
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
                    listsModel.clear();
                    if(timezone.text=='please input your city here') return false;
                    var db = openDatabaseSync("QDeclarativeExampleDB", "1.0", "The Example QML SQL!", 1000000);
                        db.transaction(
                             function(tx) {
                                var res = tx.executeSql('SELECT * FROM mytimezone');
                                var myarray=new Array();
                                for(var j = 0; j < res.rows.length; j++) {
                                    myarray.push(res.rows.item(j).name)
                                }
                                var mystr="|"+myarray.join("|")+"|";
                                console.log(mystr);
                                var rs = tx.executeSql('SELECT * FROM timezone WHERE name LIKE \'%'+timezone.text+'%\'');
                                var r = "";
                                for(var i = 0; i < rs.rows.length; i++) {
                                    var selected=false;
                                    if(i==0) selected=true;
                                    if(mystr.indexOf("|"+rs.rows.item(i).name+"|")>=0) continue;
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
        id: button14
        x: 219
        y: 236
        width: 88
        height: 48
        btnText: "Close"
        onClicked: clock_add.visible=false;
    }

    Button1 {
        id: button11
        x: 363
        y: 12
        width: 66
        height: 24
        btnText: "Add"
        onClicked: add();
    }

    TextInput {
        id: timezone
        x: 78
        y: 14
        width: 246
        height: 20
        color: "#ffffff"
        text: 'please input your city here'
        font.family: "Arial"
        font.pixelSize: 15
        onFocusChanged:{
            if(timezone.text=='please input your city here') timezone.text='';
            else if(timezone.text=='') timezone.text='please input your city here';
        }
        onTextChanged: listsModel.loadClocks();
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
        timezone.text=city_name;
        console.log(city_name+"clicked");
    }

    function add(){
        var length=listsModel.count;
        for(var i=0;i<length;++i){
            if(listsModel.get(i).itemselected){
                var db = openDatabaseSync("QDeclarativeExampleDB", "1.0", "The Example QML SQL!", 1000000);
                    db.transaction(
                         function(tx) {
                            tx.executeSql('INSERT INTO mytimezone VALUES(?, ?, ?)', [ , listsModel.get(i).name, listsModel.get(i).offset ]);
                         }
                     )
            }
        }
        listsModel.loadClocks();
        clock_add.freshed();
    }
}
