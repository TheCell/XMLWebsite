<?php

/**
 * perform XSLT transformation with PHP
 * @author Roland Christen <roland.christen@hslu.ch>
 * API: http://php.net/manual/en/class.xsltprocessor.php
 */

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
$processor->setParameter('', 'currentTime', "" . date("h:i:s"));
$dom = $processor->transformToDoc($xml);

// send result to client
echo $dom->saveXML();
?>