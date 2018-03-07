<?php
//Check whether the form has been submitted
if (array_key_exists('check_submit', $_POST)) {
   //Converts the new line characters (\n) in the text area into HTML line breaks (the <br /> tag)
   $_POST['note'] = nl2br($_POST['note']); 
   //Check whether a $_GET['Languages'] is set
   //if ( isset($_POST['Colors']) ) { 
   //  $_POST['Colors'] = implode(', ', $_POST['Colors']); //Converts an array into a single string
   //}

   //Let's now print out the received values in the browser
   echo "<html>"
   echo "Your name: {$_POST['username']}<br />";
   echo "Date from: {$_POST['dateFrom']}<br />";
   echo "Date to: {$_POST['dateTo']}<br /><br />";
   echo "Time from:<br />{$_POST['timeFrom']}<br /><br />";
   echo "time to: {$_POST['timeTo']}<br />";
   echo "note: {$_POST['note']}<br />";
} else {
    echo "You can't see this page without submitting the form.";
}
echo"</html>"
?>