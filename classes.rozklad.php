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

<div class="row">
  <div class="col-md-4">
    <label for="group_chosen_rozklad">Група</label>
    <select class="selectpicker" name="group_chosen_rozklad" id='group_chosen_rozklad' >
    <option value="-1">Оберіть группу</option>
    <?php opt_group($link); ?>
    </select>
  </div>
  <div class="col-md-4">
    <label for="std_year_rozklad">Рік навчання</label>
    <select class="selectpicker" name="std_year_rozklad" id='std_year_rozklad' >

    <?php opt_years_rozklad($link);  ?>
    </select>
  </div>
  <div class="col-md-4">
      <label for="semestr_rozklad">Семестр</label>
      <select class="selectpicker" name="semestr_rozklad" id='semestr_rozklad' >

      </select>
  </div>

</div>

<div class="row">
<table class= 'table table-bordered text-center'  id="rozklad">
    <?php drawRozklad ($link); ?>
  </table>
</div>
      <div class='row'>

            <input  class="btn btn-primary col-sm-4" type="button"  value="Додати нову пару до розкладу" id="add_para_rozklad"  >
        </form>

      </div>
</div>

</body>
</html>
