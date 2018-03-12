var xml;
var xsl;
var xmlready = false;
var filepath = "";

function init() {
    var buildings = document.getElementsByClassName("building");
    for (var i = 0; i < buildings.length; i++) {
        buildings[i].addEventListener("click", function(){
            console.log(this.id + " got clicked");
            getContent(this.id);
        });
    }
}

function loadXMLDoc(file)
{
    if (window.ActiveXObject)
    {
        xhttp = new ActiveXObject("Msxml2.XMLHTTP");
    } else
    {
        xhttp = new XMLHttpRequest();
    }
    xhttp.open("GET", file);
    
    xhttp.onload = function (e) {
        if (xmlready === true) {
            console.log("xml is ready, lets get xsl");
            xsl = xhttp.responseXML;
            xmlready = false;
            showContent();
        } else {
            console.log("lets get xml");
            xml = xhttp.responseXML;
            xmlready = true;
            loadXMLDoc(filepath+".xsl");
        }
    };
    
//    try {
//        xhttp.responseType = "document";
//    } catch (err) {
//        console.log("Coult not load xml-file:" + err);
//    } // Helping IE11
    xhttp.send(null);
}

function getContent(filename)
{
    filepath = "map/"+filename;
    loadXMLDoc(filepath+".xml");
}

function showContent () {
    // code for IE
//    if (window.ActiveXObject || xhttp.responseType === "document")
//    {
//        ex = xml.transformNode(xsl);
//        document.getElementById("buildingoutput").innerHTML = ex;
//    }
    // code for Chrome, Firefox, Opera, etc.
    if (document.implementation && document.implementation.createDocument)
    {
//        console.log("chrome, firefox, opera");
//        var xmlprint = new XMLSerializer().serializeToString(xml.documentElement);
//        var xslprint = new XMLSerializer().serializeToString(xsl.documentElement);
//        console.log("xml: "+xmlprint);
//        console.log("xsl: "+xslprint);
        xsltProcessor = new XSLTProcessor();
        xsltProcessor.importStylesheet(xsl);
        resultDocument = xsltProcessor.transformToFragment(xml, document);
//        console.log("result: "+resultDocument.nodeValue);
        if(document.getElementById("buildingoutput") !== null) {
            var item = document.getElementById("buildinginfo");
            if (item === null) {
                document.getElementById("buildingoutput").appendChild(resultDocument);
            } else {
                item.replaceWith(resultDocument);
            }
        }
    }
    document.getElementById("buildingoutput").style.display = "block";
}

function showRoomDetail (item) {
    console.log(item);
    if (item !== null) {
        item.nextSibling.style.display = 'block';
        item.style.display = 'none';
        item.parentNode.lastChild.style.display = 'block';
    }
}

function hideRoomDetail(item) {
    console.log(item);
    if (item !== null) {
        item.previousSibling.style.display = 'block';
        item.style.display = 'none';
        item.parentNode.lastChild.style.display = 'none';
    }
}