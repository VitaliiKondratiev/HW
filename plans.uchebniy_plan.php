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
<body >
  <div class='container' >
    <div  style=" height:86%; overflow:auto;">
<table class= 'table table-bordered table-reflow' style="cursor:pointer; vertical-align: middle" id="tbl_spsk_pln">
    <thead>
    <tr class="db_change" title='Cортувати' bgcolor='#0dc3c6' id="sorted"  >
          <td class="col-md-1">ОПП</td>
        <td class="col-md-5">Назва дисципліни</td>

        <td >Вид контролю</td>
        <td >Інд. завд.</td>
        <td>Кредити</td>
        <td >Години</td>
        <td >Лек</td>
        <td >Прак</td>
        <td >Лаб</td>
        <td >СР</td>
        <td>Семестр</td>
    </tr>
  </thead>
    <tbody id='uchebniy_plan' >
      <tr id="hid" >
            <td class="col-md-1">ОПП</td>
          <td class="col-md-5">Назва дисципліни</td>

          <td >Вид контролю</td>
          <td >Інд. завд.</td>
          <td>Кредити</td>
          <td >Години</td>
          <td >Лек</td>
          <td >Прак</td>
          <td >Лаб</td>
          <td >СР</td>
          <td>Семестр</td>

      </tr>
    <?php
        show_plan($link);
    ?>
  </tbody>
</table>
</div>
<div   id='sss' >
<table class= 'table table-bordered table-reflow' id='foooter_uch_plana'>
  <tr class='success text-center' id='tableitoga_up'>  <td colspan='4'></td>  <td ></td>  <td ></td>  <td ></td>  <td ></td>  <td ></td>  <td ></td>  <td ></td>
</table>

<div class='row form-group' >
  <div class=" col-md-1">
  <input class="btn btn-primary" type="button"  value="<<Назад" onclick="location.href='plans.spisok_uc_pl.php'">
  </div>
  <div class="col-md-11">
        <input class="btn btn-primary"  type="button"  value="Додати дисципліну до навчального плану" onclick="location.href='plans.add_predmet_to_plan.php'">
  </div>
</div>
</div>
</div >
<script src="\HW\asu-std_1\js\plans.scripts_s.js" defer></script>
</body>
</html>
