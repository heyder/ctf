<?php
$memtest = new Memcached();
$memtest->addServer("127.0.0.1", 11211);
echo $memtest;
?>
