function googleLogin_Request(artist, song) {
    //lyricsResultListModel.clear()
    var doc = new XMLHttpRequest();
    doc.onreadystatechange = function() {
                if (doc.readyState === XMLHttpRequest.HEADERS_RECEIVED) {
                    //console.log(doc.getAllResponseHeaders);
                } else if (doc.readyState === XMLHttpRequest.DONE) {
                    var a = doc.responseXML.documentElement;
                    console.log(a.toString);
                    //googleLogin_Parse(a.childNodes);
                }
            }
    doc.open("POST", "https://www.google.com/accounts/ClientLogin");
    doc.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    doc.send("accountType=HOSTED_OR_GOOGLE&Email=paulrealsane@gmail.com&Passwd=fantasy90&service=mail&source=Superjova-mirror-1");
}
/*
function googleLogin_Parse(lyricsNode) {
    var lyricsItemData = {}
    for(var ii = 1;ii<lyricsNode.length;ii+=2)
    {
        var resource = lyricsNode[ii].childNodes
        var o = new Object()
        for(var ik = 1;ik<resource.length;ik+=2)
        {
            if(resource[ik].nodeName === "Artist")
            {
                lyricsItemData.artist = resource[ik].firstChild.nodeValue
            }
            if(resource[ik].nodeName === "Song")
            {
                lyricsItemData.song = resource[ik].firstChild.nodeValue
            }
            if(resource[ik].nodeName === "SongUrl")
            {
                lyricsItemData.song_url = resource[ik].firstChild.nodeValue
            }
        }
        if(lyricsItemData.artist)
            lyricsResultListModel.append(lyricsItemData)
    }
}
*/
