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
        <div class='mar_five'>
        <div class="row">
        <label  class="col-md-1">Група</label>

          <div class="col-md-3">
            <select class="selectpicker" name="group_chosen_attendance" id='group_chosen_attendance' >
            <option value="-1">Оберіть группу</option>
            <?php opt_group($link); ?>
            </select>
          </div>
        <label  class="col-md-1">Рік навчання</label>
          <div class="col-md-3">
            <select class="selectpicker" name="std_year_attendance" id='std_year_attendance' >
            <?php opt_years_rozklad($link);  ?>
            </select>
          </div>
        <label  class="col-md-1">Семестр</label>
          <div class="col-md-3">
              <select class="selectpicker" name="semestr_attendance" id='semestr_attendance' >
              </select>
          </div>
        </div>
        <div class="row">
          <label class="col-md-1" >Дисципліна</label>
          <div class="col-md-5">
            <select class="selectpicker form-control" name="pred_attendance" id='pred_attendance' >
            </select>
          </div>
          <label class="col-md-1" >Вид заняття</label>
          <div class="col-md-3">
            <select class="selectpicker form-control" name="vidzan_attendance" id='vidzan_attendance' >
            </select>
          </div>
        </div>
        <div class="row">
          <label class="col-md-1">Викладач</label>
          <div class="col-md-4 ">
            <select class="selectpicker form-control" name="prepod_attendance" id='prepod_attendance' >

            </select>
          </div>
          <div class="col-md-3">
              <input class="btn btn-primary col-sm-4" type="button"  value="Заміна" id='zamena_btn'>
          </div>
          <div id='hid_zam_ate'>
            <label class="col-md-1" >Викладач на заміну</label>
          <div class="col-md-3">
              <select class="selectpicker" name="zamena_attendance" id='zamena_attendance' >
                <?php
                    opt_prepod($link);
                 ?>
            </select>
          </div>
          </div>
        </div>
        <div class='row form-group'>
        <label class="col-sm-2 control-label">Корпус</label>
        <div class="col-sm-2">
          <select class="form-control selectpicker" name="korp_attend" id='korp_attend'>
              <option value="-1">Оберіть корпус</option>
              <?php  opt_korp($link); ?>
          </select>
        </div>
        <label class="col-sm-2 control-label">Аудиторія</label>
        <div class="col-sm-2">
          <select class="form-control selectpicker" name="aud_attend" id='aud_attend'>

          </select>
        </div>
        <div class="col-sm-4">
          <a href="\HW\classes.new_aud_korp.php">
            <input class="form-control btn btn-default" type="button" value="Додати нову аудиторію">
          </a>
      </div>
        </div>
        <div class="row">
            <label class="col-md-2">Дата проведення</label>
          <div class="col-md-2">
                  <input type="date" name="date_attendance" id='date_attendance' >
          </div>
        <label class="col-md-2">Час проведення</label>
          <div class="col-md-3">
            <select class="selectpicker" name="time_attendance" id='time_attendance' >
              <option value="1">08:30</option>
              <option value="2">10:25</option>
              <option value="3">12:35</option>
              <option value="4">14:30</option>
              <option value="5">16:25</option>
              <option value="6">18:10</option>
            </select>
          </div>
        </div>
              <div class='row'>
                    <input  class="btn btn-primary nnhided" type="button"  value="Зазначити відвідуваність" id="attendance_once"  >
                    <input  class="btn btn-primary nnhided" type="button"  value="Переглянути відвідуваність групи за обраним типом занять" id="attendance_of_grp"  >
                    <input  class="btn btn-primary nnhided" type="button"  value="Переглянути відвідуваність групи за семестр" id="attendance_of_grp_by_sem"  >
                    <input  class="btn btn-primary hided" type="button"  value="Відміна" id="canc_change_at"  >
                    <input  class="btn btn-primary hided" type="button"  value="Зберегти зміни" id="change_at"  >
                    <input  class="btn btn-primary hided" type="button"  value="Видалити дані за обраний день" id="del_at"  >
              </div>
        </div>
</div>
</body>

</html>
