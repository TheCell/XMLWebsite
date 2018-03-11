<?php

$get = "";

function alreadyReserved()
{

}


//Check whether the form has been submitted
if (isset($_POST)) {
    $xml = simplexml_load_file('..\DBs\reservationsDB.xml');


    foreach ($xml->reservation as $id) {

        if ($id->entityID == $_POST['ID']) {
            if (new DateTime($id->dateFrom) <= new DateTime($_POST['dateFrom']) && new DateTime($id->dateTo) >= new DateTime($_POST['dateFrom']) || new DateTime($id->dateFrom) <= new DateTime($_POST['dateTo']) && new DateTime($id->dateTo) >= new DateTime($_POST['dateTo'])) {
                if (new DateTime($id->timeFrom) <= new DateTime($_POST['timeFrom']) && new DateTime($id->timeTo) >= new DateTime($_POST['timeFrom']) || (new DateTime($id->timeFrom) >= new DateTime($_POST['timeTo']) && new DateTime($id->timeTo) >= new DateTime($_POST['timeTo']))) {
                    header("location: Reservation.php#feedbacknegativ");
                    exit;
                }
            }
        }
        $res = $xml->addChild("reservation");
        $res->addChild("username", $_POST['username']);
        $res->addChild("dateFrom", $_POST['dateFrom']);
        $res->addChild("dateTo", $_POST['dateTo']);
        $res->addChild("timeFrom", $_POST['timeFrom'] . ":00");
        $res->addChild("timeTo", $_POST['timeTo'] . ":00");
        $res->addChild("note", $_POST['note']);
        $res->addChild("entityID", $_POST['ID']);
        $xml->asXML('..\DBs\reservationsDB.xml');
        header("Location: Reservation.php#feedbackpositiv");
        exit;
    }
}