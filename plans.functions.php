<?php
// list of curricula
function spisok_u_plans ($link){
  if ($result = $link->query("SELECT * FROM KAF
     inner join UCHPL on KAF.KAF1 = UCHPL.id_kafedry
      inner join SPEZZ on SPEZZ.SPEZZ1 = UCHPL.id_spec_z
      inner join KVAL on KVAL.id_kval = UCHPL.id_kval")) {
        while($row = $result->fetch_assoc()){
      $num =$row['id_uch_plan'];
      $date = date("d.m.Y", strtotime($row['vveden']));
      $ua_nazva_k =  $row['KAF2U'];
      $ua_nazva_s_z = $row['SPEZZ2U'];
      $ua_kval = $row['ua_name_kval'];

      echo "
                    <tr
                    bgcolor='white'
                    onMouseOver=\"this.style.backgroundColor='CCFFFF';\"
                    onMouseOut=\"this.style.backgroundColor='white'\"
                    onclick=\"location.href='plans.uchebniy_plan.php?id_uc_pl=$num'\"
                    style='cursor:default'>
                    <td>$date</td>
                    <td>$ua_nazva_s_z</td>
                    <td>$ua_kval</td>
                    <td>$ua_nazva_k</td>
                    </tr>  ";

      }
    }
    $link->close();
}

// option for list kaf
    function select_kaf ($link){
          if ($result = $link->query("SELECT * FROM KAF")) {
              while($row = $result->fetch_assoc()){
                $num =$row['KAF1'];
              echo"<option value=\"$num\">" .$row['KAF2U'].  "</option>";
            }
          }
    }
// option for list specialization
    function select_spezz ($link){
      if ($result = $link->query("SELECT * FROM SPEZZ")) {
          while($row = $result->fetch_assoc()){
            $num = $row['SPEZZ1'];
          echo"<option value=\"$num\">" .$row['SPEZZ2U'].  "</option>";
        }
      }
    }


// curriculum content
function show_plan($link){
  $usl = $_SESSION['id_uc_pl'];
  $all_credits = 0;
  $all_hours = 0;
  $all_hours_of_lec = 0;
  $all_hours_of_prac = 0;
  $all_hours_of_lab = 0;
  $all_hours_of_sr = 0;
  $ord = "LEFT(shifr_opp,3), CAST(RIGHT(shifr_opp,2)AS UNSIGNED )";
if(isset($_GET['order'])){
    $ord = $_GET['order'];
}
 if ( $result = $link->query("Select * FROM (((UCHPLPR inner join PREDM on UCHPLPR.id_predmeta =  PREDM.PREDM1 )
  inner join VIDKONT on UCHPLPR.id_vida_kontrolya = VIDKONT.id_vida_kontrolya)
  inner join INDZADPR on UCHPLPR.id_predmeta = INDZADPR.id_predmeta)
  inner join INDZAD on INDZAD.id_individ_zad = INDZADPR.id_individ_zad
   WHERE UCHPLPR.id_uch_plan= '$usl' AND UCHPLPR.id_uch_plan = INDZADPR.id_uch_plan AND UCHPLPR.semestr = INDZADPR.semestr
   ORDER BY $ord")) {
       while($row = $result->fetch_assoc()){
     $shifr_opp_pr = $row['shifr_opp'];
     $idd_predmeta =  $row['predm1'];
     $ua_nazva_predmeta =  $row['predm2u'];
     $vidkont = $row['ua_krat_nazva_kontrolya'];
     $ind_zad = $row['kratkoe_nazv_ind_zad'];
     $credits = number_format($row['creditov'],1);
     $hours = $row['chasov'];
     $semest = $row['semestr'];

     $num = $row['id_uch_plan'];

     $all_credits += $credits;
     $all_hours += $hours;
     $mas_zan=array('','','','');
     if ( $help_result = $link->query("Select * FROM UCHPLZN
     WHERE semestr='$semest' AND id_uch_plan='$usl' AND id_predmeta='$idd_predmeta'
     ORDER BY id_vida_zanyatiy")){
        $iter = 0;
         while($help_row = $help_result->fetch_assoc()){
            switch ($help_row['id_vida_zanyatiy']){
              case '1': $mas_zan[0]=$help_row['chasov'];
              $all_hours_of_lec +=$mas_zan[0];
              break;
              case '2': $mas_zan[1]=$help_row['chasov'];
              $all_hours_of_prac +=$mas_zan[1];
              break;
              case '3': $mas_zan[2]=$help_row['chasov'];
              $all_hours_of_lab +=$mas_zan[2];
              break;
              case '4': $mas_zan[3]=$help_row['chasov'];
              $all_hours_of_sr +=$mas_zan[3];
            }
         }
       }
     echo "<tr class='text-center ' bgcolor='white'
     onMouseOver=\"this.style.backgroundColor='CCFFFF';\"
     onMouseOut=\"this.style.backgroundColor='white'\"
     title = '$idd_predmeta'
     >
     <td>$shifr_opp_pr</td>
     <td >$ua_nazva_predmeta</td>
     <td >$vidkont</td>
     <td >$ind_zad</td>
     <td >$credits</td>
     <td >$hours</td>
     <td >$mas_zan[0]</td>
     <td >$mas_zan[1]</td>
     <td >$mas_zan[2]</td>
     <td >$mas_zan[3]</td>
     <td >$semest</td>
     </tr>";
     }
   }
   $all_credits = number_format($all_credits,1);
   echo "<tr class='success text-center' id='itog_plana'>
   <td colspan='4'>Загальна кількість за термін підготовки</td>
   <td >$all_credits</td>
   <td >$all_hours</td>
   <td >$all_hours_of_lec</td>
   <td >$all_hours_of_prac</td>
   <td >$all_hours_of_lab</td>
   <td >$all_hours_of_sr</td>
   <td ></td>
   </tr>";
}

//  certain subject from the curriculum
function show_pred_in_plan($link,$usl_uch_plan,$usl_id_pred,$usl_sem){
  $for_ret = "";
  if ( $result = $link->query("Select * FROM UCHPLZN inner join VIDZAN on UCHPLZN.id_vida_zanyatiy =  VIDZAN.id_vida_zanyatiy
  WHERE id_uch_plan=$usl_uch_plan AND id_predmeta=$usl_id_pred AND semestr='$usl_sem'")) {
        while($row = $result->fetch_assoc()){
      $ua_nazva_vida_zanyatiy =  $row['ua_nazva_vida_zanyatiy'];
      $hours = $row['chasov'];
      $for_ret .="<tr>
      <td class=\"col-md-6\">$ua_nazva_vida_zanyatiy </td>
      <td class=\"col-md-6\">$hours</td>

      </tr>";
      }
    }
    return $for_ret;
}
// option for list subject
function opt_pred($link){
  if ($result = $link->query("SELECT * FROM PREDM")) {
        while($row = $result->fetch_assoc()){
          $num =$row['predm1'];
        echo"<option value=\"$num\">" .$row['predm2u'].  "</option>";
      }
    }
}

function opt_posada($link){
  if ($result = $link->query("SELECT * FROM DOLG")) {
        while($row = $result->fetch_assoc()){
          $num =$row['DOLG1'];
        echo"<option value=\"$num\">" .$row['DOLG2U'].  "</option>";
      }
    }
}
function opt_step($link){
  if ($result = $link->query("SELECT * FROM STEP")) {
        while($row = $result->fetch_assoc()){
          $num =$row['STEP1'];
        echo"<option value=\"$num\">" .$row['STEP2U'].  "</option>";
      }
    }
}
function opt_zvan($link){
  if ($result = $link->query("SELECT * FROM ZVAN")) {
        while($row = $result->fetch_assoc()){
          $num =$row['ZVAN1'];
        echo"<option value=\"$num\">" .$row['ZVAN2U'].  "</option>";
      }
    }
}
// additional new input for new types of activities
function show_formy_zanyatiy($link){
  if ($result = $link->query("SELECT * FROM VIDZAN")) {
        while($row = $result->fetch_assoc()){
          $shrt = $row['vidzan3u'];
          $fl = $row['vidzan2u'];
          $name = $row['name'];
          echo "<div class=col-sm-2>
                        <label> $fl </label>
                        <input class='form-control' type='text'  name='$name' placeholder='$shrt'>
          </div>";
      }
    }

}
// option for list knowledge control
function opt_kontrol_zan ($link)
{
  if ($result = $link->query("SELECT * FROM VIDKONT")) {
        while($row = $result->fetch_assoc()){
          $num =$row['id_vida_kontrolya'];
        echo"<option value=\"$num\">" .$row['ua_nazva_kontrolya'].  "</option>";
      }
    }
}
// option for list personal task
function opt_ind_zad ($link)
{
  if ($result = $link->query("SELECT * FROM INDZAD")) {
        while($row = $result->fetch_assoc()){
          $num =$row['id_individ_zad'];
        echo"<option value=\"$num\">" .$row['nazv_ind_zad'].  "</option>";
      }
    }
}
// list of subjects
function sel_predm($link){
  if ($result = $link->query("SELECT * FROM PREDM ")) {
        while($row = $result->fetch_assoc()){
      $ua_nazva_predmeta =  $row['predm2u'];
      $ua_nazva_predmeta_xs =  $row['predm3u'];

      echo "<tr >   <td >$ua_nazva_predmeta</td> <td >$ua_nazva_predmeta_xs</td>    </tr>";
      }
    }
}
// option for list napravleniy
function opt_napr($link){
if ($result = $link->query("SELECT * FROM NAPR")) {
      while($row = $result->fetch_assoc()){
        $num =$row['NAPR1'];
      echo"<option value=\"$num\">" .$row['NAPR2U'].  "</option>";
    }
  }
}

// option for list speciality
function opt_spez($link){
if ($result = $link->query("SELECT * FROM SPEZ")) {
      while($row = $result->fetch_assoc()){
        $num =$row['SPEZ1'];
      echo"<option value=\"$num\">" .$row['SPEZ2U'].  "</option>";
    }
  }
}
// option for list qualification lvl
function opt_kval_lvl($link){
if ($result = $link->query("SELECT * FROM KVALUR")) {
      while($row = $result->fetch_assoc()){
        $num =$row['id_kval_lvl'];
      echo"<option value=\"$num\">" .$row['ua_name_kval_lvl'].  "</option>";
    }
  }
}

// option for list qualification
function opt_kval($link){
if ($result = $link->query("SELECT * FROM KVAL")) {
      while($row = $result->fetch_assoc()){
        $num =$row['id_kval'];
      echo"<option value=\"$num\">" .$row['ua_name_kval'].  "</option>";
    }
  }
}

// option for list semestr
function opt_sem($link,$usl){

  if ($result = $link->query("SELECT * FROM UCHPL INNER JOIN KVAL on UCHPL.id_kval = KVAL.id_kval
    INNER JOIN KVALUR on KVALUR.id_kval_lvl = KVAL.id_kval_lvl
    WHERE id_uch_plan='$usl'")) {
        while($row = $result->fetch_assoc()){
          $num = $row['kolvo_sem'];
          if($num==1){
            echo '  <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
              <option value="6">6</option>
              <option value="7">7</option>
              <option value="8">8</option>';
              break;
          }
          else {
                echo '  <option value="9">9</option>
              <option value="10">10</option>
              <option value="11">11</option>
              <option value="12">12</option>' ;
              break;
          }
      }
    }

}
function delete_predmet($link,$id_uc_pl,$id_pred,$sem){

  $sql = "DELETE FROM INDZADPR
  WHERE  id_uch_plan='$id_uc_pl' AND id_predmeta='$id_pred' AND semestr='$sem'";
  $link->query($sql);
  $sql = "DELETE FROM UCHPLZN
  WHERE  id_uch_plan='$id_uc_pl' AND id_predmeta='$id_pred' AND semestr='$sem'";
  $link->query($sql);
  $sql = "DELETE FROM UCHPLPR
  WHERE  id_uch_plan='$id_uc_pl' AND id_predmeta='$id_pred' AND semestr='$sem'";
  $link->query($sql);

}


function add_predmet_to_plan($link,$id_uc_pl,$shifr_opp,$id_pred,$lection,$labs,
$prac,$samost,$credits,$control_type,$idz_type,$sem){
  $sum_chasov = (int)$labs+(int)$prac+(int)$lection;

  $sql = "INSERT INTO INDZADPR (id_uch_plan, id_predmeta, id_individ_zad, semestr)
                  VALUES ('$id_uc_pl', '$id_pred','$idz_type','$sem')";
  $link->query($sql);

  if( $lection > 0){
    $sql = "INSERT INTO UCHPLZN (semestr, id_uch_plan, id_predmeta, id_vida_zanyatiy, chasov)
                    VALUES ('$sem', '$id_uc_pl','$id_pred','1','$lection')";
    $link->query($sql);
  }
  if($prac > 0){
    $sql = "INSERT INTO UCHPLZN (semestr, id_uch_plan, id_predmeta, id_vida_zanyatiy, chasov)
                    VALUES ('$sem', '$id_uc_pl','$id_pred','2','$prac')";
    $link->query($sql);
  }
  if($labs > 0){
    $sql = "INSERT INTO UCHPLZN (semestr, id_uch_plan, id_predmeta, id_vida_zanyatiy, chasov)
                    VALUES ('$sem', '$id_uc_pl','$id_pred','3','$labs')";
    $link->query($sql);
  }
  if($samost > 0){
    $sql = "INSERT INTO UCHPLZN (semestr, id_uch_plan, id_predmeta, id_vida_zanyatiy, chasov)
                    VALUES ('$sem', '$id_uc_pl','$id_pred','4','$samost')";
    $link->query($sql);
  }
  $sql = "INSERT INTO UCHPLPR (id_uch_plan, semestr, id_predmeta, id_vida_kontrolya, creditov, chasov, shifr_opp)
                  VALUES ('$id_uc_pl', '$sem','$id_pred','$control_type','$credits','$sum_chasov', '$shifr_opp')";
  $link->query($sql);
  mysqli_close($link);
  header("location:" .$_SERVER['PHP_SELF']);
}

function drawRozklad ($link){
      if ($result = $link->query("SELECT * FROM DN")) {
         echo '<tr class="active"> <td></td>';
           while($row = $result->fetch_assoc()){
            $day  = $row['dn2u'];
             echo "<td class='col-md-2'> $day </td>";
         }
        echo '</tr>';
       }
      if ($result = $link->query("SELECT * FROM PARA")) {
             while($row = $result->fetch_assoc()){
              for ($j=1; $j <=2 ; $j++) {
                if($j==1){
                  $st = $row['start_para'];
                  $fin = $row['fin_para'];
                  $z = $row['numb_para'];
                  echo "<td rowspan='2' class='text-center'> $st - $fin </td>";
                }
                for ($i=1; $i <= 6; $i++) {
                  echo "<td id='$z$i$j'></td>";
            }
            echo '</tr>';
         }
       }
    }
}

 /*function{
   if ($result = $link->query("")) {
         while($row = $result->fetch_assoc()){
           $num = $row['kolvo_sem'];
           if($num==1){
             echo '  <option value="1">1</option>
               <option value="2">2</option>
               <option value="3">3</option>
               <option value="4">4</option>
               <option value="5">5</option>
               <option value="6">6</option>
               <option value="7">7</option>
               <option value="8">8</option>';
               break;
           }
           else {
                 echo '  <option value="9">9</option>
               <option value="10">10</option>
               <option value="11">11</option>
               <option value="12">12</option>' ;
               break;
           }
       }
     }
 }*/
 function opt_pred_rozklad($link,$ak_group_rozklad,$semestr_rozklad,$std_yearp_rozklad){
   if ($result = $link->query("Select * From uchplpr inner join predm on uchplpr.id_predmeta = predm.predm1
inner join uchpl on uchpl.id_uch_plan = uchplpr.id_uch_plan
inner join akgrp on akgrp.AKGRP7 = uchpl.id_uch_plan
WHERE uchplpr.semestr = $semestr_rozklad and AKGRP1 = $ak_group_rozklad")) {
         while($row = $result->fetch_assoc()){
           $num =$row['predm1'];
         echo"<option value=\"$num\">" .$row['predm2u'].  "</option>";
       }
     }
 }

 function opt_aud($link){
   if ($result = $link->query("Select * From aud")) {
         while($row = $result->fetch_assoc()){
           $num =$row['aud1'];
         echo"<option value=\"$num\">".$row['aud2']."</option>";
       }
     }
 }

 function opt_korp($link){
   if ($result = $link->query("Select * From KORP")) {
         while($row = $result->fetch_assoc()){
           $num =$row['korp1'];
         echo"<option value=\"$num\">" .$row['korp3u'].  "</option>";
       }
     }
 }

 function opt_group($link){
   if ($result = $link->query("Select * From akgrp")) {
         while($row = $result->fetch_assoc()){
           $num =$row['AKGRP1'];
         echo"<option value=\"$num\">" .$row['AKGRP2U'].  "</option>";
       }
     }
 }



function opt_years_rozklad($link){
  if ($result = $link->query("Select * From uchgod")) {
        while($row = $result->fetch_assoc()){
          $num =$row['uchgod1'];
        echo"<option value=\"$num\">" .$row['uchgod2'].  "</option>";
      }
    }
}

function opt_prepod($link){
  if ($result = $link->query("Select * From prep")) {
        while($row = $result->fetch_assoc()){
          $num =$row['PREP1'];
        echo"<option value=\"$num\">" .$row['PREP2U']." ".$row['PREP3U']." ".$row['PREP4U']. "</option>";
      }
    }
}
function all_teachers($link){
  if ($result = $link->query(" SELECT * FROM PREP inner join kaf on prep.PREP5 = kaf.KAF1
  inner join dolg on prep.PREP6 = dolg.DOLG1
  inner join step on prep.PREP7 = step.STEP1
  inner join zvan on prep.PREP8 = zvan.ZVAN1 ")) {
        while($row = $result->fetch_assoc()){
      $surname =  $row['PREP2U'];
      $name =  $row['PREP3U'];
      $secondname =  $row['PREP4U'];
      $kafedra =  $row['KAF5U'];
      $posada =  $row['DOLG2U'];
      $step =  $row['STEP2U'];
      $zvan =  $row['ZVAN2U'];
      $b_day =  $row['PREP9'];


      echo "<tr>
         <td>$surname</td>
         <td>$name</td>
         <td>$secondname</td>
         <td>$kafedra</td>
         <td>$posada</td>
         <td>$step</td>
         <td>$zvan</td>
         <td>$b_day</td>
       </tr>
     ";
      }
    }
}

?>
