// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "mirrorjs.js" as Handler
import "request.js" as HTTP
//testtest

Rectangle {
    id:home
    property string email: "paulrealsane@gmail.com"
    property string passwd: "fantasy90"
    property string authTokenFinance: ""
    property string authTokenCalendar: ""
    onAuthTokenFinanceChanged: console.log("authTokenFinance = "+authTokenFinance);
    onAuthTokenCalendarChanged: console.log("authTokenCalendar = "+authTokenCalendar);
    Component.onCompleted:
        if (email != "" && passwd != ""){
            HTTP.googleLogin_Request("finance",email,passwd);
            HTTP.googleLogin_Request("cl",email,passwd);
        }
    width: 1024
    height: 728
    Rectangle{
        id: loginScreen
        width:parent.width
        height:parent.height
        Item{
            width:140
            height:180
            anchors.centerIn: parent
            Rectangle{
                color: "#444"
                width:140
                height:140
                radius:20
                MouseArea{
                    anchors.fill: parent
                    onClicked: Handler.login("in")
                }
            }
            Text{
                anchors.horizontalCenter: parent.horizontalCenter
                y:140
                text:"Place Right Thumb"
                font.pixelSize: 16
            }
            Text{
                anchors.horizontalCenter: parent.horizontalCenter
                y:160
                text:"To Log In"
                font.pixelSize: 16
            }
        }
    }
    Item{
        id:logged
        width:parent.width
        height:parent.height
        visible: false
        Image {
                 id: background
                 source: "background.png"
             }
        Rectangle{
            width:100
            height:30
            radius: 5
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            color:"#444"
            Text{
                anchors.centerIn: parent
                font.pixelSize: 16
                color:"#fff"
                text:"Logout"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: Handler.login("out");
            }
        }
        Header{
            id:topright
            hexcolor:"#444"
            x:570
            y:-40
            onClicked:{
                clocks_view1.visible=!clocks_view1.visible;
            }
        }
        WeatherIcon{
            id: secondWeather
            hexcolor: "#444"
            MouseArea{
                anchors.fill:parent
                onClicked: Handler.click_secondlevel("Weather");
            }
        }

        //Health Icon
        WindowSize1{
            id: firstHealth
            text: "Health"
            x:10
            y:110
        }

        //Changing Room Icon
        WindowSize1{
            id: firstOutfit
            text: "Outfit"
            x:10
            y:220
        }

        //Stocks Icon
        WindowSize1{
            id: firstStocks
            text: "Stocks"
            x:10
            y:330
        }

        //Music Icon
        WindowSize1{
            id: firstMusic
            text: "Music"
            x:10
            y:440
        }

        //TV Icon
        WindowSize1{
            id: firstTV
            text: "TV"
            x:10
            y:550
        }

        //Preferences Icon
        WindowSize1{
            id: firstPreferences
            text: "Pref"
            x:10
            y:660
        }

        //Health Window 2
        WindowSize2{
            id: secondHealth
            text: "Health"
            hexcolor: "#222"
            x:70
            y:110
            Item{
                x:10
                y:20
                height:70
                width:150
                //color: parent.color
                Item{
                    width:50
                    height:10
                    //color:parent.color
                    Text{
                        id: tab_health
                        property string tabcolor: "#fff"
                        color:tabcolor
                        text: "Health"
                        anchors.centerIn: parent
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: Handler.click_health("Health");
                    }
                }
                Item{
                    x:50
                    width:50
                    height:10
                    //color:parent.color
                    Text{
                        id: tab_exercise
                        property string tabcolor: "#444"
                        color:tabcolor
                        text: "Exercise"
                        anchors.centerIn: parent
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: Handler.click_health("Exercise");
                    }
                }
                Item{
                    x:100
                    width:50
                    height:10
                    //color:parent.color
                    Text{
                        id: tab_sleep
                        property string tabcolor: "#444"
                        color: tabcolor
                        text: "Sleep"
                        anchors.centerIn: parent
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: Handler.click_health("Sleep");
                    }
                }
                Rectangle{
                    y:10
                    x:-1
                    height:60
                    width:2
                    //width:129
                    //height:20
                }
                Rectangle{
                    x:-1
                    y:70
                    width:149
                    height:2
                }
                Item{
                    id: content_health
                    Rectangle{
                        x:9
                        y:60
                        width:10
                        height:10
                    }
                    Rectangle{
                        x:29
                        y:50
                        width:10
                        height:20
                    }
                    Rectangle{
                        x:49
                        y:40
                        width:10
                        height:30
                    }
                    Rectangle{
                        x:69
                        y:30
                        width:10
                        height:40
                    }
                    Rectangle{
                        x:89
                        y:20
                        width:10
                        height:50
                        Rectangle{
                            x:2
                            y:2
                            width:6
                            height:48
                            color:secondHealth.color
                        }
                    }
                    Rectangle{
                        color:secondHealth.color
                        x:109
                        y:20
                        width:40
                        height:40
                        Text{
                            color:"#fff"
                            anchors.centerIn: parent
                            font.pixelSize: 24
                            text: "4"
                        }
                    }
                }
                Item{
                    id: content_exercise
                    visible: false
                    Rectangle{
                        x:9
                        y:60
                        width:10
                        height:10
                    }
                    Rectangle{
                        x:29
                        y:50
                        width:10
                        height:20
                    }
                    Rectangle{
                        x:49
                        y:40
                        width:10
                        height:30
                    }
                    Rectangle{
                        x:69
                        y:30
                        width:10
                        height:40
                        Rectangle{
                            x:2
                            y:2
                            width:6
                            height:38
                            color:secondHealth.color
                        }
                    }
                    Rectangle{
                        x:89
                        y:20
                        width:10
                        height:50
                        Rectangle{
                            x:2
                            y:2
                            width:6
                            height:48
                            color:secondHealth.color
                        }
                    }
                    Item{
                        x:109
                        y:20
                        width:40
                        height:40
                        Text{
                            color:"#fff"
                            anchors.centerIn: parent
                            font.pixelSize: 24
                            text: "3"
                        }
                    }
                }
                Item{
                    id: content_sleep
                    visible: false
                    Rectangle{
                        x:9
                        y:60
                        width:10
                        height:10
                    }
                    Rectangle{
                        x:29
                        y:50
                        width:10
                        height:20
                    }
                    Rectangle{
                        x:49
                        y:40
                        width:10
                        height:30
                    }
                    Rectangle{
                        x:69
                        y:30
                        width:10
                        height:40
                    }
                    Rectangle{
                        x:89
                        y:20
                        width:10
                        height:50
                        Rectangle{
                            x:2
                            y:2
                            width:6
                            height:48
                            color:secondHealth.color
                        }
                    }
                    Item{
                        x:109
                        y:20
                        width:40
                        height:40
                        Text{
                            color:"#fff"
                            anchors.centerIn: parent
                            font.pixelSize: 24
                            text: "4"
                        }
                    }
                }
            }
        }

        //Changing Room Window 2
        //Shows quick wardrobe advice for the day
        WindowSize2{
            id: secondOutfit
            text: "Outfit"
            hexcolor: "#222"
            x:70
            y:220
            Item{
                x:10
                y:20
                height:70
                width:150
                //color: parent.color
                //INSERT OUTFIT APPLICATION HERE
                Text{
                    color:"#fff"
                    text: "Today:"
                }
                Rectangle{
                    y:25
                    width:parent.width
                    Text{
                        anchors.centerIn: parent
                        color:"#fff"
                        text: "Sweater"
                        font.pixelSize: 24
                    }
                }
                Text{
                    y:35
                    color:"#fff"
                    text: "Tonight:"
                }
                Rectangle{
                    y:60
                    width:parent.width
                    Text{
                        anchors.centerIn: parent
                        color:"#fff"
                        text: "Umbrella"
                        font.pixelSize: 24
                    }
                }
            }
        }

        //Stocks Window 2
        //Shows quick stock quotes from Google Finance
        WindowSize2{
            id: secondStocks
            text: "Stocks"
            hexcolor: "#222"
            x:70
            y:330
            Item{
                x:10
                y:20
                height:70
                width:150
                //color:parent.color
                //INSERT STOCKS APPLICATION HERE
                Flickable{
                    id: stockflick
                    anchors.fill: parent
                    clip: true
                    contentWidth: stockflick.width
                    contentHeight: 20*6
                    Stock{
                        symbol: "GOOG"
                    }
                    Stock{
                        y:20
                        symbol: "MSFT"
                    }
                    Stock{
                        y:40
                        symbol: "AAPL"
                    }
                    Stock{
                        y:60
                        symbol: "FORD"
                    }
                    Stock{
                        y:80
                        symbol: "SUN"
                    }
                }
            }
        }

        //Music Window
        //Allows playing of music, pausing, volume increase, song selection.
        Music_TV_Window{
            id: secondMusic
            text: "Music"
            x:70
            y:440
            Rectangle{
                x:10
                y:20
                height:250
                width:320
                color:"#000"
                //INSERT MUSIC APPLICATION HERE
            }
        }

        //TV Window
        //Allows starting television, turning off, increase in volume, channel selection.
        Music_TV_Window{
            id: secondTV
            text: "TV"
            x:70
            y:440
            Rectangle{
                x:10
                y:20
                height:250
                width:320
                color:"#000"
                //INSERT TV APPLICATION HERE
            }
        }

        //Large Health Window
        //Shows detailed health information
        WindowSize3{
            id: thirdHealth
            text: "Health"
            visible: false
            Item{
                x:10
                y:29
                Rectangle{
                    y:10
                    width:500
                    height:230
                    color:"#000"
                    border.width:2
                    border.color:"#fff"
                }
                Tab{
                    id: tab_healthNutrients
                    x:10
                    hexcolor: "#fff"
                    text:"Nutrients"
                    MouseArea{
                        anchors.fill: parent
                        onClicked: Handler.click_tabHealth(parent.text)
                    }
                }
                Tab{
                    id: tab_healthMedicine
                    x:122
                    hexcolor: "#444"
                    text:"Medicine"
                    MouseArea{
                        anchors.fill: parent
                        onClicked: Handler.click_tabHealth(parent.text)
                    }
                }
                Tab{
                    id: tab_healthExercise
                    x:234
                    hexcolor: "#444"
                    text:"Exercise"
                    MouseArea{
                        anchors.fill: parent
                        onClicked: Handler.click_tabHealth(parent.text)
                    }
                }
                Tab{
                    id: tab_healthSleep
                    x:346
                    hexcolor: "#444"
                    text:"Sleep"
                    MouseArea{
                        anchors.fill: parent
                        onClicked: Handler.click_tabHealth(parent.text)
                    }
                }
                Item{
                    x:10
                    y:26
                    id: content_healthNutrients
                    visible: true
                    Text{
                        id: tab_healthNutrients_Vit
                        property string tabcolor: "#fff"
                        color: tabcolor
                        text: "Vitamins"
                        font.pixelSize: 16
                        MouseArea{
                            anchors.fill: parent
                            onClicked: Handler.click_subVitamins("vitamin")
                        }
                    }
                    Text{
                        id: tab_healthNutrients_Suggest
                        y:24
                        property string tabcolor: "#444"
                        color:tabcolor
                        text: "Suggestions"
                        font.pixelSize: 16
                        MouseArea{
                            anchors.fill: parent
                            onClicked: Handler.click_subVitamins("suggest")
                        }
                    }
                    Item{
                        id:content_healthNutrients_Suggest
                        visible:false
                        x:116
                        y:10
                        Text{
                            color: "#fff"
                            text: "A"
                            font.pixelSize: 24
                        }
                        Text{
                            y:40
                            color: "#fff"
                            text: "B"
                            font.pixelSize: 24
                        }
                        Text{
                            y:80
                            color: "#fff"
                            text: "C"
                            font.pixelSize: 24
                        }
                        Text{
                            y:120
                            color: "#fff"
                            text: "D"
                            font.pixelSize: 24
                        }
                        Text{
                            y:160
                            color: "#fff"
                            text: "E"
                            font.pixelSize: 24
                        }
                    }
                    Item{
                        id: content_healthNutrients_Vit
                        x:116
                        Rectangle{
                            //155
                            y:35
                            x:70
                            width:36
                            height:120
                            color:"#000"
                            border.color:"#fff"
                            border.width:2
                            Item{
                                width:parent.width
                                height:20
                                Text{
                                    anchors.centerIn: parent
                                    text: parent.parent.height
                                    color: parent.parent.border.color
                                }
                            }
                        }
                        Rectangle{
                            //155
                            y:81
                            x:130
                            width:36
                            height:74
                            color:"#000"
                            border.color:"#990000"
                            border.width:2
                            Item{
                                width:parent.width
                                height:20
                                Text{
                                    anchors.centerIn: parent
                                    text: parent.parent.height
                                    color: parent.parent.border.color
                                }
                            }
                        }
                        Rectangle{
                            //155
                            y:20
                            x:190
                            width:36
                            height:135
                            color:"#000"
                            border.color:"#fff"
                            border.width:2
                            Item{
                                width:parent.width
                                height:20
                                Text{
                                    anchors.centerIn: parent
                                    text: parent.parent.height
                                    color: parent.parent.border.color
                                }
                            }
                        }
                        Rectangle{
                            //155
                            y:55
                            x:250
                            width:36
                            height:100
                            color:"#000"
                            border.color:"#fff"
                            border.width:2
                            Item{
                                width:parent.width
                                height:20
                                Text{
                                    anchors.centerIn: parent
                                    text: parent.parent.height
                                    color: parent.parent.border.color
                                }
                            }
                        }
                        Rectangle{
                            //155
                            y:104
                            x:310
                            width:36
                            height:51
                            color:"#000"
                            border.color:"#990000"
                            border.width:2
                            Item{
                                width:parent.width
                                height:20
                                Text{
                                    anchors.centerIn: parent
                                    text: parent.parent.height
                                    color: parent.parent.border.color
                                }
                            }
                        }
                        Rectangle{
                            x: 60
                            y:4
                            width:2
                            height:150
                            color: "#fff"
                        }
                        Rectangle{
                            x: 60
                            y:154
                            width:300
                            height:2
                            color: "#fff"
                        }
                        Text{
                            y:49
                            text:"Daily Value\n     (%)"
                            color:"#fff"
                        }
                        Rectangle{
                            x:58
                            y:55
                            width:6
                            height:2
                        }
                        Item{
                            x: 60
                            y:156
                            width:60
                            height:55
                            Text{
                                anchors.centerIn: parent
                                text: "A"
                                color:"#fff"
                                font.pixelSize: 16
                            }
                        }
                        Item{
                            x: 120
                            y:156
                            width:60
                            height:55
                            Text{
                                anchors.centerIn: parent
                                text: "B"
                                color:"#fff"
                                font.pixelSize: 16
                            }
                        }
                        Item{
                            x: 180
                            y:156
                            width:60
                            height:55
                            Text{
                                anchors.centerIn: parent
                                text: "C"
                                color:"#fff"
                                font.pixelSize: 16
                            }
                        }
                        Item{
                            x: 240
                            y:156
                            width:60
                            height:55
                            Text{
                                anchors.centerIn: parent
                                text: "D"
                                color:"#fff"
                                font.pixelSize: 16
                            }
                        }
                        Item{
                            x: 300
                            y:156
                            width:60
                            height:55
                            Text{
                                anchors.centerIn: parent
                                text: "E"
                                color:"#fff"
                                font.pixelSize: 16
                            }
                        }
                    }
                }
                Item{
                    x:10
                    y:26
                    id: content_healthMedicine
                    visible: false
                    Text{
                        id: tab_healthMedicine_Schedule
                        property string tabcolor: "#fff"
                        color: tabcolor
                        text: "Schedule"
                        font.pixelSize: 16
                        MouseArea{
                            anchors.fill: parent
                            onClicked: Handler.click_subMedicine(parent.text)
                        }
                    }
                    Text{
                        id: tab_healthMedicine_PillsLeft
                        y:24
                        property string tabcolor: "#444"
                        color:tabcolor
                        text: "Pills Left"
                        font.pixelSize: 16
                        MouseArea{
                            anchors.fill: parent
                            onClicked: Handler.click_subMedicine(parent.text)
                        }
                    }
                    Item{
                        id: content_healthMedicine_Schedule
                        x:116
                        Rectangle{
                            x:90
                            height:210
                            width:2
                        }
                        Rectangle{
                            x:180
                            height:210
                            width:2
                        }
                        Rectangle{
                            x:270
                            height:210
                            width:2
                        }
                        Rectangle{
                            y:105
                            height:2
                            width:360
                        }
                        Item{
                            x:10
                            Text{
                                color:"#fff"
                                text:"MON"
                                font.pixelSize: 14
                            }
                            Text{
                                y:30
                                color:"#fff"
                                text:"Aserta"
                            }
                        }
                        Item{
                            x:100
                            Text{
                                color:"#fff"
                                text:"TUE"
                                font.pixelSize: 14
                            }
                            Text{
                                y:30
                                color:"#990000"
                                text:"Ridlin"
                            }
                        }
                        Item{
                            x:190
                            Text{
                                color:"#fff"
                                text:"WED"
                                font.pixelSize: 14
                            }
                            Text{
                                y:30
                                color:"#fff"
                                text:"Aserta"
                            }
                            Text{
                                y:50
                                color:"#fff"
                                text:"Alleve"
                            }
                        }
                        Item{
                            x:280
                            Text{
                                color:"#fff"
                                text:"THU"
                                font.pixelSize: 14
                            }
                            Text{
                                y:30
                                color:"#990000"
                                text:"Ridlin"
                            }
                        }
                        Item{
                            x:10
                            y:115
                            Text{
                                color:"#fff"
                                text:"FRI"
                                font.pixelSize: 14
                            }
                            Text{
                                y:30
                                color:"#fff"
                                text:"Aserta"
                            }
                            Text{
                                y:50
                                color:"#fff"
                                text:"Alleve"
                            }
                        }
                        Item{
                            x:100
                            y:115
                            Text{
                                color:"#fff"
                                text:"SAT"
                                font.pixelSize: 14
                            }
                            Text{
                                y:30
                                color:"#fff"
                                text:"Aserta"
                            }
                            Text{
                                y:50
                                color:"#fff"
                                text:"Alleve"
                            }
                        }
                        Item{
                            x:190
                            y:115
                            Text{
                                color:"#fff"
                                text:"SUN"
                                font.pixelSize: 14
                            }
                            Text{
                                y:30
                                color:"#fff"
                                text:"Aserta"
                            }
                            Text{
                                y:50
                                color:"#fff"
                                text:"Alleve"
                            }
                        }
                    }
                    Item{
                        id: content_healthMedicine_PillsLeft
                        x:116
                        visible: false
                        Rectangle{
                            //155
                            y:115
                            x:70
                            width:36
                            height:40
                            color:"#000"
                            border.color:"#990000"
                            border.width:2
                            Item{
                                width:parent.width
                                height:30
                                Text{
                                    anchors.centerIn: parent
                                    text: parent.parent.height + "%\n" + "(" +Math.floor(parent.parent.height*.2)+")"
                                    color: parent.parent.border.color
                                }
                            }
                        }
                        Rectangle{
                            //155
                            y:65
                            x:130
                            width:36
                            height:90
                            color:"#000"
                            border.color:"#fff"
                            border.width:2
                            Item{
                                width:parent.width
                                height:30
                                Text{
                                    anchors.centerIn: parent
                                    text: parent.parent.height + "%\n" + "(" +Math.floor(parent.parent.height*.6)+")"
                                    color: parent.parent.border.color
                                }
                            }
                        }
                        Rectangle{
                            //155
                            y:75
                            x:190
                            width:36
                            height:80
                            color:"#000"
                            border.color:"#fff"
                            border.width:2
                            Item{
                                width:parent.width
                                height:30
                                Text{
                                    anchors.centerIn: parent
                                    text: parent.parent.height + "%\n" + "(" +Math.floor(parent.parent.height*.80)+")"
                                    color: parent.parent.border.color
                                }
                            }
                        }
                        Rectangle{
                            //155
                            y:99
                            x:250
                            width:36
                            height:56
                            color:"#000"
                            border.color:"#fff"
                            border.width:2
                            Item{
                                width:parent.width
                                height:30
                                Text{
                                    anchors.centerIn: parent
                                    text: parent.parent.height + "%\n" + "(" +Math.floor(parent.parent.height*.25)+")"
                                    color: parent.parent.border.color
                                }
                            }
                        }
                        Rectangle{
                            //155
                            y:54
                            x:310
                            width:36
                            height:100
                            color:"#000"
                            border.color:"#fff"
                            border.width:2
                            Item{
                                width:parent.width
                                height:30
                                Text{
                                    anchors.centerIn: parent
                                    text: parent.parent.height + "%\n" + "(" +Math.floor(parent.parent.height*.4)+")"
                                    color: parent.parent.border.color
                                }
                            }
                        }
                        Rectangle{
                            x: 60
                            y:4
                            width:2
                            height:150
                            color: "#fff"
                        }
                        Rectangle{
                            x: 60
                            y:154
                            width:300
                            height:2
                            color: "#fff"
                        }
                        Text{
                            y:49
                            text:"Pills Left\n     (%)"
                            color:"#fff"
                        }
                    }
                    Rectangle{
                        x:388
                        y:225
                        width:100
                        height:30
                        radius:5
                        color:"#000"
                        border.color: "#fff"
                        border.width: 2
                        Text{
                            text: "Add Med"
                            color:"#fff"
                            font.pixelSize: 18
                            anchors.centerIn: parent
                        }
                    }
                }
                Item{
                    x:10
                    y:26
                    id: content_healthExercise
                    visible: false
                    Text{
                        id: tab_healthExercise_Stats
                        property string tabcolor: "#fff"
                        color: tabcolor
                        text: "Stats"
                        font.pixelSize: 16
                        MouseArea{
                            anchors.fill: parent
                            onClicked: Handler.click_subExercise(parent.text)
                        }
                    }
                    Text{
                        id: tab_healthExercise_Suggestions
                        y:24
                        property string tabcolor: "#444"
                        color:tabcolor
                        text: "Suggestions"
                        font.pixelSize: 16
                        MouseArea{
                            anchors.fill: parent
                            onClicked: Handler.click_subExercise(parent.text)
                        }
                    }
                    Item{
                        id: content_healthExercise_Stats
                        x:116
                        Text{
                            text:"Height"
                            font.pixelSize: 16
                            color:"#fff"
                        }
                        Text{
                            y:24
                            text:"5'11\""
                            color:"#fff"
                        }
                        Text{
                            y:44
                            font.pixelSize: 16
                            text:"Weight"
                            color:"#fff"
                        }
                        Text{
                            y:68
                            text:"171 lbs"
                            color:"#fff"
                        }
                        Text{
                            y:88
                            font.pixelSize: 16
                            text:"BMI"
                            color:"#fff"
                        }
                        Text{
                            y:112
                            text:"8"
                            color:"#fff"
                        }
                        Rectangle{
                            //155
                            y:115
                            x:70
                            width:36
                            height:40
                            color:"#000"
                            border.color:"#990000"
                            border.width:2
                            Item{
                                width:parent.width
                                height:20
                                Text{
                                    anchors.centerIn: parent
                                    text: parent.parent.height + "%"
                                    color: parent.parent.border.color
                                }
                            }
                        }
                        Rectangle{
                            //155
                            y:65
                            x:130
                            width:36
                            height:90
                            color:"#000"
                            border.color:"#fff"
                            border.width:2
                            Item{
                                width:parent.width
                                height:20
                                Text{
                                    anchors.centerIn: parent
                                    text: parent.parent.height + "%"
                                    color: parent.parent.border.color
                                }
                            }
                        }
                        Rectangle{
                            //155
                            y:75
                            x:190
                            width:36
                            height:80
                            color:"#000"
                            border.color:"#fff"
                            border.width:2
                            Item{
                                width:parent.width
                                height:20
                                Text{
                                    anchors.centerIn: parent
                                    text: parent.parent.height + "%"
                                    color: parent.parent.border.color
                                }
                            }
                        }
                        Rectangle{
                            //155
                            y:99
                            x:250
                            width:36
                            height:56
                            color:"#000"
                            border.color:"#fff"
                            border.width:2
                            Item{
                                width:parent.width
                                height:20
                                Text{
                                    anchors.centerIn: parent
                                    text: parent.parent.height+"%"
                                    color: parent.parent.border.color
                                }
                            }
                        }
                        Rectangle{
                            //155
                            y:54
                            x:310
                            width:36
                            height:100
                            color:"#000"
                            border.color:"#fff"
                            border.width:2
                            Item{
                                width:parent.width
                                height:20
                                Text{
                                    anchors.centerIn: parent
                                    text: parent.parent.height + "%"
                                    color: parent.parent.border.color
                                }
                            }
                        }
                        Item{
                            x: 60
                            y:156
                            width:60
                            height:55
                            Text{
                                anchors.centerIn: parent
                                text: "Steps"
                                color:"#fff"
                            }
                        }
                        Item{
                            x: 120
                            y:156
                            width:60
                            height:55
                            Text{
                                anchors.centerIn: parent
                                text: "BP"
                                color:"#fff"
                            }
                        }
                        Item{
                            x: 180
                            y:156
                            width:60
                            height:55
                            Text{
                                anchors.centerIn: parent
                                text: "Heart Rate"
                                color:"#fff"
                            }
                        }
                        Item{
                            x: 240
                            y:156
                            width:60
                            height:55
                            Text{
                                anchors.centerIn: parent
                                text: "Strength"
                                color:"#fff"
                            }
                        }
                        Item{
                            x: 300
                            y:156
                            width:60
                            height:55
                            Text{
                                anchors.centerIn: parent
                                text: "Endurance"
                                color:"#fff"
                            }
                        }
                        Rectangle{
                            x:58
                            y:55
                            width:6
                            height:2
                        }
                        Text{
                            x:70
                            y:49
                            text:"AVG"
                            color:"#fff"
                        }
                        Rectangle{
                            x: 60
                            y:4
                            width:2
                            height:150
                            color: "#fff"
                        }
                        Rectangle{
                            x: 60
                            y:154
                            width:300
                            height:2
                            color: "#fff"
                        }
                    }
                    Item{
                        id: content_healthExercise_Suggestions
                        x:116
                        visible: false
                        Rectangle{
                            x:90
                            height:210
                            width:2
                        }
                        Rectangle{
                            x:180
                            height:210
                            width:2
                        }
                        Rectangle{
                            x:270
                            height:210
                            width:2
                        }
                        Rectangle{
                            y:105
                            height:2
                            width:360
                        }
                        Item{
                            x:10
                            Text{
                                color:"#fff"
                                text:"MON"
                                font.pixelSize: 14
                            }
                            Text{
                                y:30
                                color:"#fff"
                                text:"Biceps/Triceps"
                            }
                        }
                        Item{
                            x:100
                            Text{
                                color:"#fff"
                                text:"TUE"
                                font.pixelSize: 14
                            }
                            Text{
                                y:30
                                color:"#fff"
                                text:"Pushups"
                            }
                        }
                        Item{
                            x:190
                            Text{
                                color:"#fff"
                                text:"WED"
                                font.pixelSize: 14
                            }
                            Text{
                                y:30
                                color:"#fff"
                                text:"Biceps/Triceps"
                            }
                            Text{
                                y:50
                                color:"#fff"
                                text:"Legs"
                            }
                        }
                        Item{
                            x:280
                            Text{
                                color:"#fff"
                                text:"THU"
                                font.pixelSize: 14
                            }
                            Text{
                                y:30
                                color:"#fff"
                                text:"Run 3 miles"
                            }
                        }
                        Item{
                            x:10
                            y:115
                            Text{
                                color:"#fff"
                                text:"FRI"
                                font.pixelSize: 14
                            }
                            Text{
                                y:30
                                color:"#fff"
                                text:"Take a break"
                            }
                        }
                        Item{
                            x:100
                            y:115
                            Text{
                                color:"#fff"
                                text:"SAT"
                                font.pixelSize: 14
                            }
                            Text{
                                y:30
                                color:"#fff"
                                text:"Run in park"
                            }
                            Text{
                                y:50
                                color:"#fff"
                                text:"Pick up chicks"
                            }
                        }
                        Item{
                            x:190
                            y:115
                            Text{
                                color:"#fff"
                                text:"SUN"
                                font.pixelSize: 14
                            }
                            Text{
                                y:30
                                color:"#fff"
                                text:"Interval Training"
                            }
                        }
                    }
                }
                Item{
                    x:10
                    y:26
                    id: content_healthSleep
                    visible: false
                    Text{
                        id: tab_healthSleep_Sleep
                        property string tabcolor: "#fff"
                        color:tabcolor
                        text: "Sleep"
                        font.pixelSize: 16
                    }
                    Item{
                        id: content_healthSleep_Sleep
                        x:116
                        Rectangle{
                            //155
                            y:97
                            x:70
                            width:36
                            height:58
                            color:"#000"
                            border.color:"#990000"
                            border.width:2
                            Item{
                                width:parent.width
                                height:20
                                Text{
                                    anchors.centerIn: parent
                                    text: parent.parent.height + "%"
                                    color: parent.parent.border.color
                                }
                            }
                        }
                        Rectangle{
                            //155
                            y:65
                            x:130
                            width:36
                            height:90
                            color:"#000"
                            border.color:"#fff"
                            border.width:2
                            Item{
                                width:parent.width
                                height:20
                                Text{
                                    anchors.centerIn: parent
                                    text: parent.parent.height + "%"
                                    color: parent.parent.border.color
                                }
                            }
                        }
                        Rectangle{
                            //155
                            y:56
                            x:190
                            width:36
                            height:99
                            color:"#000"
                            border.color:"#fff"
                            border.width:2
                            Item{
                                width:parent.width
                                height:20
                                Text{
                                    anchors.centerIn: parent
                                    text: parent.parent.height + "%"
                                    color: parent.parent.border.color
                                }
                            }
                        }
                        Item{
                            x: 60
                            y:156
                            width:60
                            height:55
                            Text{
                                anchors.centerIn: parent
                                text: "Sleep"
                                color:"#fff"
                            }
                        }
                        Item{
                            x: 120
                            y:156
                            width:60
                            height:55
                            Text{
                                anchors.centerIn: parent
                                text: "REM"
                                color:"#fff"
                            }
                        }
                        Item{
                            x: 180
                            y:156
                            width:60
                            height:55
                            Text{
                                anchors.centerIn: parent
                                text: "Efficiency"
                                color:"#fff"
                            }
                        }
                        Rectangle{
                            x:58
                            y:55
                            width:6
                            height:2
                        }
                        Text{
                            y:49
                            text:"Healthy"
                            color:"#fff"
                        }
                        Rectangle{
                            x: 60
                            y:4
                            width:2
                            height:150
                            color: "#fff"
                        }
                        Rectangle{
                            x: 60
                            y:154
                            width:300
                            height:2
                            color: "#fff"
                        }
                    }
                }
                Rectangle{
                    x:116
                    y:10
                    height:230
                    width:2
                }
            }
        }

        //Large Changing Room Window
        //Allows the user to put together an outfit
        WindowSize3{
            id: thirdOutfit
            text: "Outfit"
            visible: false
            Item{
                x:20
                y:39
                width:480
                height:260
                Item{
                    height:80
                    width:60
                    Rectangle{
                        width:60
                        height:60
                    }
                    Text{
                        anchors.bottom: parent.bottom
                        text:"Hat"
                        color:"#fff"
                    }
                }
                Item{
                    y:90
                    width:60
                    height:80
                    Rectangle{
                        width:60
                        height:60
                    }
                    Text{
                        anchors.bottom: parent.bottom
                        text:"Top Accessories"
                        color:"#fff"
                    }
                }
                Item{
                    y:180
                    width:60
                    height:80
                    Rectangle{
                        width:60
                        height:60
                    }
                    Text{
                        anchors.bottom: parent.bottom
                        text: "Shirt"
                        color:"#fff"
                    }
                }
                Item{
                    anchors.right: parent.right
                    width:60
                    height:80
                    Rectangle{
                        width:60
                        height:60
                    }
                    Text{
                        anchors.bottom: parent.bottom
                        text: "Accessories"
                        color:"#fff"
                    }
                }
                Item{
                    y:90
                    anchors.right: parent.right
                    height:80
                    width:60
                    Rectangle{
                        width:60
                        height:60
                    }
                    Text{
                        anchors.bottom: parent.bottom
                        text: "Underwear"
                        color:"#fff"
                    }
                }
                Item{
                    anchors.right: parent.right
                    y:180
                    width:60
                    height:80
                    Rectangle{
                        width:60
                        height:60
                    }
                    Text{
                        anchors.bottom: parent.bottom
                        text: "Legs"
                        color:"#fff"
                    }
                }
                Item{
                    y:180
                    x:140
                    height:80
                    width:60
                    Rectangle{
                        width:60
                        height:60
                    }
                    Text{
                        anchors.bottom: parent.bottom
                        text: "Socks"
                        color:"#fff"
                    }
                }
                Item{
                    x:280
                    y:180
                    width:60
                    height:80
                    Rectangle{
                        width:60
                        height:60
                    }
                    Text{
                        anchors.bottom: parent.bottom
                        text: "Shoes"
                        color:"#fff"
                    }
                }
            }
        }

        //Large stock window
        //Allows user to view stocks in detail and over time.
        WindowSize3{
            id: thirdStocks
            text: "Stocks"
            Item{
                x:20
                y:29
                width:480
                height:280
                Text{
                    id: stockCompany
                    font.pixelSize: 24
                    color: "#fff"
                }
                Text{
                    id: stockPrice
                    y: -10
                    anchors.right: parent.right
                    font.pixelSize: 24
                    color: "#fff"
                }
                Text{
                    id: stockChange
                    y:20
                    anchors.right: parent.right
                    font.pixelSize: 18
                    color: "#fff"
                }
                Rectangle{
                    y:44
                    height:2
                    width:480
                }
                Rectangle{
                    y:60
                    height:190
                    width:270
                    color:"#444"
                }
                Text{
                    x:280
                    y:60
                    font.pixelSize: 24
                    color:"#fff"
                    text: "Open:"
                }
                Text{
                    x:280
                    y:90
                    font.pixelSize: 24
                    color:"#fff"
                    text: "Low"
                }
                Text{
                    x:280
                    y:120
                    font.pixelSize: 24
                    color:"#fff"
                    text: "High"
                }
                Text{
                    anchors.right: parent.right
                    y:60
                    id: stockOpen
                    font.pixelSize: 24
                    color:"#fff"
                }
                Text{
                    anchors.right: parent.right
                    y:90
                    id: stockLow
                    font.pixelSize: 24
                    color:"#fff"
                }
                Text{
                    anchors.right: parent.right
                    y:120
                    id: stockHigh
                    font.pixelSize: 24
                    color:"#fff"
                }
                Text{
                    id: stockClosed
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    color:"#999"
                    font.pixelSize: 18
                }
            }
        }

        //Large weather window
        //Allows user to view stocks in detail and over time.
        WindowSize3{
            id: thirdWeather
            text: "Weather"

            Weather_View {
                id: weather_view1
                y: 219
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                visible: true
            }
        }

        //Large Preferences Window
        //Gives the user the ablility to set up Google account, Wifi Connections, location.
        WindowSize3{
            id: thirdPreferences
            text: "Preferences"
            Item{
                x: 10
                y: 29
                Rectangle{
                    y:10
                    width:500
                    height:230
                    color:"#000"
                    border.width:2
                    border.color:"#fff"
                    Item{
                        x:10
                        y:16
                        id: content_general
                        visible: true
                        Text{
                            color:"#fff"
                            text: "General"
                        }
                    }
                    Item{
                        x:10
                        y:16
                        id: content_google
                        visible: false
                        Text{
                            color:"#fff"
                            text: "Email"
                            font.pixelSize: 32
                        }
                        Text{
                            y:40
                            color:"#fff"
                            text: "Password"
                            font.pixelSize: 32
                        }
                        Rectangle{
                            x: 240
                            y:8
                            width:240
                            height:24
                            TextInput{
                                id: emailInput
                                text: email
                                width:240
                                height:24
                                font.pixelSize: 18
                            }
                        }
                        Rectangle{
                            x: 240
                            y:48
                            width:240
                            height:24
                            TextInput{
                                id:passwdInput
                                echoMode: TextInput.Password
                                text: passwd
                                width:240
                                height:24
                                font.pixelSize: 18
                            }
                        }
                    }
                    Item{
                        x:10
                        y:16
                        id: content_wifi
                        visible: false
                        Text{
                            color:"#fff"
                            text: "Wifi"
                        }
                    }
                }
                Tab{
                    x:10
                    id: tab_general
                    hexcolor: "#fff"
                    text:"General"
                    MouseArea{
                        anchors.fill: parent
                        onClicked: Handler.click_tab(parent.text)
                    }
                }
                Tab{
                    id: tab_google
                    x:122
                    hexcolor: "#444"
                    text:"Google"
                    MouseArea{
                        anchors.fill: parent
                        onClicked: Handler.click_tab(parent.text)
                    }
                }
                Tab{
                    id: tab_wifi
                    x:234
                    hexcolor: "#444"
                    text:"Wifi"
                    MouseArea{
                        anchors.fill: parent
                        onClicked: Handler.click_tab(parent.text)
                    }
                }
                Rectangle{
                    x: 290
                    y:250
                    width:100
                    height:30
                    radius: 5
                    color:"#000"
                    border.color: "#fff"
                    border.width: 2
                    Text{
                        anchors.centerIn: parent
                        text: "Save"
                        font.pixelSize: 18
                        color: "#fff"
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: Handler.click_save(emailInput.text,passwdInput.text)
                    }
                }
                Rectangle{
                    x: 400
                    y:250
                    width:100
                    height:30
                    radius: 5
                    color:"#000"
                    border.color: "#fff"
                    border.width: 2
                    Text{
                        anchors.centerIn: parent
                        text: "Close"
                        font.pixelSize: 18
                        color: "#fff"
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: Handler.click_secondlevel("Preferences")
                    }
                }
            }
        }

        //Large CTA Window
        //
        WindowSize3{
            id: thirdCTA
            text: "CTA"
            property string global_dir
            property string global_rt
            property string global_stpid
            Item{
                x:10
                y:29
                width:500
                height:270
                Item{
                    height:parent.height
                    width:200
                    Flickable{
                        id:ctaFlick
                        clip:true
                        anchors.fill: parent
                        contentWidth: ctaFlick.width
                        contentHeight: ctaRoutesXML.count*40
                        ListView {
                            id: view
                            height: ctaRoutesXML.count*40
                            model: ctaRoutesXML
                            delegate: ctaRoute
                          }
                        XmlListModel {
                             id: ctaRoutesXML
                             source: "http://www.ctabustracker.com/bustime/api/v1/getroutes?key=LbrUEWBqBjeepGRGRrkdriFYn"
                             query: "/bustime-response/route"
                             XmlRole { name: "rt"; query: "rt/string()" }
                             XmlRole { name: "rtnm"; query: "rtnm/string()" }
                         }
                        Component{
                            id:ctaRoute
                            Item{
                                height:40
                                width:160
                                Rectangle{
                                    width: 190
                                    height:30
                                    color:"#004444"
                                    radius: 5
                                    Text{
                                        x:10
                                        anchors.verticalCenter: parent.verticalCenter
                                        text:rt + " - "+rtnm
                                        color:"#fff"
                                        font.pixelSize: 12
                                    }
                                    MouseArea{
                                        anchors.fill: parent
                                        onClicked: Handler.ctabustracker("route",rt,parent)
                                    }
                                }
                            }
                        }
                    }
                }
                Rectangle{
                    width:2
                    height:parent.height
                    x:200
                }
                Item{
                    property string dir1
                    id: ctaDirContainer
                    visible: false;
                    x:210
                    width:30
                    height:parent.height
                    ListView {
                        id: dirView
                        model: ctaDirsXML
                        delegate: ctaDir
                      }
                    XmlListModel {
                         id: ctaDirsXML
                         source: "http://www.ctabustracker.com/bustime/api/v1/getdirections?key=LbrUEWBqBjeepGRGRrkdriFYn&rt=20"
                         query: "/bustime-response"
                         XmlRole { name: "dir"; query: "string()" }
                     }
                    Component{
                        id: ctaDir
                        Item{
                            Rectangle{
                                id: ctadir1
                                property string direction
                                color:"#004444"
                                height:130
                                width:30
                                radius:5
                                Text{
                                    id: ctadirtext1
                                    anchors.centerIn: parent
                                    //text: dir
                                    text:{var splitDir = dir.split(" ");
                                        splitDir[5] = splitDir[5].substr(0,5);
                                        splitDir[10] = splitDir[10].substr(0,5);
                                        ctadir1.direction=splitDir[4] + " " + splitDir[5];//4=5 9=10
                                            ctadirtext1.text = parent.direction.charAt(0);
                                        ctadir2.direction=splitDir[9] + " " + splitDir[10];//4=5 9=10
                                            ctadirtext2.text = ctadir2.direction.charAt(0);}
                                    font.pixelSize: 32
                                    color:"#fff"
                                }
                                MouseArea{
                                    anchors.fill: parent
                                    onClicked: Handler.ctabustracker("direction",parent.direction, parent)
                                }
                            }
                            Rectangle{
                                id: ctadir2
                                property string direction
                                y:140
                                color:"#004444"
                                height:130
                                width:30
                                radius:5
                                Text{
                                    id: ctadirtext2
                                    anchors.centerIn: parent
                                    font.pixelSize: 32
                                    color:"#fff"
                                }
                                MouseArea{
                                    anchors.fill: parent
                                    onClicked: Handler.ctabustracker("direction",parent.direction, parent)
                                }
                            }
                        }
                    }
                }
                Rectangle{
                    width:2
                    height:parent.height
                    x:250
                }
                Item{
                    id: ctaStopsContainer
                    x:262
                    width:238
                    height:parent.height
                    Flickable{
                        id:stopsFlick
                        clip:true
                        anchors.fill: parent
                        contentWidth: stopsFlick.width
                        contentHeight: ctaStopsXML.count*40
                        ListView {
                            id: ctaStops
                            height: ctaStopsXML.count*40
                            model: ctaStopsXML
                            delegate: ctaStop
                          }
                        XmlListModel {
                             id: ctaStopsXML
                             source: "http://www.ctabustracker.com/bustime/api/v1/getstops?key=LbrUEWBqBjeepGRGRrkdriFYn&rt=20&dir=East%20Bound"
                             query: "/bustime-response/stop"
                             XmlRole { name: "stpid"; query: "stpid/string()" }
                             XmlRole { name: "stpnm"; query: "stpnm/string()" }
                         }
                        Component{
                            id:ctaStop
                            Item{
                                height:40
                                width:240
                                Rectangle{
                                    width: 238
                                    height:30
                                    color:"#004444"
                                    radius: 5
                                    Text{
                                        x:10
                                        anchors.verticalCenter: parent.verticalCenter
                                        text:stpnm
                                        color:"#fff"
                                        font.pixelSize: 12
                                    }
                                    MouseArea{
                                        anchors.fill: parent
                                        onClicked: Handler.ctabustracker("stop", stpid, parent)
                                    }
                                }
                            }
                        }
                    }
                }
                Rectangle{
                    id: stopsCover
                    x:262
                    width:238
                    height:parent.height
                    color:"#000"
                }
            }
        }

        //Large Calendar Window
        //
        WindowSize3{
            id: thirdCalendar
            text: "Calendar"
            Calendar_View {
                id: calendar_view1
                y: 49
                width: 518
                height: 248
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 2
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                visible: true
            }
        }

        //Large Todo Window
        //
        WindowSize3{
            id: thirdTodo
            text: "Todo List"
        }

        //CTA Tracker/Traffic Information Quick Window
        //Viewable information of traveling in Chicago
        PermanentWindow{
            id: firstCTA
            hexcolor:"#444"
            text:"CTA"
            x:784
            y:110
            Item{
                id: ctaDisplay
                x:10
                y:20
                height:170
                width:220
                //color:"#222"
                //INSERT CTA APPLICATION HERE
            }
        }

        //Calendar Window 1
        //View of what to do today
        PermanentWindow{
            id: firstCalendar
            hexcolor:"#444"
            text:"Calendar"
            x:784
            y:320

            Item{
                x:10
                y:20
                height:170
                width:220

                Calendar_Mini {
                    id: calendar_mini1
                    x: 10
                    y: 20
                    anchors.fill: parent
                    }
                //color:"#222"
                //INSERT CALENDAR APPLICATION HERE
            }
            MouseArea {
                id: mouse_area1
                anchors.fill: parent
                onClicked:{
                    console.log('show/hide calendar');
                    Handler.click_secondlevel(firstCalendar.text);
                }
            }
        }

        //Todo List Window 1
        //Things the user wants to do/should do according to the application

        PermanentWindow{
            id: firstTodo
            hexcolor:"#444"
            text:"Todo List"
            x:784
            y:530
            Item{
                id: todoDisplay
                x:10
                y:20
                height:170
                width:220
                //color:"#222"
                //INSERT TODOLIST APPLICATION HERE
                Item{
                    Rectangle{
                        width:8
                        height:8
                        border.width:2
                        border.color:"#fff"
                        color:firstTodo.hexcolor
                    }
                    Text{
                        x:30
                        color: "#fff"
                        text: "Get Ready (Brush Teeth, Shower)"
                    }
                }
                Item{
                    y:20
                    Rectangle{
                        width:8
                        height:8
                        border.width:2
                        border.color:"#fff"
                        color:firstTodo.hexcolor
                    }
                    Text{
                        x:30
                        color: "#fff"
                        text: "Medicine (Ridlin, Alleve)"
                    }
                }
                Item{
                    y:40
                    Rectangle{
                        width:8
                        height:8
                        border.width:2
                        border.color:"#fff"
                        color:firstTodo.hexcolor
                    }
                    Text{
                        x:30
                        color: "#fff"
                        text: "Exercise (Pushups)"
                    }
                }
                Item{
                    y:60
                    Rectangle{
                        width:8
                        height:8
                        border.width:2
                        border.color:"#990000"
                        color:firstTodo.hexcolor
                    }
                    Text{
                        x:30
                        color: "#fff"
                        text: "Laundry (Underwear,Shirts)"
                    }
                }
                Item{
                    y:80
                    Rectangle{
                        width:8
                        height:8
                        border.width:2
                        border.color:"#990000"
                        color:firstTodo.hexcolor
                    }
                    Text{
                        x:30
                        color: "#fff"
                        text: "Refill Prescription (Ridlin)"
                    }
                }
            }
        }

    }
    /*Clocks_View {
        id: clocks_view1
        x:250
        y:110
        visible: false;
    }
    */
}
