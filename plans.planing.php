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
      <div class="row text center">
        <table class='table'>
          <tr>
            <td>Об`єкт аналізу:</td>
            <td>
            <label>
              <input type="radio" name="at_pl_obj" value="1" checked>
              Группа
            </label>
            </td>
            <td>  <label>
                <input type="radio" name="at_pl_obj" value="2">
                Студент
              </label>
            </td>
            <td></td>
          </tr>
          <tr>
            <td>Предмет аналізу:</td>
            <td>
            <label>
              <input type="radio" name="at_pl_pred" checked value="1">
              За всіма дисциплінами
            </label>
            </td>
            <td>  <label>
                <input type="radio" name="at_pl_pred" value="2">
                За окремою дисципліною
              </label>
            </td>
            <td>
              <label>
                <input type="radio" name="at_pl_pred" value="3">
                За окремим видом заняття
              </label>
            </td>
          </tr>
          <tr>
            <td>Інтервал аналізу:</td>
            <td>
            <label>
              <input type="radio" name="at_pl_int" checked value="1">
              За семестр
            </label>
            </td>
            <td>  <label>
                <input type="radio" name="at_pl_int" value="2">
                Задати інтервал
              </label>
            </td>
            <td></td>
          </tr>
        </table>
      </div>
      <div class="row">
      <label  class="col-md-1">Група</label>
        <div class="col-md-2">
          <select class="selectpicker form-control" name="" id='group_chosen_attendance' >
          <option value="-1">Оберіть группу</option>
          <?php opt_group($link); ?>
          </select>
        </div>
        <div style='display:none' id='id_at_pl_obj'>
          <label for="st"  class="col-md-1">Студент</label>
          <div class="col-md-5">
            <select class="form-control selectpicker" name="" id='pl_at_st' >
            </select>
        </div>
      </div>
      </div>
      <div class="row">
          <label  class="col-md-1">Семестр</label>
          <div class="col-md-2">
              <select class="selectpicker form-control"  id='semestr_attendance' >
              </select>
          </div>
          <label  class="col-md-1">Рік навчання</label>
            <div class="col-md-2">
              <select class="form-control" name="std_year_attendance" id='std_year_attendance' >
              <?php opt_years_rozklad($link);  ?>
              </select>
            </div>
      </div>
      <div class="row">
        <div style='display:none' id='id_pred_attendance'>
        <label class="col-md-1" >Дисципліна</label>
        <div class="col-md-5">
          <select class="selectpicker form-control" name="pred_attendance" id='pred_attendance' >
          </select>
        </div>
        </div>
        <div style='display:none' id='id_vidzan_attendance'>
        <label class="col-md-1" >Вид заняття</label>
        <div class="col-md-3">
          <select class="selectpicker form-control" name="vidzan_attendance" id='vidzan_attendance' >
          </select>
        </div>
        </div>
      </div>
              <div class='row' style='display:none' id='id_at_pl_int'>

                    <label class="col-md-2">Нижня межа інтервалу</label>
                    <div class="col-md-2">
                    <input required class="form-control" type="date" name="" id='bot_date' >
                    </div>

                    <label class="col-md-2">Верхня межа інтервалу</label>
                    <div class="col-md-2">
                    <input required class="form-control" type="date" name="" id='top_date' >
                    </div>

              </div>
            <div class='row'>
                  <input  class="btn btn-primary" type="button"  value="Переглянути план відвідуваності" id="show_plan_attend"  >
                  <input  class='btn btn-primary ' type='button'  value='Доповнити планову траєкторію' id='at_pl_create_plan'  >
            </div>
      </div>

</div>


        </body>
</html>
