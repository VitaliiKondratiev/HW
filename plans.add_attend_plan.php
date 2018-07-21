<?php
include 'plans.functions.php';
include 'plans.actions.php';
?>
<html>
<head>
<?php
include 'plans.linkeds.php';
 ?>
</head>
        <body>
<div class='container'>

        <div class='row'>

              <label class="col-md-2">План відвідуваності, %</label>
              <div class="col-md-1">
              <input required class="form-control" type="input" name="" id='plan_att' >
              </div>
              <label class="col-md-2">Допустиме відхилення, %</label>
              <div class="col-md-1">
              <input required class="form-control" type="input" name="" id='otkl_att' >
              </div>
        </div>
        <div class='row'>
              <label class="col-md-2">Нижня межа, %</label>
              <div class="col-md-1">
              <input disabled required class="form-control" type="input" name="" id='bot_att' >
              </div>
              <label class="col-md-2">Верхня межа, %</label>
              <div class="col-md-1">
              <input disabled required class="form-control" type="input" name="" id='top_att' >
              </div>

        </div>
      <div class='row'>
            <label class="col-md-2">Дата кінця інтервалу</label>
            <div class="col-md-2">
            <input  required class="form-control" type="date" name="" id='get_datu_konca' >
            </div>
            <label class="col-md-6">Важливо! Дата кінця інтервалу повина бути неділею.</label>
      </div>
    <div class='row'>
          <input  class="btn btn-primary" type="button"  value="Додати до плану відвідуваності" id="add_to_plan_attend"  >
    </div>
</div>


        </body>
</html>
