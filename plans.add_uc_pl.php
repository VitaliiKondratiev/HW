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
  <form class="form-vertical" action="plans.spisok_uc_pl.php" method="post" role='form' >
        <div class='row form-group'>
              <label class="control-label col-md-2" for="selkaf" >Кафедра</label>
              <div class="col-md-5">
              <select class="form-control selectpicker" name="vibor_kaf" id="selkaf" data-live-search="true" >
                <?php
                    select_kaf($link);
                 ?>
              </select>
              </div>
              <div class="col-md-5">
              <a href="add_kaf_link"><input class="btn btn-default" type="button" value="Додати нову кафедру"></a><br>
              </div>
        </div>
        <div class='row form-group'>
              <label class="control-label col-md-2" for="selkval" >Кваліфікація</label>
              <div class="col-md-5">
              <select class="form-control selectpicker" name="selkval" id="selkval" data-live-search="true" >
                <?php
                    opt_kval($link);
                 ?>
              </select>
              </div>
              <div class="col-md-5">
              <a href="\HW\plans.add_kval.php"><input class="btn btn-default" type="button" value="Додати нову кваліфікацію"></a><br>
              </div>
        </div>
        <div class='row  form-group'>
              <label class="control-label col-md-2" for='spezz'>Спеціалізація</label>
              <div class="col-md-5">
                <select class="form-control selectpicker" name="spezz" id='spezz' data-live-search="true">
                <?php
                      select_spezz($link);
                 ?>
                </select>
                </div>
                <div class="col-md-5">
              <a href="\HW\plans.add_spezz.php">
                <input class="btn btn-default" type="button" value="Додати нову спеціалізацію">
              </a>
                </div>
        </div>
        <div class='row form-group'>
              <label class="control-label col-md-2" for="data" > Введено </label>
              <input class="control-label col-md-3" type="date" name="vveden" placeholder="Введено" id="data">
        </div>
        <div class='row form-group'>
          <div class=" col-md-2">
          <input class="btn btn-primary" type="button"  value="<<Назад" onclick="location.href='plans.spisok_uc_pl.php'">
          </div>
          <div class="col-md-5">
              <input class="btn btn-primary" type="submit" name="add_uc_pl" value="Додати новий навчальний план">
          </div>
        </div>

    </form>
  </div>

</body>
</html>
