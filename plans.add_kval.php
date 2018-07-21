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
<div class='container' >
  <form class="form-horizontal" action="plans.add_uc_pl.php" method="post" role='form'>
    <div class='row form-group'>
    <label class="control-label col-md-3" for="ua_nazva_kval" >Кваліфікація</label>
    <div class="col-md-8">
      <input class="form-control" type="text" name="ua_nazva_kval" id='ua_nazva_kval' placeholder="Українська назва">
    </div>
      </div>
      <div class='row form-group'>
      <label class="control-label col-md-3" for="rus_nazva_kval" >Квалификация</label>
      <div class="col-md-8">
        <input class="form-control" type="text" name="rus_nazva_kval" id='rus_nazva_kval' placeholder="Русское название">
      </div>
        </div>
        <div class='row form-group'>
        <label class="control-label col-md-3" for="en_nazva_kval" >Qualification</label>
        <div class="col-md-8">
          <input class="form-control" type="text" name="en_nazva_kval" id='en_nazva_kval' placeholder="English name">
        </div>
          </div>
          <div class='row form-group'>
          <label class="control-label col-md-3" for="kval_lvl" >Кваліфікаційний рівень</label>
          <div class="col-md-3">
            <select class="form-control selectpicker" name="kval_lvl">
              <?php opt_kval_lvl($link) ?>
              </select>
          </div>
          <div class="col-md-3">
            <input class="btn btn-default" onclick="location.href='plans.add_kval_lvl.php';" type="button" value="Додати новий кваліфікаційний рівень">
          </div>
      </div>
    <div class='row form-group'>
      <div class=" col-md-offset-2 col-md-1">
        <input class="btn btn-primary" type="button"  value="<<Назад" onclick="location.href='plans.add_uc_pl.php'">
      </div>
      <div class="col-md-5">
        <input class="btn btn-primary" type="submit" name="add_kval" value="Додати нову кваліфікацію">
      </div>
    </div>
</div>
  </form>
</div>
</body>
</html>
