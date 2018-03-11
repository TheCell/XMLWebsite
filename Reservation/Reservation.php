<?php

$get = "C001";

if (isset($_GET['data'])){
    save($_GET['data']);
}


function save($id){
    global $get;
    $get= $id;
}



function show(){
    global $get;
    return "<input type='hidden' name='ID' value='".$get."'/>";
}

function aO($id){
    return "<a href='#reservation' onclick=\"save(".$id.")\" >";
}

function aC(){
    return "</a>";
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
    $dom = $processor->transformToDoc($xml);

// send result to client
    echo $dom->saveXML();
}

load();