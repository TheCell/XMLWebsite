<?php

function alreadyReserved()
{

}

//Check whether the form has been submitted
if (!empty($_POST)) {
    $xml = new SimpleXMLElement("../DBs/reservationsDB.xml");


    foreach ($xml->reservation as $id) {
        if ($id->entityID == $_POST['eId'] && (($id->dateFrom <= $_POST['dateFrom'] && $id->dateTo >= $_POST['dateFrom']) || ($id->dateFrom <= $_POST['dateTo'] && $id->dateTo >= $_POST['dateTo'])) && (($id->timeFrom <= $_POST['timeFrom'] && $id->timeTo >= $_POST['timeFrom']) || ($id->timeFrom >= $_POST['timeTo'] && $id->timeTo >= $_POST['timeTo']))) {
            alreadyReserved();
        }
    }
    $res = $xml->addChild("reservation");
    $res->addChild("dateFrom", $_POST['dateFrom']);
    $res->addChild("dateTo", $_POST['dateTo']);
    $res->addChild("timeFrom", $_POST['timeFrom'].":00");
    $res->addChild("timeTo", $_POST['timeTo'].":00");
    $res->addChild("entityID", $_POST['eId']);

   /*<dateFrom>2018-11-23</dateFrom>
        <dateTo>2018-11-30</dateTo>
        <timeFrom>09:00:00</timeFrom>
        <timeTo>12:00:00</timeTo>
        <note></note>
        <user>U987</user>
        <entityID>E034</entityID>
   */
   //Let's now print out the received values in the browser
   echo "Your name: {$_POST['username']}<br />";
   echo "Date from: {$_POST['dateFrom']}<br />";
   echo "Date to: {$_POST['dateTo']}<br /><br />";
   echo "Time from:<br />{$_POST['timeFrom']}<br /><br />";
   echo "time to: {$_POST['timeTo']}<br />";
   echo "note: {$_POST['note']}<br />";
} else {
    echo "You can't see this page without submitting the form.";
}
?>
<html content="application/xml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>Sportzentrum Hopfendorf</title>
    <link rel="stylesheet" type="text/css" href="resStyle.css"/>
    <link rel="php" type="php" href="process.php"/>
</head>