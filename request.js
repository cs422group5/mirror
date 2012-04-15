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

function ctabustracker(){
    var doc = new XMLHttpRequest();
    doc.onreadystatechange = function() {
            if (doc.readyState == XMLHttpRequest.HEADERS_RECEIVED) {
                //console.log(doc.getAllResponseHeaders());
            } else if (doc.readyState == XMLHttpRequest.DONE) {
                var a = doc.responseText;
                console.log(a);
            }
        }
    doc.open("GET", "http://www.ctabustracker.com/bustime/api/v1/getroutes?key=LbrUEWBqBjeepGRGRrkdriFYn", true);
    //doc.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    doc.send();
}
