<?php
include 'plans.functions.php';
include 'plans.actions.php';

unset($_SESSION['id_uc_pl']);
 ?>
<html>
<head>
<?php
include 'plans.linkeds.php';
 ?>
</head>
<body>
  <div class='container'>
<table class= 'table table-bordered'>
  <tr class='active'>
        <td>Введено</td>
        <td>Спеціалізація</td>
        <td>Кваліфікація</td>
        <td>Кафедра</td>
</tr>
          <?php
          spisok_u_plans($link);
          ?>
</table>
      <div class='row'>
      <input  class="btn btn-primary col-sm-4" type="button" align="center" value="Створити новий навчальный план" onclick="location.href = 'plans.add_uc_pl.php'">
      </div>
</div>

</body>
</html>
