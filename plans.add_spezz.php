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
      <form class="form-horizontal" action="plans.add_uc_pl.php" method="post" role='form' >
          <div class="row form-group">
            <label class="control-label col-md-2" for="as_id_spec"> Cпеціальність</label>
            <div class="col-md-6">
                    <select class="form-control selectpicker" data-live-search="true" name="id_spec" id='as_id_spec'>
                    <?php
                    opt_spez($link);
                     ?>
                    </select>
                    </div>
                    <div class="col-md-4">
                    <a href="\HW\plans.add_spez.php">
                      <input class="btn btn-default" type="button" value="Додати нову спеціальність">
                    </a>

            </div>
      </div>

      <div class="row form-group">
        <label class="control-label col-md-2" for="ua_nazva_spec_z">Українська назва спеціалізації</label>
  <div class="col-md-6">
        <input class="form-control" type="text" name="ua_nazva_spec_z" placeholder="Українська назва" id='ua_nazva_spec_z'>
      </div>
        </div>
      <div class="row form-group">
        <label class="control-label col-md-2" for="rus_nazva_spec_z">Русское название специализации</label>
<div class="col-md-6">
        <input class="form-control" type="text" name="rus_nazva_spec_z" placeholder="Русское название" id='rus_nazva_spec_z'>
      </div>
      </div>
      <div class="row form-group">
        <label class="control-label col-md-2" for="en_nazva_spec_z">English name of specialization</label>
<div class="col-md-6">
        <input class="form-control" type="text" name="en_nazva_spec_z" placeholder="English name" id='en_nazva_spec_z'>
      </div>
      </div>
      <div class="row form-group">
        <label class="control-label col-md-2" for="shifr_spec_z">Шифр спеціалізації</label>
        <div class="col-md-4">
        <input class="form-control" type="text" name="shifr_spec_z" placeholder="Шифр спеціалізації" id='shifr_spec_z'>
        </div>
      </div>
      <div class='row form-group'>
        <div class=" col-md-offset-1 col-md-1">
        <input class="btn btn-primary" type="button"  value="<<Назад" onclick="location.href='plans.add_uc_pl.php'">
        </div>
        <div class="col-md-5">
            <input class="btn btn-primary" type="submit" name="add_spezz" value="Додати нову спеціалізацію">
        </div>
      </div>

      </form>
  </div>
</body>
</html>
