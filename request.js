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
