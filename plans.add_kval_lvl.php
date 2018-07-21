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
  <form class="form-horizontal" action="plans.add_kval.php" method="post" role='form'>
    <div class='row form-group'>
    <label class="control-label col-md-3" for="rus_nazva_kval_lvl" >Кваліфікаційний рівень</label>
    <div class="col-md-3">
      <input class="form-control" type="text" name="ua_nazva_kval_lvl" id='ua_nazva_kval_lvl' placeholder="Українська назва">
    </div>
      </div>
      <div class='row form-group'>
      <label class="control-label col-md-3" for="ua_nazva_kval_lvl" >Квалификационный уровень</label>
      <div class="col-md-3">
        <input class="form-control" type="text" name="rus_nazva_kval_lvl" id='rus_nazva_kval_lvl' placeholder="Русское название">
      </div>
        </div>
        <div class='row form-group'>
        <label class="control-label col-md-3" for="en_nazva_kval_lvl" >Qualification level</label>
        <div class="col-md-3">
          <input class="form-control" type="text" name="en_nazva_kval_lvl" id='en_nazva_kval_lvl' placeholder="English name">
        </div>
          </div>
          <div class='row form-group'>
          <label class="control-label col-md-3" for="en_nazva_kval_lvl" >Семестри навчання</label>
          <div class="col-md-2">
            <select class="form-control selectpicker" name="kol_sem">
              <option value="1">1-8</option>
              <option value="2">9-12</option>
              </select>
          </div>
      </div>
      <div class='row form-group'>
        <div class=" col-md-offset-2 col-md-1">
        <input class="btn btn-primary" type="button"  value="<<Назад" onclick="location.href='plans.add_kval.php'">
        </div>
        <div class="col-md-5">
        <input class="btn btn-primary" type="submit" name="add_kval_lvl" value="Додати новий кваліфікаційний рівень">
        </div>
      </div>

  </form>
</div>
</body>
</html>
