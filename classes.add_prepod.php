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
      <a class="nav-link active" id="home-tab" data-toggle="tab" href="#adding" role="tab" aria-controls="home" aria-selected="true">Додати нового викладача</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" id="profile-tab" data-toggle="tab" href="#spisok_p" role="tab" aria-controls="profile" aria-selected="false">Список викладачів</a>
    </li>
  </ul>
  <div class="tab-content" id="myTabContent">

    <div class="tab-pane active fade in" id="adding" role="tabpanel" aria-labelledby="profile-tab">

                <form class="form" action="classes.add_prepod.php" method="post" >
                  <div class='row form-group'>
                  <div class="col-md-4">
                    <label for="ua_frst_name_prepoda">Фамілія</label>
                      <input class='form-control' type="text" name="ua_frst_name_prepoda" id='ua_frst_name_prepoda' >
                  </div>
                  <div class="col-md-4">
                    <label for="rus_frst_name_prepoda">Фамилия</label>
                      <input class='form-control' type="text" name="rus_frst_name_prepoda" id='rus_frst_name_prepoda' >
                  </div>
                  <div class="col-md-4">
                    <label for="en_frst_name_prepoda">Surname</label>
                      <input class='form-control' type="text" name="en_frst_name_prepoda" id='en_frst_name_prepoda' >
                  </div>
                  </div>

                  <div class='row form-group'>
                  <div class="col-md-4">
                    <label for="ua_name_prepoda">Ім`я</label>
                      <input class='form-control' type="text" name="ua_name_prepoda" id='ua_name_prepoda' >
                  </div>
                  <div class="col-md-4">
                    <label for="rus_name_prepoda">Имя</label>
                      <input class='form-control' type="text" name="rus_name_prepoda" id='rus_name_prepoda' >
                  </div>
                  <div class="col-md-4">
                    <label for="en_name_prepoda">Name</label>
                      <input class='form-control' type="text" name="en_name_prepoda" id='en_name_prepoda' >
                  </div>
                  </div>

                  <div class='row form-group'>
                  <div class="col-md-4">
                    <label for="ua_sec_name_prepoda">Побатькові</label>
                      <input class='form-control' type="text" name="ua_sec_name_prepoda" id='ua_sec_name_prepoda' >
                  </div>
                  <div class="col-md-4">
                    <label for="rus_sec_name_prepoda">Отчество</label>
                      <input class='form-control' type="text" name="rus_sec_name_prepoda" id='rus_sec_name_prepoda' >
                  </div>
                  <div class="col-md-4">
                    <label for="en_sec_name_prepoda">Secondname</label>
                      <input class='form-control' type="text" name="en_sec_name_prepoda" id='en_sec_name_prepoda' >
                  </div>
                  </div>
                          <div class='row form-group'>
                          <label class="col-sm-2 control-label" >Кафедра</label>
                          <div class="col-sm-6">
                          <select class="form-control selectpicker" name="kafedra" >
                          <?php
                              select_kaf ($link);
                          ?>
                          </select>
                          </div>
                          </div>
                          <div class='row form-group'>
                          <label class="col-sm-2 control-label" >Посада</label>
                          <div class="col-sm-6">
                          <select class="form-control selectpicker" name="posada" >
                          <?php
                              opt_posada($link);
                          ?>
                          </select>
                          </div>
                          </div>
                          <div class='row form-group'>
                          <label class="col-sm-2 control-label" >Вчений ступінь</label>
                          <div class="col-sm-6">
                          <select class="form-control selectpicker" name="step">
                          <?php
                              opt_step($link);
                          ?>
                          </select>
                          </div>
                          </div>
                          <div class='row form-group'>
                          <label class="col-sm-2 control-label">Вчене звання</label>
                          <div class="col-sm-6">
                          <select class="form-control selectpicker" name="zvan">
                          <?php
                              opt_zvan($link);
                          ?>
                          </select>
                          </div>
                          </div>
                          <div class='row form-group'>
                          <label class="col-sm-2 control-label">Дата народження</label>
                          <div class="col-sm-2">
                          <input type="date" name="b_day_prepod" class="form-control">
                          </div>
                          </div>
                  <div class='row form-group'>
                    <div class="col-md-1">
                      <input class="btn btn-primary" type="button"  value="<<Назад" onclick="history.back()">
                    </div>
                    <div class="col-md-5">
                      <input class='btn btn-primary' type="submit" name="add_new_prepodavatel" value="Додати нового викладача">
                    </div>
                  </div>
          </form>
    </div>
    <div class="tab-pane fade" id="spisok_p" role="tabpanel" aria-labelledby="home-tab">
          <table class= 'table table-bordered text-center ' >
                  <thead >
                 <tr bgcolor='CCFFFF' >
                    <td>Прізвище</td>
                    <td>Ім`я</td>
                    <td>Побатькові</td>
                    <td>Кафедра</td>
                    <td>Посада</td>
                    <td>Вчений ступінь</td>
                    <td>Вчене звання</td>
                    <td>Дата народження</td>
                  </tr>
                </thead>
                        <?php
                    all_teachers($link);
                    mysqli_close($link);
                       ?>
          </table>
    </div>
  </div>
</div>
        </body>
</html>
