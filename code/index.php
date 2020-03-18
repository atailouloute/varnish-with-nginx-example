<?php

$ts = gmdate("D, d M Y H:i:s", time() + 60) . " GMT";

header("Expires: $ts");
header("Pragma: cache");
header('Cache-Control: max-age=60');

// Simulate long script
sleep(2);

echo rand();

?>