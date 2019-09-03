<title>Modules Linux</title>

<h1>List Module:</h1>
<?php
  echo shell_exec("lsmod | cut -d' ' -f1 | xargs modinfo | egrep '^name'  ");
 ?>
<hr>
<div align="center">
    <form method="GET" action="">
        <input type="text" name="q"  placeholder="...">
        <input type="submit" value="SEARCH">
    </form>
</div>

<?php
if ( isset($_GET['q']) ) {
    $q = $_GET['q'];
    $li = shell_exec("modinfo $q");
    echo "<h1>Result: </h1>  <br>".$li;
}
 ?>
