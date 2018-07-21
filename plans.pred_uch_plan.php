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
<table class= 'table table-bordered table-reflow' >
    <tr class="success text-center">
      <td class="col-md-6"></td>
      <td class="col-md-6"><?php echo $pred; ?></td>
    </tr>
    <?php
    if ( $result = $link->query("Select * FROM UCHPLZN inner join VIDZAN on UCHPLZN.id_vida_zanyatiy =  VIDZAN.id_vida_zanyatiy
    WHERE id_uch_plan=$usl_uch_plan AND id_predmeta=$usl_id_pred AND semestr='$usl_sem'")) {
          while($row = $result->fetch_assoc()){
        $ua_nazva_vida_zanyatiy =  $row['ua_nazva_vida_zanyatiy'];
        $hours = $row['chasov'];
        echo "<tr>
        <td class=\"col-md-6\">$ua_nazva_vida_zanyatiy </td>
        <td class=\"col-md-6\">$hours</td>

        </tr>";
        }
      }
    ?>
</table>
</div >
</body>
</html>
