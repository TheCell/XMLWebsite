<?php

$get = "";
function save($id){
    global $get;
    $get= $id;
    load();
}

/**
 * perform XSLT transformation with PHP
 * @author Roland Christen <roland.christen@hslu.ch>
 * API: http://php.net/manual/en/class.xsltprocessor.php
 */


function load()
{

    global $get;
// load XML
    $data = file_get_contents('Reservation.xml');
    $xml = new DOMDocument();
    $xml->loadXML($data);

// load XSL
    $xsl = new DOMDocument();
    $xsl->load('Reservation.xsl');

// transform
    $processor = new XSLTProcessor();
    $processor->registerPHPFunctions();
    $processor->importStylesheet($xsl);
    $processor->setParameter('', 'ID', $get);
    $dom = $processor->transformToDoc($xml);

// send result to client
    echo $dom->saveXML();
}

load();