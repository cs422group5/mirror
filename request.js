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


function googleFinance(id, ticker){
    var doc = new XMLHttpRequest();
    doc.onreadystatechange = function() {
            if (doc.readyState == XMLHttpRequest.HEADERS_RECEIVED) {
                //console.log(doc.getAllResponseHeaders());
            } else if (doc.readyState == XMLHttpRequest.DONE) {
                var a = doc.responseText;
                a = a.slice(a.indexOf("["));
                a = eval('(' + a + ')');
                //l_cur = current price
                //c = change
                //op = open
                //hi = high
                //lo = low
                id.change = a[0].c;
                id.value = a[0].l_cur;
                id.low = a[0].lo;
                id.high = a[0].hi;
                id.closed = a[0].lt;
                id.company = a[0].name;
                id.market = a[0].e;
                id.open = a[0].op;
            }
        }
    doc.open("GET", "http://www.google.com/finance/info?infotype=infoquoteall&q="+ticker, true);
    //doc.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    doc.send();
}

function ctabustracker(id){
    var doc = new XMLHttpRequest();
    doc.onreadystatechange = function() {
            if (doc.readyState == XMLHttpRequest.HEADERS_RECEIVED) {
                //console.log(doc.getAllResponseHeaders());
            } else if (doc.readyState == XMLHttpRequest.DONE) {
                var a = doc.responseText;
                var stopname = "Not Operating"
                if (a.indexOf("<stpnm>") > 0){
                    stopname = a.substring(a.indexOf("<stpnm>")+7, a.indexOf("</stpnm>"));
                    stopname=stopname.replace("&amp;","&");
                }
                id.stop = stopname;
                var eta = "N/A";
                //console.log(a);
                if (a.indexOf("<prdtm>") > 0){
                    var hours = parseInt(a.substr(a.indexOf("<tmstmp>")+17,2));
                    var minutes = parseInt(a.substr(a.indexOf("<tmstmp>")+20,2));
                    var start = a.indexOf("<prdtm>")+16;
                    console.log(hours);
                    console.log(minutes);
                    console.log(parseInt(a.substr(start,2)));
                    console.log(parseInt(a.substr(start+3,2)));
                    eta = parseInt(a.substr(start,2))*60+parseInt(a.substr(start+3,2)) - (hours*60+minutes);
                    if (eta == 0)
                        eta = "Due";
                    id.eta = eta;
                }
                /*var routename = id.route;
                if (a.indexOf("<stpnm>")>0)
                {
                    routename = a.substring(a.indexOf("<stpnm>")+7, a.indexOf("</stpnm>"));
                }*/
            }
        }
    doc.open("GET", "http://www.ctabustracker.com/bustime/api/v1/getpredictions?key=LbrUEWBqBjeepGRGRrkdriFYn&rt="+id.route+"&stpid="+id.stpid, true);
    //doc.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    doc.send();
}
