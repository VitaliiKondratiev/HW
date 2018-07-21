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
  <ul class="nav nav-tabs" id="myTab" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" id="home-tab" data-toggle="tab" href="#adding" role="tab" aria-controls="home" aria-selected="true">Додати нову аудиторію</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" id="profile-tab" data-toggle="tab" href="#spisok_p" role="tab" aria-controls="profile" aria-selected="false">Додати новий корпус</a>
    </li>
  </ul>
  <div class="tab-content" id="myTabContent">

    <div class="tab-pane active fade in" id="adding" role="tabpanel" aria-labelledby="profile-tab">

                  <div class='row form-group'>
                    <label class="col-sm-1 control-label">Корпус</label>
                    <div class="col-sm-3">
                      <select class="form-control selectpicker" name="korp_name" id='korp_name'>
                          <?php  opt_korp($link); ?>
                      </select>
                    </div>
                </div>
                <div class='row form-group'>
                  <label class="col-md-1" for="inp_aud_name">Аудиторія</label>
                <div class="col-md-3">
                      <input class='form-control' type="text" name="inp_aud_name" id='inp_aud_name' >
                </div>
              </div>
                  <div class='row form-group'>
                    <div class="col-md-1">
                      <input class="btn btn-primary" type="button"  value="<<Назад" onclick="history.back()">
                    </div>
                    <div class="col-md-5">
                      <input class='btn btn-primary' type="button" name="add_new_aud"  id='add_new_aud' value="Додати нову аудиторію">
                    </div>
                  </div>

    </div>
    <div class="tab-pane fade" id="spisok_p" role="tabpanel" aria-labelledby="home-tab">
    <div class='row form-group'>
      <label class="col-md-1" for="inp_korp_name">Корпус</label>
    <div class="col-md-3">
          <input class='form-control' type="text" name="inp_korp_name" id='inp_korp_name' >
    </div>
  </div>
      <div class='row form-group'>
        <div class="col-md-1">
          <input class="btn btn-primary" type="button"  value="<<Назад" onclick="history.back()">
        </div>
        <div class="col-md-5">
          <input class='btn btn-primary' type="button" name="add_new_korp"  id='add_new_korp' value="Додати новий корпус">
        </div>
      </div>

    </div>

  </div>
</div>
        </body>
</html>
