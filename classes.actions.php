<?php
$link = mysqli_connect('localhost','root','','maindb');
mysqli_set_charset( $link, 'utf8');

if(isset($_POST['korp_add_rozklad'])){

  $korp_add_rozklad = $_POST['korp_add_rozklad'];

  if ($result = $link->query("Select * From korp inner join aud on korp.korp1 = aud.aud3
  WHERE korp1 = $korp_add_rozklad ORDER BY aud.aud2")) {
      $i = 0;
       while($row = $result->fetch_assoc()){
         $num = $row['aud1'];
         $name = $row['aud2'];
         $auditoty[$i]["addToOpt"] = "<option value = '$num'>$name</option>";
         $auditoty[$i]["addToLi"] =  "<li data-original-index='$i' class=''><a tabindex='0' class='' data-tokens='null' role='option' aria-disabled='false' aria-selected='true'><span class='text'> $name </span><span class='glyphicon glyphicon-ok check-mark'></span></a></li>";
         $i++;
     }
   }
   echo json_encode($auditoty);
    $link->close() ;
}

if(isset($_POST['pred_add_rozklad'])){

  $pred_add_rozklad = $_POST['pred_add_rozklad'];
  $sem_add_rozklad= $_POST['sem_add_rozklad'];
  $akgrp_add_rozklad= $_POST['akgrp_add_rozklad'];

  if ($result = $link->query("Select * From uchplzn inner join uchpl on uchpl.id_uch_plan = uchplzn.id_uch_plan
        inner join akgrp on akgrp.AKGRP7 = uchpl.id_uch_plan
        inner join vidzan on vidzan.vidzan1 = uchplzn.id_vida_zanyatiy
        WHERE uchplzn.semestr = $sem_add_rozklad and AKGRP1 = '$akgrp_add_rozklad' and uchplzn.id_predmeta = '$pred_add_rozklad'
        ORDER BY vidzan1 DESC")) {
              $i = 0;
       while($row = $result->fetch_assoc()){
         $num = $row['vidzan1'];
         $name = $row['vidzan2u'];
         $vidy_zanyatiy[$i]["addToOpt"] = "<option value = '$num'>$name</option>";
         $vidy_zanyatiy[$i]["addToLi"] =  "<li data-original-index='$i' class=''><a tabindex='0' class='' data-tokens='null' role='option' aria-disabled='false' aria-selected='true'><span class='text'> $name </span><span class='glyphicon glyphicon-ok check-mark'></span></a></li>";
         $i++;
     }
   }
   echo json_encode($vidy_zanyatiy);
    $link->close() ;
}

if(isset($_POST['aj1']) && $_POST['aj1'] == 1){
    $korp = $_POST['inp_korp_name'];
    $link->query("INSERT INTO KORP (korp3u)  VALUES ('$korp')");
    $link->close() ;
    header("location:" .$_SERVER['PHP_SELF']);
}

if(isset($_POST['aj1']) && $_POST['aj1'] == 2){
    $korp = $_POST['korp_name'];
    $aud = $_POST['inp_aud_name'];
    $link->query("INSERT INTO AUD (aud2, aud3)  VALUES ('$aud', '$korp')");
    $link->close() ;
}

if(isset($_POST['type_of_aj']) && $_POST['type_of_aj'] == 1){

  $grp = $_POST['group_attend'];
  $year = $_POST['uch_god_attend'];
  $semestr = $_POST['semestr_attend'];

  if ($result = $link->query("Select * From RASP inner join predm on RASP.rasp4 = predm.predm1
  GROUP BY predm2u
  HAVING rasp1 = $grp and rasp2 = $year  and rasp3 = $semestr")) {
              $i = 0;
       while($row = $result->fetch_assoc()){
         $num = $row['predm1'];
         $name = $row['predm2u'];
         $vidy_zanyatiy[$i]["addToOpt"] = "<option value = '$num'>$name</option>";
         $vidy_zanyatiy[$i]["addToLi"] =  "<li data-original-index='$i' class=''><a tabindex='0' class='' data-tokens='null' role='option' aria-disabled='false' aria-selected='true'><span class='text'> $name </span><span class='glyphicon glyphicon-ok check-mark'></span></a></li>";
         $i++;
     }
   }
   echo json_encode($vidy_zanyatiy);

    $link->close() ;
}

if(isset($_POST['type_of_aj']) && $_POST['type_of_aj'] == 2){

  $grp = $_POST['group_attend'];
  $pred= $_POST['pred_attend'];
  $year = $_POST['uch_god_attend'];
  $semestr = $_POST['semestr_attend'];

  if ($result = $link->query("SELECT DISTINCT vidzan1, vidzan2u  From RASP inner join vidzan on RASP.rasp8 = vidzan.vidzan1
  WHERE rasp1 = $grp and rasp2 = $year  and rasp3 = $semestr and rasp4 = $pred ")) {
              $i = 0;
       while($row = $result->fetch_assoc()){
         $num = $row['vidzan1'];
         $name = $row['vidzan2u'];
         $vidy_zanyatiy[$i]["addToOpt"] = "<option value = '$num'>$name</option>";
         $vidy_zanyatiy[$i]["addToLi"] =  "<li data-original-index='$i' class=''><a tabindex='0' class='' data-tokens='null' role='option' aria-disabled='false' aria-selected='true'><span class='text'> $name </span><span class='glyphicon glyphicon-ok check-mark'></span></a></li>";
         $i++;
     }
   }
   echo json_encode($vidy_zanyatiy);

    $link->close() ;
}

if(isset($_POST['type_of_aj']) && $_POST['type_of_aj'] == 3){

  $grp = $_POST['group_attend'];
  $pred= $_POST['pred_attend'];
  $year = $_POST['uch_god_attend'];
  $semestr = $_POST['semestr_attend'];
  $vdzn = $_POST['vidzan_attend'];
  if ($result = $link->query("SELECT DISTINCT PREP1,PREP2U From RASP inner join prep on RASP.rasp5 = prep.PREP1
  WHERE rasp1 = $grp and rasp2 = $year  and rasp3 = $semestr and rasp4 = $pred and rasp8 = $vdzn ")) {
              $i = 0;
       while($row = $result->fetch_assoc()){
         $num = $row['PREP1'];
         $name = $row['PREP2U'];
         $vidy_zanyatiy[$i]["addToOpt"] = "<option value = '$num'>$name</option>";
         $vidy_zanyatiy[$i]["addToLi"] =  "<li data-original-index='$i' class=''><a tabindex='0' class='' data-tokens='null' role='option' aria-disabled='false' aria-selected='true'><span class='text'> $name </span><span class='glyphicon glyphicon-ok check-mark'></span></a></li>";
         $i++;
     }
   }
   echo json_encode($vidy_zanyatiy);

    $link->close() ;
}

if(isset($_POST['type_of_aj']) && $_POST['type_of_aj'] == 4){

  $grp = $_POST['group_attend'];
  $for_res="<div class='row' id='row_tbl'>
  <table class= 'table table-bordered table-reflow'>
  <tr>

  <td> Фамілія </td>
  <td> Ім`я </td>
  <td> Побатькові </td>
  <td> Годин </td>
   </tr>
  ";
  if ($result = $link->query("SELECT * FROM ST WHERE ST_AKGRP = $grp")) {

       while($row = $result->fetch_assoc()){

         $an_name = $row['ST_F3U'];
         $name_st = $row['ST_F2U'];
         $sur_name_st = $row['ST_F1U'];
         $id_st = $row['ST_ID'];

        $for_res .= "  <tr title=$id_st>

        <td > $sur_name_st </td>
        <td > $name_st </td>
        <td > $an_name </td>
        <td width='100' >   <div class='amount'> <span class='down'>-</span>
    <input type='text' value='0' />
    <span class='up'>+</span></div> </td>

           </tr>";
     }
   }
  $for_res.="</table>  </div>";
   echo $for_res;

    $link->close() ;
}

if(isset($_POST['type_of_aj']) && $_POST['type_of_aj'] == 5){

          $pzan1= $_POST['students_attend'];
          $pzan2= $_POST['uch_god_attend'];
          $pzan3= $_POST['semestr_attend'];
          $pzan4= $_POST['pred_attend'];
          $pzan5= $_POST['date_attend'];
          $pzan6= $_POST['para_attend'];
          $pzan7= $_POST['vidzan_attend'];
          $pzan8= $_POST['prepod_attend'];
          $pzan9= $_POST['hours_attend'];
          $pzan10 = $_POST['aud_attend'];
          for ($i=0; $i < count($pzan1) ; $i++) {
            $link->query("INSERT INTO pzan (pzan1, pzan2, pzan3, pzan4, pzan5, pzan6, pzan7, pzan8, pzan9, pzan10)
            VALUES ('$pzan1[$i]', '$pzan2', '$pzan3', '$pzan4', '$pzan5', '$pzan6', '$pzan7', '$pzan8', '$pzan9[$i]', '$pzan10')");
          }
  $link->close() ;
}

if(isset($_POST['type_of_aj']) && $_POST['type_of_aj'] == 6){
          $group = $_POST['group_attend'];
          $pzan2 = $_POST['uch_god_attend'];
          $pzan3 = $_POST['semestr_attend'];
          $pzan4 = $_POST['pred_attend'];
          $pzan7 = $_POST['vidzan_attend'];
          $result = $link->query("SELECT COUNT(*) FROM ST WHERE ST_AKGRP = $group");
          $row = $result->fetch_assoc();
          $std_amount =  $row['COUNT(*)'];
          $ar_of_std_name = array();
          $ar_of_std_sec_name = array();
          $ar_of_std_fir_name = array();
          $ar_of_std_id = array();
          $ar_of_days = array();
          $ar_of_para = array();
          $ar_of_hours = array();
          if ($result = $link->query("SELECT * FROM ST WHERE ST_AKGRP = $group")) {
              $i_std = 0;
               while($row = $result->fetch_assoc()){
                 $ar_of_std_sec_name[$i_std] = $row['ST_F3U'];
                 $ar_of_std_name[$i_std] = $row['ST_F2U'];
                 $ar_of_std_fir_name [$i_std]= $row['ST_F1U'];
                $ar_of_std_id[$i_std] = $row['ST_ID'];
                 $i_std+=1;
             }
           }
          if ($result = $link->query("SELECT * FROM pzan
            inner join para on pzan.pzan6 = para.numb_para
          WHERE pzan.pzan2 = $pzan2 AND pzan.pzan3 = $pzan3
          AND pzan.pzan4 = $pzan4 AND pzan.pzan7 = $pzan7
          AND pzan.pzan1
          IN ( SELECT st.ST_ID FROM st WHERE st.ST_AKGRP = $group)
          ORDER BY pzan5, pzan6, pzan1")) {
            $i = 1;
            $j = 0;
               while($row = $result->fetch_assoc()){
                  if($i%$std_amount == 0){
                    $ar_of_days[$j] = $row['pzan5'];
                    $ar_of_para[$j] = $row['start_para'];
                    $ar_of_hours[$j][($i - 1)] = $row['pzan9'];
                    $i = 1;
                    $j++;
                  }
                  else{
                    $ar_of_hours[$j][($i - 1)] = $row['pzan9'];
                    $i++;
                  }

             }
           }
          $count_of_columns = count($ar_of_days);

          $for_res = "<div class='row' id='row_tbl'>";

          $div_of_name = "<div class='col-md-5 part_table' >
          <table class= 'table table-bordered table-reflow'>
          <tr>
          <td> Фамілія</br> </td>
          <td> Ім`я </br></td>
          <td> Побатькові </br></td></tr>";

          for ($i=0; $i < $std_amount; $i++) {
            $div_of_name.= "<tr><td>$ar_of_std_fir_name[$i]</td>";
            $div_of_name.= "<td>$ar_of_std_name[$i]</td>";
            $div_of_name.= "<td>$ar_of_std_sec_name[$i]</td></tr>";
          }
            $div_of_name.= "</table></div>";

          $div_of_data = "<div class='col-md-7 part_table' id = 'attend_data'><table class= 'table table-bordered table-reflow'><tr> ";

          for ($z=0; $z < $count_of_columns; $z++) {
            $ins = date("d/m/y",strtotime($ar_of_days[$z]));
            $div_of_data.= "<td >$ins,$ar_of_para[$z]</td>";
          }
          $div_of_data.= "</tr>";
          for ($k=0; $k < $std_amount; $k++) {
            $div_of_data.= "<tr>";
              for ($z=0; $z < $count_of_columns; $z++) {

                $div_of_data.= "<td>".$ar_of_hours[$z][$k]."</td>";
              }
              $div_of_data.= "</tr>";
          }
          $div_of_data.="</table>  </div>";

          $for_res.=$div_of_name;
          $for_res.=$div_of_data;
          $for_res.="</div>";
          echo $for_res;

  $link->close() ;
}

if(isset($_POST['type_of_aj']) && $_POST['type_of_aj'] == 7){
          $group = $_POST['group_attend'];
          $pzan2 = $_POST['uch_god_attend'];
          $pzan3 = $_POST['semestr_attend'];
          $result = $link->query("SELECT COUNT(*) FROM ST WHERE ST_AKGRP = $group");
          $row = $result->fetch_assoc();
          $std_amount =  $row['COUNT(*)'];
          $ar_of_std_name = array();
          $ar_of_std_sec_name = array();
          $ar_of_std_fir_name = array();
          $ar_of_std_id = array();
          $ar_of_days = array();
          $ar_of_para = array();
          $ar_of_hours = array();
          if ($result = $link->query("SELECT * FROM ST WHERE ST_AKGRP = $group")) {
              $i_std = 0;
               while($row = $result->fetch_assoc()){
                 $ar_of_std_sec_name[$i_std] = $row['ST_F3U'];
                 $ar_of_std_name[$i_std] = $row['ST_F2U'];
                 $ar_of_std_fir_name [$i_std]= $row['ST_F1U'];
                $ar_of_std_id[$i_std] = $row['ST_ID'];
                 $i_std+=1;
             }
           }
          if ($result = $link->query("SELECT * FROM pzan
          inner join para on pzan.pzan6 = para.numb_para
          WHERE pzan.pzan2 = $pzan2 AND pzan.pzan3 = $pzan3
          AND pzan.pzan1
          IN ( SELECT st.ST_ID FROM st WHERE st.ST_AKGRP = $group)
          ORDER BY pzan5 ASC, pzan6 ASC, pzan4 ASC, pzan1")) {
            $i = 1;
            $j = 0;
               while($row = $result->fetch_assoc()){
                  if($i%$std_amount == 0){
                    $ar_of_days[$j] = $row['pzan5'];
                    $ar_of_para[$j] = $row['start_para'];
                    $ar_of_hours[$j][($i - 1)] = $row['pzan9'];
                    $i = 1;
                    $j++;
                  }
                  else{
                    $ar_of_hours[$j][($i - 1)] = $row['pzan9'];
                    $i++;
                  }

             }
           }
          $count_of_columns = count($ar_of_days);

          $for_res = "<div class='row' id='row_tbl'>";
          $div_of_name = "<div class='col-md-4 part_table' >
          <table class= 'table table-bordered table-reflow'>
          <tr>
          <td> Студент </br> </td>
          </tr>";

          for ($i=0; $i < $std_amount; $i++) {
            $div_of_name.= "<tr><td>$ar_of_std_fir_name[$i] ";
            $div_of_name.= "$ar_of_std_name[$i] ";
            $div_of_name.= "$ar_of_std_sec_name[$i]</td></tr>";
          }
            $div_of_name.= "</table></div>";

          $div_of_data = "<div class='col-md-8 part_table' id = 'attend_data'><table class= 'table table-bordered table-reflow'><tr> ";

          for ($z=0; $z < $count_of_columns; $z++) {
            $ins = date("d/m/y",strtotime($ar_of_days[$z]));
            $div_of_data.= "<td >$ins,$ar_of_para[$z]</td>";
          }
          $div_of_data.= "</tr>";
          for ($k=0; $k < $std_amount; $k++) {
            $div_of_data.= "<tr>";
              for ($z=0; $z < $count_of_columns; $z++) {

                $div_of_data.= "<td>".$ar_of_hours[$z][$k]."</td>";
              }
              $div_of_data.= "</tr>";
          }
          $div_of_data.="</table>  </div>";

          $for_res.=$div_of_name;
          $for_res.=$div_of_data;
          $for_res.="</div>";
          echo $for_res;

  $link->close() ;
}

if(isset($_POST['type_of_aj']) && $_POST['type_of_aj'] == 8){
          $groups = $_POST['group_attend'];
          $year= $_POST['uch_god_attend'];
          $sem = $_POST['semestr_attend'];
          $day  = $_POST['day'];
          $time = $_POST['para'];

          $fr_res = array();
          if ($result = $link->query("SELECT * FROM pzan
          inner join para on pzan.pzan6 = para.numb_para
          inner join aud on aud.aud1 = pzan.pzan10
          inner join korp on aud.aud3 = korp.korp1
          WHERE
          para.start_para = '$time'
          AND pzan.pzan5 = '$day'
          AND pzan.pzan2 = $year
          AND pzan.pzan3 = $sem
          AND pzan.pzan1
          IN ( SELECT st.ST_ID FROM st WHERE st.ST_AKGRP = $groups)
          ORDER BY pzan5 ASC, pzan6 ASC, pzan4 ASC, pzan1")) {
               while($row = $result->fetch_assoc()){
                 $fr_res[0] = $row['pzan4'];
                 $fr_res[1] = $row['aud3'];
                 $fr_res[2] = $row['pzan6'];
                 $fr_res[3] = $row['pzan7'];
                 $fr_res[4] = $row['pzan8'];
                 $fr_res[5] = $row['pzan10'];
                  }
             }
          echo $fr_res[0]."@".$fr_res[1]."@".$fr_res[2]."@".$fr_res[3]."@".$fr_res[4]."@".$fr_res[5];
          $link->close() ;
}

if(isset($_POST['type_of_aj']) && $_POST['type_of_aj'] == 9){

          $pzan1= $_POST['students_attend'];
          $pzan2= $_POST['uch_god_attend'];
          $pzan3= $_POST['semestr_attend'];
          $pzan4= $_POST['pred_attend'];
          $pzan5= $_POST['date_attend'];
          $pzan6= $_POST['para_attend'];
          $pzan7= $_POST['vidzan_attend'];
          $pzan8= $_POST['prepod_attend'];
          $pzan9= $_POST['hours_attend'];
          $pzan10 = $_POST['aud_attend'];

          $year= $_POST['old_year'];
          $sem = $_POST['old_sem'];
          $day  = $_POST['old_date'];
          $time = $_POST['old_numbpara'];

          $numbpara;
          switch($time){
            case "08:30":
            $numbpara = 1;
            break;
            case "10:25":
            $numbpara = 2;
            break;
            case "12:35":
            $numbpara = 3;
            break;
            case "14:30":
            $numbpara = 4;
            break;
            case "16:25":
            $numbpara = 5;
            break;
            case "18:10":
            $numbpara = 6;
            break;
          }


           for ($i=0; $i < count($pzan1) ; $i++) {
             $link->query("
             UPDATE pzan
              SET
              pzan2 = $pzan2,
              pzan3 = $pzan3,
              pzan4 = $pzan4,
              pzan5 = '$pzan5',
              pzan6 = $pzan6,
              pzan7 = $pzan7,
              pzan8 = $pzan8,
              pzan9 = $pzan9[$i],
              pzan10 = $pzan10
              WHERE
              pzan1 = $pzan1[$i] AND
              pzan2 = $year AND
              pzan3 = $sem AND
              pzan5 = '$day' AND
              pzan6 = $numbpara
             ");
           }
  $link->close() ;
}

if(isset($_POST['type_of_aj']) && $_POST['type_of_aj'] == 10){

          $year= $_POST['old_year'];
          $sem = $_POST['old_sem'];
          $day  = $_POST['old_date'];
          $time = $_POST['old_numbpara'];

          $numbpara;
          switch($time){
            case "08:30":
            $numbpara = 1;
            break;
            case "10:25":
            $numbpara = 2;
            break;
            case "12:35":
            $numbpara = 3;
            break;
            case "14:30":
            $numbpara = 4;
            break;
            case "16:25":
            $numbpara = 5;
            break;
            case "18:10":
            $numbpara = 6;
            break;
          }

           $link->query("
            DELETE FROM pzan
            WHERE
            pzan2 = $year AND
            pzan3 = $sem AND
            pzan5 = '$day' AND
            pzan6 = $numbpara
           ");

  $link->close() ;
}


//1 код студента
//2 код учебного года
//3 номер семестра
//4 код предмета
//5 Дата проведения
//6 Время начала
//7 Код вида занятия
//8 Код преподавателя
//9 Часов (0, 1, 2)
//10 Код аудитории








 ?>
