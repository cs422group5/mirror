function initTimeZoneDb() {
    var doc = new XMLHttpRequest();
    doc.onreadystatechange = function() {
        if (doc.readyState == XMLHttpRequest.DONE) {
            var db = openDatabaseSync("QDeclarativeExampleDB", "1.0", "The Example QML SQL!", 1000000);
                db.transaction(
                     function(tx) {
                        // Create the database if it doesn't already exist
                        tx.executeSql('DROP TABLE IF EXISTS timezone');
                        tx.executeSql('CREATE TABLE IF NOT EXISTS timezone(name TEXT, offset INTEGER)');
                        var a = doc.responseText;
                        //console.log(a);
                        var b=a.split("|");
                        for(var i=0;i<b.length;++i){
                            var c=b[i].split(":");
                            tx.executeSql('INSERT INTO timezone VALUES(?, ?)', [ c[0], c[1] ]);
                        }
                        /*var rs = tx.executeSql('SELECT * FROM timezone WHERE name LIKE \'%Af%\'');

                        var r = ""
                        for(var i = 0; i < rs.rows.length; i++) {
                            r += rs.rows.item(i).name + ", " + rs.rows.item(i).offset + "\n"
                        }
                        console.log(r);*/
                     }
                 )
        }
    }
    doc.open("GET", "http://joysword.com/cs422/p2/timezones.txt");
    doc.send();
    inittestData();
}

function inittestData(){
    var db = openDatabaseSync("QDeclarativeExampleDB", "1.0", "The Example QML SQL!", 1000000);
        db.transaction(
             function(tx) {
                tx.executeSql('DROP TABLE IF EXISTS mytimezone');
                tx.executeSql('CREATE TABLE IF NOT EXISTS mytimezone(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, offset INTEGER)');
                tx.executeSql('INSERT INTO mytimezone VALUES(?, ?, ?)', [ , 'America/Chicago', '-18000' ]);
                tx.executeSql('INSERT INTO mytimezone VALUES(?, ?, ?)', [ , 'Asia/Chongqing', '28800' ]);
                /*var rs = tx.executeSql('SELECT * FROM timezone WHERE name LIKE \'%Af%\'');

                var r = ""
                for(var i = 0; i < rs.rows.length; i++) {
                    r += rs.rows.item(i).name + ", " + rs.rows.item(i).offset + "\n"
                }
                console.log(r);*/
             }
         )
}


