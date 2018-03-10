<?php
$recommendedFor = filter_input(INPUT_GET, 'recommendedFor', FILTER_SANITIZE_STRING);

// load XML
$data = file_get_contents('calendar.xhtml');
$xml = new DOMDocument();
$xml->loadXML($data);

// load XSL
$xsl = new DOMDocument();
$xsl->load('calendar.xsl');

// transform
$processor = new XSLTProcessor();
$processor->importStylesheet($xsl);
$processor->setParameter('', 'recommendedFor', $recommendedFor);
$processor->setParameter('', 'currentDate', "" . date("Y-m-d"));
$processor->setParameter('', 'currentDateMinusOne', "" . date("Y-m-d", strtotime(date("Y-m-d", strtotime("now")) . " -1 day")));
$processor->setParameter('', 'currentDatePlusOne', "" . date("Y-m-d", strtotime(date("Y-m-d", strtotime("now")) . " +1 day")));
$processor->setParameter('', 'currentDatePlusTwo', "" . date("Y-m-d", strtotime(date("Y-m-d", strtotime("now")) . " +2 day")));
$processor->setParameter('', 'currentDatePlusThree', "" . date("Y-m-d", strtotime(date("Y-m-d", strtotime("now")) . " +3 day")));
$processor->setParameter('', 'currentDatePlusFour', "" . date("Y-m-d", strtotime(date("Y-m-d", strtotime("now")) . " +4 day")));
$processor->setParameter('', 'currentTime', "" . date("h:i:s"));
$dom = $processor->transformToDoc($xml);

// send result to client
echo $dom->saveXML();
?>