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
                      <form class="form-horizontal" action="classes.rozklad.php" method="post" >
                        <input type="text" name="std_year_rozklad">
                        <input type="text" name="sem_add_rozklad" >
                        <input type="text" name="akgrp_add_rozklad" >
                            <div class='row form-group'>
                            <label class="col-sm-2 control-label" for="predmet" >Предмет</label>
                            <div class="col-sm-6">
                              <select class="form-control selectpicker" name="predmet"  id="chosen_predmet_rozklad" >
                                <option value="-1">Оберіть дисципліну</option>
                              <?php
                            opt_pred_rozklad($link,$_GET['group_chosen_rozklad'],$_GET['semestr_rozklad'],$_GET['std_year_rozklad']);

                               ?>
                              </select>
                            </div>
                          </div>
                          <div class='row form-group'>
                          <label class="col-sm-2 control-label" for="shifr_opp"  >Вид заняття</label>
                          <div class="col-sm-3">
                            <select class="form-control selectpicker" name="vid_zan_add_rozklad" id="vid_zan_add_rozklad">

                            </select>
                          </div>
                        </div>
                            <div class='row form-group'>
                              <label class="col-sm-2 control-label">Викладач</label>
                              <div class="col-sm-6">
                                <select class="form-control selectpicker" name="prepodav"  data-live-search="true">
                                <?php
                                    opt_prepod($link);
                                 ?>
                                </select>
                              </div>
                              <div class="col-sm-4">
                                    <a href="/HW/classes.add_prepod.php"><input class="form-control btn btn-default" type="button" value="Додати викладача"></a>
                              </div>
                            </div>

                            <div class='row form-group'>
                                  <label class="col-sm-1 control-label col-md-offset-1">Початок пари</label>
                                  <div class="col-sm-2">
                                  <select class="form-control selectpicker" name="numb_para"  >
                                    <option value="1">08:30</option>
                                    <option value="2">10:25</option>
                                    <option value="3">12:35</option>
                                    <option value="4">14:30</option>
                                    <option value="5">16:25</option>
                                    <option value="6">18:10</option>
                                  </select>
                                  </div>
                                  <label class="col-sm-1 control-label">День проведення</label>
                                  <div class="col-sm-3">
                                  <select class="form-control selectpicker" name="day_of_week"  >
                                    <option value="1">Понеділок</option>
                                    <option value="2">Вівторок</option>
                                    <option value="3">Середа</option>
                                    <option value="4">Четвер</option>
                                    <option value="5">П`ятниця</option>
                                    <option value="6">Субота</option>
                                  </select>
                                  </div>
                                  <label class="col-sm-1 control-label">Тиждень</label>
                                  <div class="col-sm-3">
                                  <select class="form-control selectpicker" name="num_of_week"  >
                                    <option value="0">Обидва</option>
                                    <option value="1">Перший</option>
                                    <option value="2">Другий</option>
                                  </select>
                                  </div>

                            </div>
                            <div class='row form-group'>
                            <label class="col-sm-2 control-label">Корпус</label>
                            <div class="col-sm-2">
                              <select class="form-control selectpicker" name="korp_add_rozklad" id='korp_add_rozklad'>
                                  <option value="-1">Оберіть корпус</option>
                                  <?php  opt_korp($link); ?>
                              </select>
                            </div>
                            <label class="col-sm-2 control-label">Аудиторія</label>
                            <div class="col-sm-2">
                              <select class="form-control selectpicker" name="aud_add_rozklad" id='aud_add_rozklad'>

                              </select>
                            </div>
                            <div class="col-sm-4">
                              <a href="\HW\classes.new_aud_korp.php">
                                <input class="form-control btn btn-default" type="button" value="Додати нову аудиторію">
                              </a>
                          </div>
                            </div>


                          <div class='row form-group'>
                            <div class="col-sm-offset-1  col-sm-3">
                              <a href="\HW\classes.rozklad.php">
                                <input class="form-control btn btn-default" type="button" value="Переглянути розклад">
                              </a>
                            </div>
                            <div class="col-sm-4">
                                <input  class="form-control btn btn-primary" type="submit" name="add_predmet_to_rozklad" value="Додати пару до розкладу">
                          </div>

                  </div>
            </form>
        </div>
  </body>
</html>
