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
  <form class="form-horizontal" action="plans.add_spezz.php" method="post" role="form" >
    <div class="row form-group">
        <label class="control-label col-md-2" for="as_napr">Напрямок</label>
              <div class="col-md-6">
              <select class="form-control selectpicker" name="napr" id="as_napr" data-live-search="true">
              <?php
                opt_napr($link);
               ?>
              </select>
              </div>

              <div class="col-md-4">
                    <a href="\HW\plans.add_napr.php"><input class="btn btn-default" type="button" value="Додати новий напрям"></a>
              </div>
    </div>
    <div class="row form-group">
            <label class="control-label col-md-2" for="ua_nazva_spec">Українська назва спеціальності</label>
            <div class="col-md-6">
              <input class="form-control" type="text" name="ua_nazva_spec"  id='ua_nazva_spec'>
            </div>
    </div>
    <div class="row form-group ">
          <label class="control-label col-md-2" for="rus_nazva_spec">Русское название специальности</label>
          <div class="col-md-6">
            <input class="form-control" type="text" name="rus_nazva_spec" id='rus_nazva_spec'>
          </div>
    </div>
    <div class="row form-group ">
          <label class="control-label col-md-2" for="en_nazva_spec">English name of the specialty</label>
          <div class="col-md-6">
            <input class="form-control" type="text" name="en_nazva_spec" id='en_nazva_spec'>
          </div>
    </div>
    <div class="row form-group">
          <label class="control-label col-md-2" for="shfr_spec">Шифр спеціальності</label>
          <div class="col-md-4">
              <input class="form-control" type="text" name="shfr_spec" id='shfr_spec'>
          </div>
    </div>
    <div class='row form-group'>
      <div class=" col-md-offset-1 col-md-1">
      <input class="btn btn-primary" type="button"  value="<<Назад" onclick="location.href='plans.add_spezz.php'">
      </div>
      <div class="col-md-5">
        <input class="btn btn-primary" type="submit" name="add_spez" value="Додати нову спеціальність">
      </div>
    </div>
  </form>
</div>
</body>
</html>
