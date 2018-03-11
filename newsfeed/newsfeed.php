<?php
$recommendedFor = filter_input(INPUT_GET, 'recommendedFor', FILTER_SANITIZE_STRING);

// load XML
$data = file_get_contents('newsfeed.xml');
$xml = new DOMDocument();
$xml->loadXML($data);

// load XSL
$xsl = new DOMDocument();
$xsl->load('newsfeed.xsl');

// transform
$processor = new XSLTProcessor();
$processor->importStylesheet($xsl);
$processor->setParameter('', 'recommendedFor', $recommendedFor);
$processor->setParameter('', 'currentDateMinusOne', "" . date("Y-m-d", strtotime(date("Y-m-d", strtotime("now")) . " -1 day")));
$processor->setParameter('', 'currentDate', "" . date("Y-m-d"));
$processor->setParameter('', 'currentDatePlusFour', "" . date("Y-m-d", strtotime(date("Y-m-d", strtotime("now")) . " +4 day")));
$processor->setParameter('', 'currentTime', "" . date("h:i:s"));
$dom = $processor->transformToDoc($xml);

// send result to client
echo $dom->saveXML();
?>