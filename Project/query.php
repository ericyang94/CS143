<!DOCTYPE html>
<html>
<head>
<title>CS143 Project 1B by Eric Yang and Kevin Zuo</title>
</head>
<body>
Type SQL query here:
<p>
<form method="GET">
<textarea name="query" rows="10" cols="100"></textarea>
<input type = "submit" value = "Submit">
</form>
</p>

<?php
if($_GET["query"])
{
	$db_connection = mysql_connect("localhost", "cs143", "");
	
	if(!$db_connection) 
	{
   		$errmsg = mysql_error($db_connection);
    		print "Connection failed: $errmsg <br />";
    		exit(1);
	}

	mysql_select_db("CS143", $db_connection);

	echo "<h3>Results:</h3>";

	$query = $_GET["query"];
	$rs = mysql_query($query, $db_connection);

	print '<table border="1"><tr>';
	for($k=0; $k < mysql_num_fields($rs); $k++)
	{
		$field = mysql_fetch_field($rs, $k);
		echo '<td><b>' . $field->name . '</b></td>';
	}
	
	print '<tr>';
	while($row = mysql_fetch_row($rs)) 
	{
		for($x=0; $x<$k; $x++)
		{
			echo '<td>' . $row[$x] . '</td>';
		}
		echo '</td><tr>';
	}

	print '</tr>';
	print '</table>';

	mysql_close($db_connection);
}
?>

</body>
</html> 
