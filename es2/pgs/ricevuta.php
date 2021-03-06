<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
$msg = '';
$tbl = 'ricevute';
$id = (!empty($_REQUEST['id'])) ? intval($_REQUEST['id']) : false;
$record = (empty($_REQUEST['id'])) ? R::dispense($tbl) : R::load($tbl, intval($_REQUEST['id']));
if (!empty($_POST['clienti_id'])) :
    foreach ($_POST as $key => $value) {
        $record[$key] = $value;
    }
    try {
        R::store($record);
        $msg = 'Dati salvati correttamente (' . json_encode($record) . ') ';
    } catch (RedBeanPHP\RedException\SQL $e) {
        $msg = $e->getMessage();
    }
endif;

if (!empty($_REQUEST['del'])) :
    $record = R::load($tbl, intval($_REQUEST['del']));
    try {
        R::trash($record);
    } catch (RedBeanPHP\RedException\SQL $e) {
        $msg = $e->getMessage();
    }
endif;

$data = R::findAll($tbl, 'ORDER by id ASC LIMIT 999');
$clienti = R::findAll('clienti');
$new = !empty($_REQUEST['create']);
foreach ($clienti as $opt){if ($opt->id == $record->clienti_id){$clienti=$opt;}}
?>
<!--
<link rel="stylesheet" type="text/css" media="print" href="print.css">
-->
<style>
@import url('print.css') print;
</style>

<h1>
	<a href="?p=<?=$tbl?>">
		Indietro
	</a>
</h1>

 <!-- Stampa ricevuta -->
        <div class="container-fluid">
          <div class="row">
            <div class="jumbotron col-xs-8"><h2>Ricevuta del <?=date('d/m/Y',strtotime($record->dataemissione))?></h2>
			</div>
          </div>
            <div class="row">
                <div class="col-xs-12"><h3>Intestatario: <?=($clienti->nome)?></h3></div>
                <div class="col-xs-12"><h5><?=($clienti->telefono)?><?=($clienti->cellulare)?></h5></div>
              </div>
            <div class="row" style="background-color: black; color: white">
              <div class="col-xs-2"><h4>Q.ta</h4></div>
              <div class="col-xs-6" ><h4>Descrizione</h4></div>
              <div class="col-xs-4" ><h4>Corrispettivo</h4></div>
            </div>
              <div class="row">
                  <div class="col-xs-2"><h4></h4></div>
              <div class="col-xs-6" ><h4><?=$record->descrizione?></h4></div>
              <div class="col-xs-4" ><h4><?=sprintf("%.2f",$record->importo)?></h4></div>
            </div>
        </div>


