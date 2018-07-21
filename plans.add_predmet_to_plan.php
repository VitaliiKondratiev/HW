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
                      <form class="form-horizontal" action="plans.uchebniy_plan.php" method="post" >
                            <div class='row form-group'>
                            <label class="col-sm-2 control-label" for="predmet" >Предмет</label>
                            <div class="col-sm-6" id="predmet">
                              <select class="form-control selectpicker" name="predmet"  data-live-search="true">
                              <?php
                            opt_pred($link);
                               ?>
                              </select>
                            </div>
                          <div class="col-sm-6" id="inp_pred">
                            <input  type="text" name="id_prdmt" style="display:none">
                            <input class="form-control" type="text" name="nzv" readonly>
                          </div>
                            <div class="col-sm-4">
                                  <a href="\HW\plans.add_new_pred.php"><input class="form-control btn btn-default" type="button" value="Додати нову дисципліну"></a>
                            </div>
                          </div>
                          <div class='row form-group'>
                          <label class="col-sm-2 control-label" for="shifr_opp" >ОПП</label>
                          <div class="col-sm-3" id='shifr_opp'>
                              <input class="form-control" type="text" name="shifr_opp">
                          </div>
                        </div>
                            <div class='row form-group' id='add_pred_formy'>
                              <label class="col-sm-2 control-label">Кількість годин</label>
                                <?php
                                show_formy_zanyatiy($link);
                                ?>
                            </div>
                            <div class='row form-group'>
                            <label class="col-sm-2 control-label">Кількість кредитів</label>
                            <div class="col-sm-1">
                              <input class="form-control" type="text" name="credits" id="credits">
                            </div>
                            </div>
                            <div class='row form-group'>
                            <label class="col-sm-2 control-label">Тип підсумкового контролю</label>
                            <div class="col-sm-4">
                              <select class="form-control selectpicker" name="control_type">
                          <?php  opt_kontrol_zan ($link); ?>
                              </select>
                            </div>
                            </div>
                            <div class='row form-group'>
                                <label class="col-sm-2 control-label">Тип індивідуального завдання</label>
                              <div class="col-sm-4">
                                <select class="form-control selectpicker" name="idz_type" >
                                <?php  opt_ind_zad ($link); ?>
                                </select>
                              </div>
                          </div>
                          <div class='row form-group'>
                            <label class="col-sm-2 control-label" for="add_sem">Семестр проведення</label>
                            <div class="col-sm-1" id="add_sem">
                              <select class="form-control selectpicker" name="sem"  >
                            <?php opt_sem($link,$_SESSION['id_uc_pl']);
                             ?>
                              </select>
                            </div>
                            <div class="col-sm-1"  id="inp_sem">
                            <input class="form-control" type="text"  readonly name="inp_sem">
                            </div>
                        </div>
                          <div class='row form-group'>
                            <div class="col-sm-3">
                              <a href="\HW\plans.uchebniy_plan.php">
                                <input class="form-control btn btn-default" type="button" value="До навчального плану">
                              </a>
                            </div>
                            <div class="col-sm-4" id='add_pr'>
                                <input  class="form-control btn btn-primary" type="submit" name="add_predmet_to_plan" value="Додати дисципліну до навчального плану">
                          </div>
                          <div class="col-sm-4" id='del_pr'>
                              <input   class="form-control btn btn-primary" type="submit" name="del_predmet" value="Видалити дисципліну з навчального плану">
                          </div>
                          <div class="col-sm-4" id='change_pr'>
                            <input  class="form-control btn btn-primary" type="submit" name="edit_predmet" value="Редагувати дисципліну навчального плану">
                        </div>
                  </div>
            </form>
        </div>
  </body>
</html>
