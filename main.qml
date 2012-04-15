// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "mirrorjs.js" as Handler
import "request.js" as HTTP
//testtest
Rectangle {
    id:home
    property string email: ""
    property string passwd: ""
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
    Header{
        id:topright
        hexcolor:"#444"
        x:570
        y:-40
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
                    symbol: "GNW"
                }
                Stock{
                    y:100
                    symbol: "FORD"
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
            }
            Tab{
                id: tab_healthMedicine
                x:122
                hexcolor: "#444"
                text:"Medicine"
            }
            Tab{
                id: tab_healthExercise
                x:234
                hexcolor: "#444"
                text:"Exercise"
            }
            Tab{
                id: tab_healthSleep
                x:346
                hexcolor: "#444"
                text:"Sleep"
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
                        onClicked: Handler.click_healthTab("vitamin")
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
                        onClicked: Handler.click_healthTab("suggest")
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
            }
            Tab{
                id: tab_google
                x:122
                hexcolor: "#444"
                text:"Google"
            }
            Tab{
                id: tab_wifi
                x:234
                hexcolor: "#444"
                text:"Wifi"
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
            x:10
            y:20
            height:170
            width:220
            //color:"#222"
            //INSERT TODOLIST APPLICATION HERE
        }
    }

}
