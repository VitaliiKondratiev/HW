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
      <a class="nav-link active" id="home-tab" data-toggle="tab" href="#adding" role="tab" aria-controls="home" aria-selected="true">Додати дисципліну</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" id="profile-tab" data-toggle="tab" href="#spisok_p" role="tab" aria-controls="profile" aria-selected="false">Список дисциплін</a>
    </li>
  </ul>
  <div class="tab-content" id="myTabContent">

    <div class="tab-pane active fade in" id="adding" role="tabpanel" aria-labelledby="profile-tab">

                <form class="form" action="plans.add_predmet_to_plan.php" method="post" >
                  <div class='row form-group'>
                  <div class="col-md-8">
                    <label for="ua_nazva_pred">Назва дисципліни</label>
                      <input class='form-control' type="text" name="ua_nazva_pred" id='ua_nazva_pred' >
                  </div>
                  <div class="col-md-4">
                    <label for="ua_nazva_pred_shrt">Коротка назва дисципліни</label>
                      <input class='form-control' type="text" name="ua_nazva_pred_shrt" id='ua_nazva_pred_shrt' >
                  </div>
                  </div>
                  <div class='row form-group'>
                    <div class="col-md-1">
                      <input class="btn btn-primary" type="button"  value="<<Назад" onclick="location.href='plans.add_predmet_to_plan.php'">
                    </div>
                    <div class="col-md-5">
                      <input class='btn btn-primary' type="submit" name="add_new_pred" value="Додати нову дисципліну">
                    </div>
                  </div>
          </form>
    </div>
    <div class="tab-pane fade" id="spisok_p" role="tabpanel" aria-labelledby="home-tab">
          <table class= 'table table-bordered text-center ' >
                  <thead >  <tr bgcolor='CCFFFF' >
                  <td>Повна назва дисципліни</td>
                  <td>Коротка назва дисципліни</td>
                  </tr>
                </thead>
                        <?php
                    sel_predm($link);
                    mysqli_close($link);
                       ?>
          </table>
    </div>
  </div>
</div>
        </body>
</html>
