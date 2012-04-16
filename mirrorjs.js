var firstComponent;
var secondComponent;
var leftbar = ['Health','Outfit','Stocks','Music','TV'];
var leftbaropen = [null,null,null,null,null]

var nexty = 0;
var oldRoute;
var oldDirection;

function ctabustracker(clicked, value, id){
    if (clicked == "route" && oldRoute != id){
        id.color = "#009999";
        if (oldRoute)
        oldRoute.color = "#004444";
        oldRoute = id;
        ctaDirsXML.source = "http://www.ctabustracker.com/bustime/api/v1/getdirections?key=LbrUEWBqBjeepGRGRrkdriFYn&rt="+value;
        if (!ctaDirContainer.visible)
            ctaDirContainer.visible = true;
        if (!stopsCover.visible){
            stopsCover.visible = true;
        }
        thirdCTA.global_rt = value;
    }
    else if (clicked=="direction" && oldDirection != id){
        id.color = "#009999";
        if (oldDirection)
        oldDirection.color = "#004444";
        oldDirection = id;
        ctaStopsXML.source = "http://www.ctabustracker.com/bustime/api/v1/getstops?key=LbrUEWBqBjeepGRGRrkdriFYn&rt="+thirdCTA.global_rt+"&dir="+value;
        if (stopsCover.visible){
            stopsCover.visible = false;
        }
        thirdCTA.global_dir = value;
    }
    else if(clicked == "stop"){
        console.log("Here");
        thirdCTA.global_stpid = value;
        if (secondComponent == null)
            secondComponent = Qt.createComponent("../mirror/CTATracker.qml");

        if (secondComponent.status == Component.Ready) {
            var dynamicObject2 = secondComponent.createObject(ctaDisplay);
            if (dynamicObject2 == null) {
                console.log("error creating click");
                console.log(component.errorString());
                return false;
            }
            dynamicObject2.y = nexty;
            dynamicObject2.route = thirdCTA.global_rt;
            dynamicObject2.stpid = value;
            nexty+=40;
        } else {
            console.log("error loading click component");
            console.log(component.errorString());
            return false;
        }
    }
}

function click_tabHealth(tab){
    tab_healthNutrients.hexcolor = "#444";
    tab_healthMedicine.hexcolor = "#444";
    tab_healthExercise.hexcolor = "#444";
    tab_healthSleep.hexcolor = "#444";
    content_healthNutrients.visible = false;
    content_healthMedicine.visible = false;
    content_healthExercise.visible = false;
    content_healthSleep.visible = false;
    if (tab == "Nutrients"){
        tab_healthNutrients.hexcolor = "#fff";
        content_healthNutrients.visible = true;
    }
    else if (tab == "Medicine"){
        tab_healthMedicine.hexcolor = "#fff";
        content_healthMedicine.visible = true;
    }
    else if (tab == "Exercise"){
        tab_healthExercise.hexcolor = "#fff";
        content_healthExercise.visible = true;
    }
    else if (tab == "Sleep"){
        tab_healthSleep.hexcolor = "#fff";
        content_healthSleep.visible = true;
    }
}

function click_stock(id){
    console.log("Here");
    if (!thirdStocks.visible){
        click_secondlevel("Stocks");
    }
    stockCompany.text = id.company + " ("+id.market+")";
    stockPrice.text = id.value;
    if (id.change < 0){
        stockChange.text = "(" + id.change + ")";
        stockChange.color = "#990000";
    }
    else{
        stockChange.text = "(+" + id.change + ")";
        stockChange.color = "#009900";
    }
    stockClosed.text = "Last Updated: "+id.closed;
    stockOpen.text = id.open;
    stockLow.text = id.low;
    stockHigh.text = id.high;
}

function click_subVitamins(tab){
    tab_healthNutrients_Suggest.tabcolor = "#444";
    tab_healthNutrients_Vit.tabcolor = "#444";
    content_healthNutrients_Suggest.visible = false;
    content_healthNutrients_Vit.visible = false;

    if (tab == "vitamin"){
        tab_healthNutrients_Vit.tabcolor = "#fff";
        content_healthNutrients_Vit.visible = true;
    }
    else{
        tab_healthNutrients_Suggest.tabcolor = "#fff";
        content_healthNutrients_Suggest.visible = true;
    }
}

function click_subMedicine(tab){
    tab_healthMedicine_Schedule.tabcolor = "#444";
    tab_healthMedicine_PillsLeft.tabcolor = "#444";
    content_healthMedicine_Schedule.visible = false;
    content_healthMedicine_PillsLeft.visible = false;
    if (tab == "Schedule"){
        tab_healthMedicine_Schedule.tabcolor = "#fff";
        content_healthMedicine_Schedule.visible = true;
    }
    else{
        tab_healthMedicine_PillsLeft.tabcolor = "#fff";
        content_healthMedicine_PillsLeft.visible = true;
    }
}

function click_subExercise(tab){
    tab_healthExercise_Stats.tabcolor = "#444";
    tab_healthExercise_Suggestions.tabcolor = "#444";
    content_healthExercise_Stats.visible = false;
    content_healthExercise_Suggestions.visible = false;
    if (tab == "Stats"){
        tab_healthExercise_Stats.tabcolor = "#fff";
        content_healthExercise_Stats.visible = true;
    }
    else{
        tab_healthExercise_Suggestions.tabcolor = "#fff";
        content_healthExercise_Suggestions.visible = true;
    }
}

function click_health(tab){
    if (tab_health.tabcolor == "#fff"){
        tab_health.tabcolor = "#444";
        content_health.visible = false;
        console.log("Health erased");
    }
    else if (tab_exercise.tabcolor == "#fff"){
        tab_exercise.tabcolor = "#444";
        content_exercise.visible = false;
        console.log("Ex erased");
    }
    else{
        tab_sleep.tabcolor = "#444";
        content_sleep.visible = false;
        console.log("Sleep erased");
    }
    if (tab == "Health"){
        tab_health.tabcolor = "#fff";
        content_health.visible = true;
    }
    else if (tab == "Exercise"){
        tab_exercise.tabcolor = "#fff";
        content_exercise.visible = true;
    }
    else{
        tab_sleep.tabcolor = "#fff";
        content_sleep.visible = true;
    }
}

function click_save(newEmail, newPasswd){
    email = newEmail;
    passwd = newPasswd;
    click_secondlevel("Preferences");
    googleLogin_Request("cl",email, passwd);
    googleLogin_Request("finance",email, passwd);
}

function click_tab(tab){
    tab_general.hexcolor = "#444";
    tab_google.hexcolor = "#444";
    tab_wifi.hexcolor = "#444";
    content_general.visible = false;
    content_google.visible = false;
    content_wifi.visible = false;
    if (tab == "General"){
        if (tab_general.hexcolor == "#444"){
            tab_general.hexcolor = "#fff";
            content_general.visible = true;
        }
    }
    else if (tab == "Google"){
        if (tab_google.hexcolor == "#444"){
            tab_google.hexcolor = "#fff";
            content_google.visible = true;
        }
    }
    else{
        if (tab_wifi.hexcolor == "#444"){
            tab_wifi.hexcolor = "#fff";
            content_wifi.visible = true;
        }
    }
}

function click_secondlevel(app){
    var healthopen = thirdHealth.visible;
    var outfitopen = thirdOutfit.visible;
    var stocksopen = thirdStocks.visible;
    var preferencesopen = thirdPreferences.visible;
    var ctaopen = thirdCTA.visible;
    var calendaropen = thirdCalendar.visible;
    var todoopen = thirdTodo.visible;
    var weatheropen = thirdWeather.visible;

    thirdHealth.visible = false;
    thirdOutfit.visible = false;
    thirdStocks.visible = false;
    thirdPreferences.visible = false;
    thirdCTA.visible = false;
    thirdCalendar.visible = false;
    thirdTodo.visible = false;
    thirdWeather.visible = false;
    secondHealth.hexcolor = "#222";
    secondOutfit.hexcolor = "#222";
    secondStocks.hexcolor = "#222";
    secondWeather.hexcolor = "#444";
    firstPreferences.hexcolor = "#444";
    firstCTA.hexcolor = "#444";
    firstCalendar.hexcolor = "#444";
    firstTodo.hexcolor = "#444";
    if (secondHealth.visible){
        firstHealth.hexcolor = "#222";
    }
    if (secondOutfit.visible)
        firstOutfit.hexcolor = "#222";
    if (secondStocks.visible)
        firstStocks.hexcolor = "#222";

    if (app == "Health"){
        thirdHealth.visible = !healthopen;
        if (thirdHealth.visible){
            secondHealth.hexcolor = "#000";
            firstHealth.hexcolor = "#000";
        }
        else{
            secondHealth.hexcolor = "#222";
            firstHealth.hexcolor = "#222";
        }
    }
    else if (app == "Outfit"){
        thirdOutfit.visible = !outfitopen;
        if (thirdOutfit.visible){
            secondOutfit.hexcolor = "#000";
            firstOutfit.hexcolor = "#000";
        }
        else{
            secondOutfit.hexcolor = "#222";
            firstOutfit.hexcolor = "#222";
        }
    }
    else if(app == "Stocks"){
        thirdStocks.visible = !stocksopen;
        if (thirdStocks.visible){
            secondStocks.hexcolor = "#000";
            firstStocks.hexcolor = "#000";
        }
        else{
            secondStocks.hexcolor = "#222";
            firstStocks.hexcolor = "#222";
        }
    }
    else if(app == "CTA"){
        thirdCTA.visible = !ctaopen;
        if (thirdCTA.visible){
            firstCTA.hexcolor = "#000";
        }
        else{
            firstCTA.hexcolor = "#444";
        }
    }
    else if(app == "Calendar"){
        thirdCalendar.visible = !calendaropen;
        if (thirdCalendar.visible){
            firstCalendar.hexcolor = "#000";
        }
        else{
            firstCalendar.hexcolor = "#444";
        }
    }
    else if(app == "Todo List"){

    }
    else if(app == "Weather"){
        thirdWeather.visible = !weatheropen;
        if (thirdWeather.visible){
            secondWeather.hexcolor = "#000";
        }
        else{
            secondWeather.hexcolor = "#444";
        }
    }
    else{
        thirdPreferences.visible = !preferencesopen;
        if (thirdPreferences.visible){
            firstPreferences.hexcolor = "#000";
        }
        else{
            firstPreferences.hexcolor = "#444";
        }
    }
}

function click_icon(app){
    var yPos = 0;
    var open = 0;
    var count = 0;
    //console.log(leftbaropen.length);
    //while (leftbar[count] != app && count < 4){
     //   ++count;
    //}
    if (app == "Health"){
        if (secondHealth.visible == false){
            firstHealth.hexcolor = "#222";
            secondHealth.visible = true;
        }
        else{
            firstHealth.hexcolor = "#444";
            secondHealth.visible = false;
            if (thirdHealth.visible){
                secondHealth.hexcolor = "#222";
                thirdHealth.visible = false;
            }
        }
    }
    else if(app == "Outfit"){
        if (secondOutfit.visible == false){
            firstOutfit.hexcolor = "#222";
            secondOutfit.visible = true;
        }
        else{
            firstOutfit.hexcolor = "#444";
            secondOutfit.visible = false;
            if (thirdOutfit){
                thirdOutfit.visible = false;
                secondOutfit.hexcolor = "#222";
            }
        }
    }
    else if(app == "Stocks"){
        if (secondStocks.visible == false){
            firstStocks.hexcolor = "#222";
            secondStocks.visible = true;
        }
        else{
            firstStocks.hexcolor = "#444";
            secondStocks.visible = false;
            if (thirdStocks.visible){
                thirdStocks.visible = false;
                secondStocks.hexcolor = "#222";
            }
        }
    }
    else if(app == "Music"){
        if (secondMusic.visible == false){
            if(secondTV.visible == true){
                firstTV.hexcolor = "#444";
                secondTV.visible = false;
            }
            firstMusic.hexcolor = "#000";
            secondMusic.visible = true;
        }
        else{
            firstMusic.hexcolor = "#444";
            secondMusic.visible = false;
        }
    }
    else if(app == "TV"){
        if (secondTV.visible == false){
            if(secondMusic.visible == true){
                firstMusic.hexcolor = "#444";
                secondMusic.visible = false;
            }
            firstTV.hexcolor = "#000";
            secondTV.visible = true;
        }
        else{
            firstTV.hexcolor = "#444";
            secondTV.visible = false;
        }
    }
    else{
        if (thirdHealth.visible){
            thirdHealth.visible = false;
            secondHealth.hexcolor = "#222";
            firstHealth.hexcolor = "#222";
        }
        else if (thirdOutfit.visible){
            thirdOutfit.visible = false;
            secondOutfit.hexcolor = "#222";
            firstOutfit.hexcolor = "#222";
        }
        else if (thirdStocks.visible){
            thirdStocks.visible = false;
            secondStocks.hexcolor = "#222";
            firstStocks.hexcolor = "#222";
        }
        else if (thirdCalendar.visible){
            thirdCalendar.visible = false;
            firstCalendar.hexcolor = "#444";
        }
        else if (thirdCTA.visible){
            thirdCTA.visible = false;
            firstCTA.hexcolor = "#444";
        }


        if (!thirdPreferences.visible){
            firstPreferences.hexcolor = "#000";
            thirdPreferences.visible = true;
        }
        else{
            firstPreferences.hexcolor = "#444";
            thirdPreferences.visible = false;
        }
    }

    /*
    if (leftbaropen[count] != null){
        open = 1;
        console.log("Does this work? " + leftbaropen[count]);
        leftbaropen[count].destroy();
        leftbaropen[count] = null;
    }
    else{
        yPos = 110 + count*110;
        if (count == 4){
            yPos-=110;
        }
    //  leftbar[count].color = "#000";
    }
    if (open == 0){
        var path;
        if (count < 3){
            path = "../mirror/WindowSize2.qml";
        }
        else{
            path = "../mirror/Music_TV_Window.qml";
            if (count == 3){
                console.log("3 was created 4=" + leftbaropen[4]);
                if (leftbaropen[4] != null){
                    console.log("4 should be deleted");
                    leftbaropen[4].destroy();
                    leftbaropen[4] = null;
                }
            }
            else{
                console.log("4 was created 3=" + leftbaropen[3]);
                if (leftbaropen[3] != null){
                    console.log("3 should be deleted");
                    leftbaropen[3].destroy();
                    leftbaropen[3] = null;
                }
            }
        }
        if (secondComponent == null)
            secondComponent = Qt.createComponent(path);

        if (secondComponent.status == Component.Ready) {
            var dynamicObject2 = secondComponent.createObject(home);
            if (dynamicObject2 == null) {
                console.log("error creating click");
                console.log(component.errorString());
                return false;
            }
            dynamicObject2.x = 70;
            dynamicObject2.y = yPos;
            dynamicObject2.iden = app + count;
            if (count == 3)
                dynamicObject2.color = "#134089";
            console.log(leftbaropen[count]);
            leftbaropen[count] = dynamicObject2;
            console.log(leftbaropen[count]);
        } else {
            console.log("error loading click component");
            console.log(component.errorString());
            return false;
        }
    }
    console.log(count);
    for (var i = 0; i < leftbaropen.length; ++i){
        console.log("leftbaropen[" + i + "] = " + leftbaropen[i]);
    }
    */
}

function googleLogin_Request(service, Email, Passwd) {
    var doc = new XMLHttpRequest();
    doc.onreadystatechange = function() {
            if (doc.readyState == XMLHttpRequest.HEADERS_RECEIVED) {
                //console.log(doc.getAllResponseHeaders());
            } else if (doc.readyState == XMLHttpRequest.DONE) {
                var a = doc.responseText;
                if (service == "finance"){
                    authTokenFinance = a.slice(a.indexOf('Auth')+5);
                }
                else if (service == "cl"){
                    authTokenCalendar = a.slice(a.indexOf('Auth')+5);
                }
            }
        }
    doc.open("POST", "https://www.google.com/accounts/ClientLogin", true);
    doc.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    doc.send("accountType=HOSTED_OR_GOOGLE&Email="+Email+"&Passwd="+Passwd+"&service="+service+"&source=Superjova-mirror-1");
}


