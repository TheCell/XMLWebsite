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
    xhttp.open("GET", file, false);
    try {
        xhttp.responseType = "msxml-document";
    } catch (err) {
        console.log("Coult not load xml-file");
    } // Helping IE11
    xhttp.send("");
    return xhttp.responseXML;
}

function getContent(filename)
{
    xml = loadXMLDoc("map/"+filename+".xml");
    xsl = loadXMLDoc("map/"+filename+".xsl");
    // code for IE
    if (window.ActiveXObject || xhttp.responseType == "msxml-document")
    {
        ex = xml.transformNode(xsl);
        document.getElementById("buildingoutput").innerHTML = ex;
    }
    // code for Chrome, Firefox, Opera, etc.
    else if (document.implementation && document.implementation.createDocument)
    {
        xsltProcessor = new XSLTProcessor();
        xsltProcessor.importStylesheet(xsl);
        resultDocument = xsltProcessor.transformToFragment(xml, document);
        document.getElementById("buildingoutput").appendChild(resultDocument);
    }
}