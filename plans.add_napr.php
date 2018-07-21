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
  <form class="form-horizontal" action="plans.add_spez.php" method="post" role='form'>
    <div class='row form-group'>
      <label class="control-label col-md-2" for="ua_nazva_napr">Українська назва напряму</label>
    <div class=" col-md-6">
      <input required class="form-control" type="text" name="ua_nazva_napr"  id='ua_nazva_napr'>
    </div>
      </div>
      <div class='row form-group'>
        <label class="control-label col-md-2" for="rus_nazva_napr">Русское наименование направления</label>
      <div class=" col-md-6">
        <input required class="form-control" type="text" name="rus_nazva_napr"  id='rus_nazva_napr'>
      </div>
        </div>
        <div class='row form-group'>
          <label class="control-label col-md-2" for="en_nazva_napr">English direction name</label>
        <div class=" col-md-6">
          <input required class="form-control" type="text" name="en_nazva_napr"  id='en_nazva_napr'>
        </div>
          </div>
      <div class='row form-group'>
      <label class="control-label col-md-2" for="shfr_napr">Шифр напряму</label>
      <div class="col-md-6">
      <input required class="form-control" type="text" name="shfr_napr"  id='shfr_napr'>
    </div>
    </div>
    <div class='row form-group'>
      <div class=" col-md-offset-1 col-md-1">
      <input class="btn btn-primary" type="button"  value="<<Назад" onclick="location.href='plans.add_spez.php'">
      </div>
      <div class="col-md-5">
      <input class="btn btn-primary" type="submit" name="add_napr" value="Додати новий напрям">
      </div>
    </div>
  </form>
</div>
</body>
</html>
