<?php

function alreadyReserved()
{

}



//Check whether the form has been submitted
if (!empty($_POST)) {
    $xml = new SimpleXMLElement('..\DBs\reservationsDB.xml');


    foreach ($xml->reservation as $id) {
        if ($id->entityID == $_POST['eId'] && (($id->dateFrom <= $_POST['dateFrom'] && $id->dateTo >= $_POST['dateFrom']) || ($id->dateFrom <= $_POST['dateTo'] && $id->dateTo >= $_POST['dateTo'])) && (($id->timeFrom <= $_POST['timeFrom'] && $id->timeTo >= $_POST['timeFrom']) || ($id->timeFrom >= $_POST['timeTo'] && $id->timeTo >= $_POST['timeTo']))) {
            alreadyReserved();
        }
    }
    $res = $xml->addChild("reservation");
    $res->addChild("dateFrom", $_POST['dateFrom']);
    $res->addChild("dateTo", $_POST['dateTo']);
    $res->addChild("timeFrom", $_POST['timeFrom'] . ":00");
    $res->addChild("timeTo", $_POST['timeTo'] . ":00");
    $res->addChild("entityID", $_POST['eId']);

}
?>
<html content="application/xml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>Sportzentrum Hopfendorf</title>
    <link rel="stylesheet" type="text/css" href="resStyle.css"/>
    <link rel="php" type="php" href="process.php"/>
</head>