<?php
$link = mysqli_connect('localhost','root','','maindb');
mysqli_set_charset( $link, 'utf8');
session_start();

if(isset($_POST['add_uc_pl'])){
  $vvod = $_POST['vveden'];
  $kval = $_POST['selkval'];
  $spezz = $_POST['spezz'];
  $id_kade = $_POST['vibor_kaf'];
  $link->query("INSERT INTO UCHPL(id_kafedry, vveden,id_spec_z, id_kval)  VALUES ('$id_kade','$vvod','$spezz',$kval)");
  mysqli_close($link);
  header("location:" .$_SERVER['PHP_SELF']);
}

if( !isset($_SESSION['id_uc_pl'])&& isset($_GET['id_uc_pl'])){
  $_SESSION['id_uc_pl'] = $_GET['id_uc_pl'];
  }

  if(
  isset($_SESSION['id_uc_pl'])&&
  isset($_GET['semestr'])&&
  isset($_GET['id_predmeta'])&&
  isset($_GET['name'])
  ){
  $usl_uch_plan = $_SESSION['id_uc_pl'];
  $usl_sem = $_GET['semestr'];
  $usl_id_pred = $_GET['id_predmeta'];
  $pred = $_GET['name'];
  }

if(isset($_POST['add_predmet_to_plan'])){
  add_predmet_to_plan($link,$_SESSION['id_uc_pl'],$_POST['shifr_opp'],$_POST['predmet'],$_POST['lection'],
  $_POST['labs'],$_POST['prac'],$_POST['samost'],$_POST['credits'],$_POST['control_type'],$_POST['idz_type'], $_POST['sem']);
}

if(isset($_POST['del_predmet'])){
  delete_predmet($link,$_SESSION['id_uc_pl'],$_POST['id_prdmt'],$_POST['inp_sem']);
  mysqli_close($link);
  header("location:" .$_SERVER['PHP_SELF']);

}

if(isset($_POST['edit_predmet'])){
  delete_predmet($link,$_SESSION['id_uc_pl'],$_POST['id_prdmt'],$_POST['inp_sem']);
  add_predmet_to_plan($link,$_SESSION['id_uc_pl'],$_POST['shifr_opp'],$_POST['id_prdmt'],$_POST['lection'],
  $_POST['labs'],$_POST['prac'],$_POST['samost'],$_POST['credits'],$_POST['control_type'],$_POST['idz_type'], $_POST['inp_sem']);
}

if(isset($_POST['add_new_pred'])){
  $ua_nazva_pred = $_POST['ua_nazva_pred'];
  $ua_nazva_pred_shrt = $_POST['ua_nazva_pred_shrt'];
  $link->query("INSERT INTO PREDM(PREDM2U, PREDM3U)  VALUES ('$ua_nazva_pred', '$ua_nazva_pred_shrt')");
  mysqli_close($link);
  header("location:" .$_SERVER['PHP_SELF']);

}

if(isset($_POST['add_spez'])){

        $id_napr = $_POST['napr'];
        $ua_nazva_spec = $_POST['ua_nazva_spec'];
        $rus_nazva_spec = $_POST['rus_nazva_spec'];
        $en_nazva_spec = $_POST['en_nazva_spec'];
        $shfr_spec = $_POST['shfr_spec'];

        $sql = "INSERT INTO SPEZ (SPEZ2R, SPEZ2E, SPEZ2U, SPEZ3, SPEZ4 )
                        VALUES ('$rus_nazva_spec', '$en_nazva_spec', '$ua_nazva_spec','$id_napr','$shfr_spec')";
        if($link->query($sql)){
        mysqli_close($link);
        header("location:" .$_SERVER['PHP_SELF']);
      }
}

if(isset($_POST['add_spezz'])){
  $id_spec = $_POST['id_spec'];
  $ua_nazva_spec_z = $_POST['ua_nazva_spec_z'];
  $rus_nazva_spec_z = $_POST['rus_nazva_spec_z'];
  $en_nazva_spec_z = $_POST['en_nazva_spec_z'];
  $shifr_spec_z = $_POST['shifr_spec_z'];

  $sql = "INSERT INTO SPEZZ (SPEZZ2R, SPEZZ2E, SPEZZ2U, SPEZZ3, SPEZZ4)
                  VALUES ('$rus_nazva_spec_z','$en_nazva_spec_z', '$ua_nazva_spec_z','$id_spec','$shifr_spec_z')";
  if($link->query($sql)){
    mysqli_close($link);
    header("location:" .$_SERVER['PHP_SELF']);
    }
}

if(isset($_POST['add_napr'])){
  $ua_napr = $_POST['ua_nazva_napr'];
  $rus_napr = $_POST['rus_nazva_napr'];
  $en_napr = $_POST['en_nazva_napr'];
  $shfr_napr = $_POST['shfr_napr'];
  $sql = "INSERT INTO NAPR ( NAPR2U, NAPR2R, NAPR2E, NAPR3) VALUES ('$ua_napr','$rus_napr','$en_napr', '$shfr_napr')";
  if($link->query($sql)){
    $link->close() ;
    header("location:" .$_SERVER['PHP_SELF']);
  }

}

if(isset($_POST['add_kval_lvl'])){
  $ua_kval_lvl = $_POST['ua_nazva_kval_lvl'];
  $rus_kval_lvl = $_POST['rus_nazva_kval_lvl'];
  $en_kval_lvl = $_POST['en_nazva_kval_lvl'];
  $kol_sem = $_POST['kol_sem'];
  $sql = "INSERT INTO KVALUR (ua_name_kval_lvl, rus_name_kval_lvl, en_name_kval_lvl, kolvo_sem)
  VALUES ('$ua_kval_lvl', '$rus_kval_lvl', '$en_kval_lvl', $kol_sem)";

  if($link->query($sql)){
    $link->close() ;
    header("location:" .$_SERVER['PHP_SELF']);
  }
}

if(isset($_POST['add_kval'])){
  $ua_kval = $_POST['ua_nazva_kval'];
  $rus_kval = $_POST['rus_nazva_kval'];
  $en_kval = $_POST['en_nazva_kval'];
  $kval_lvl = $_POST['kval_lvl'];
  $sql = "INSERT INTO KVAL (ua_name_kval, rus_name_kval, en_name_kval, id_kval_lvl)
  VALUES ('$ua_kval', '$rus_kval', '$en_kval',$kval_lvl)";

  if($link->query($sql)){
    $link->close() ;
    header("location:" .$_SERVER['PHP_SELF']);
  }
}

if(isset($_POST['rozk_semestr'])){
  $usl_of_sem = $_POST['rozk_semestr'];
  $usl_of_gr = $_POST['ak_group'];
  $usl_of_year = $_POST['uch_god'];
  if ($result = $link->query("Select * From rasp inner join akgrp on akgrp.AKGRP1 = rasp.rasp1
  inner join uchgod on uchgod.uchgod1 = rasp.rasp2
  inner join predm on predm.predm1 = rasp.rasp4
  inner join prep on prep.prep1 = rasp.rasp5
  inner join vidzan on vidzan.vidzan1 = rasp.rasp8
  inner join aud on aud.aud1 = rasp.rasp9
  inner join korp on aud.aud3 = korp.korp1
  inner join dolg on prep.prep6 = dolg.dolg1
  WHERE rasp3 = $usl_of_sem AND rasp1 = $usl_of_gr AND rasp2 = $usl_of_year" )) {
        $i=0;
       while($row = $result->fetch_assoc()){

          $data[$i]["predmet"] = $row['predm2u'];
          $data[$i]["prepod"] = $row['PREP2U'];
          $data[$i]["prep_n"] = $row['PREP3U'];
          $data[$i]["prep_s"] = $row['PREP4U'];
          $data[$i]["aud"] = $row['aud2'];
          $data[$i]["korpus"] = $row['korp3u'];
          $data[$i]["vidzan"] = $row['vidzan3u'];
          $data[$i]["den"] = $row['rasp6'];
          $data[$i]["week"] = $row['rasp10'];
          $data[$i]["para"] = $row['rasp7'];
          $data[$i]["zvan"] = $row['DOLG3U'];
          $i++;
     }
   }

   echo json_encode($data);
    $link->close() ;
}

if(isset($_POST['group_chosen_rozklad_aj'])){

  $group_chosen_rozklad_aj = $_POST['group_chosen_rozklad_aj'];
    if ($result = $link->query("Select * FROM akgrp inner join uchpl on AKGRP7 = uchpl.id_uch_plan
    inner join kval on kval.id_kval = uchpl.id_kval
    inner join kvalur on kval.id_kval_lvl = kvalur.id_kval_lvl
    WHERE AKGRP1 = $group_chosen_rozklad_aj")) {
       while($row = $result->fetch_assoc()){
         if ($row['kolvo_sem'] == 1){
            for ($i=0; $i <8 ; $i++) {
              $znach = $i+1;
              $zapisi[$i]['appToSel'] =  "<option value = '$znach'>$znach</option>";
              $zapisi[$i]['appToLi'] = "<li data-original-index='$i' class=''><a tabindex='0' class='' data-tokens='null' role='option' aria-disabled='false' aria-selected='true'><span class='text'> $znach </span><span class='glyphicon glyphicon-ok check-mark'></span></a></li>";
            }
         }
         else{
           for ($i=0; $i <4 ; $i++) {
             $znach = $i+9;
             $znach2 = $i+8;
             $zapisi[$i]['appToSel'] = "<option value = '$znach'>$znach</option>";
             $zapisi[$i]['appToLi'] = "<li data-original-index='$znach2' class=''><a tabindex='0' class='' data-tokens='null' role='option' aria-disabled='false' aria-selected='true'><span class='text'> $znach </span><span class='glyphicon glyphicon-ok check-mark'></span></a></li>";
           }
         }
     }
   }
   echo json_encode($zapisi);
    $link->close() ;
}

if(isset($_POST['add_predmet_to_rozklad'])){
  $rasp1 = $_POST['akgrp_add_rozklad']; $rasp2 = $_POST['std_year_rozklad']; $rasp3 = $_POST['sem_add_rozklad']; $rasp4 = $_POST['predmet'];
  $rasp5 = $_POST['prepodav']; $rasp6 = $_POST['day_of_week']; $rasp7 = $_POST['numb_para']; $rasp8 = $_POST['vid_zan_add_rozklad'];
  $rasp9 = $_POST['aud_add_rozklad']; $rasp10 = $_POST['num_of_week'];
  $link->query("INSERT INTO rasp (rasp1, rasp2, rasp3, rasp4, rasp5, rasp6, rasp7, rasp8, rasp9, rasp10)
    VALUES ( '$rasp1', '$rasp2', '$rasp3', '$rasp4', '$rasp5', '$rasp6', '$rasp7', '$rasp8', '$rasp9', '$rasp10')");
  mysqli_close($link);
  header("location:" .$_SERVER['PHP_SELF']);
}

if(isset($_POST['add_new_prepodavatel'])){
  $prep9 = $_POST['b_day_prepod']; $prep2e = $_POST['en_frst_name_prepoda'];
   $prep2u = $_POST['ua_frst_name_prepoda']; $prep2r = $_POST['rus_frst_name_prepoda'];
  $prep3e = $_POST['en_name_prepoda']; $prep3u = $_POST['ua_name_prepoda'];
  $prep3r = $_POST['rus_name_prepoda']; $prep4r = $_POST['rus_sec_name_prepoda'];
  $prep4u = $_POST['ua_sec_name_prepoda']; $prep4e = $_POST['en_sec_name_prepoda'];
  $prep5 = $_POST['kafedra']; $prep6 = $_POST['posada'];
  $prep7 = $_POST['step']; $prep8 = $_POST['zvan'];
  $link->query("INSERT INTO PREP (PREP9, PREP2U, PREP2R, PREP2E, PREP3U, PREP3R, PREP3E, PREP4U, PREP4R, PREP4E, PREP5, PREP6, PREP7, PREP8)
    VALUES ( '$prep9', '$prep2u', '$prep2r', '$prep2e', '$prep3u', '$prep3r', '$prep3e', '$prep4u', '$prep4r', '$prep4e', '$prep5', '$prep6', '$prep7', '$prep8')");
  mysqli_close($link);
  header("location:" .$_SERVER['PHP_SELF']);
}

if(isset($_POST['st_gr'])){

  $st_gr = $_POST['st_gr'];

  if ($result = $link->query("Select * FROM ST WHERE ST_AKGRP = $st_gr")) {
        $i=0;
       while($row = $result->fetch_assoc()){
         $znach_f = $row['ST_F1U'];
         $znach_n = ($row['ST_F2U'] == "") ? "" : (mb_substr( $row['ST_F2U'], 0, 1,'UTF8').".");
         $znach_s = ($row['ST_F3U'] == "") ? "" : (mb_substr( $row['ST_F3U'], 0, 1,'UTF8').".");
         $znach_val = $row['ST_ID'];
         $znach = $znach_f." ".$znach_n." ".$znach_s;

         $zapisi[$i]['appToSelToStd'] =  "<option value = '$znach_val'>$znach</option>";
         $zapisi[$i]['appToLiToStd'] = "<li data-original-index='$i' class=''><a tabindex='0' class='' data-tokens='null' role='option' aria-disabled='false' aria-selected='true'><span class='text'> $znach </span><span class='glyphicon glyphicon-ok check-mark'></span></a></li>";
         $i++;
     }
   }
   echo json_encode($zapisi);
    $link->close() ;
}

if(isset($_POST['obj']) && isset($_POST['predm']) && isset($_POST['int'])){

      $group = $_POST['group_pl_at'];
      $sem_pl_at = $_POST['sem_pl_at'];
      $year_pl_at = $_POST['year_pl_at'];
      $predm_pl_at = $_POST['predm_pl_at'];
      $vidzan_pl_at = $_POST['vidzan_pl_at'];
      $usl_intervala ="";
      $usl_predmeta ="";
      $fio_grp = array();
      $days = array();
      $perc = array();
      $t_perc = array();
      $b_perc = array();

      if( $_POST['int'] == 2){
        $top_pl_at = $_POST['top_pl_at'];
        $bot_pl_at = $_POST['bot_pl_at'];
        $usl_intervala .= "  AND date_of_week_end BETWEEN '$bot_pl_at' AND '$top_pl_at' ";
      }

      $predm = $_POST['predm'];
      if( $predm > 1){
        $usl_predmeta .= "  AND id_predmeta = '$predm_pl_at' ";
          if( $predm > 2){
        $usl_predmeta .= "  AND id_vidzan = '$vidzan_pl_at' ";
          }
      }

      if( $_POST['obj'] == 2){
        $std_pl_at = $_POST['std_pl_at'];

        if ($result = $link->query("select distinct date_of_week_end from attend_plan
        inner join st on st.ST_ID = attend_plan.id_st
        where  semestr = $sem_pl_at ".$usl_predmeta."
        and id_std_year = $year_pl_at
        and  id_st = $std_pl_at".$usl_intervala." ORDER BY date_of_week_end")){

        while($row = $result->fetch_assoc()){
          $days [] = $row['date_of_week_end'];
          }
        }


        if ($result = $link->query("select * from attend_plan
        inner join st on st.ST_ID = attend_plan.id_st
        where  semestr = $sem_pl_at ".$usl_predmeta."
        and id_std_year = $year_pl_at
        and  id_st = $std_pl_at".$usl_intervala." ORDER BY id_predmeta, id_vidzan, date_of_week_end, id_st")){
        $i = 0;
        while($row = $result->fetch_assoc()){
          $stroka = $row['date_of_week_end'];
          if($i == 0){
            $fio_grp = $row['ST_F1U'] ." ".$row['ST_F2U'] ." ".$row['ST_F3U'];
            }
          $perc[$stroka][] = $row['plan_perc'];
          $t_perc[$stroka][] = $row['top_perc'];
          $b_perc [$stroka][] = $row['bot_perc'];
              }
        }

        if( count($perc) != 0 ){
          $for_res = "<div class='row' id='row_tbl'>";

          $div_of_name = "<div class='col-md-5 part_table' id='at_names'>
          <table class= 'table table-bordered table-reflow'>
          <tr> <td> Cтудент</td></tr>
          <tr> <td>$fio_grp</td></tr></table></div>
          ";
          $div_of_data = "<div class='col-md-7 part_table' id = 'attend_data'>
          <table class= 'table table-bordered table-reflow'>
          <tr> ";

          for ($i=0; $i < count($days); $i++) {
            $ins = date("d/m/y",strtotime($days[$i]));
          $div_of_data.= "<td colspan='3'>$ins,%</td>";
          }
          $div_of_data.= "</tr><tr>";
          for ($i=0; $i < count($days); $i++) {
            $pb = array_sum($b_perc[$days[$i]])/count ($b_perc[$days[$i]]);
            $pp = array_sum($perc[$days[$i]])/count ($perc[$days[$i]]);
            $pt = array_sum($t_perc[$days[$i]])/count ($t_perc[$days[$i]]);
          $div_of_data.= "<td>$pb</td><td>$pp</td><td>$pt</td>";
          }
          $div_of_data.= "</tr></table></div>";

          $for_res.=$div_of_name;
          $for_res.=$div_of_data;
          $for_res.="
          <input  class='btn btn-primary ' type='button'  value='Переглянути траєкторії 'id='at_pl_show_traectory'  >
          <div id='curve_chart' style= 'height: 500px; display: none;' ></div>
          <div id='wrap_chart' style= 'height: 500px; display: none;' ></div>
            </div>";
          echo $for_res;
        }
        else{
          echo "<h3 id='row_tbl'>Немає даних за цим запитом</h3>";
        }
      }

    else{
          $id_st_gr;
          if ($result = $link->query("select distinct id_st, ST_F1U, ST_F2U, ST_F3U from attend_plan
          inner join st on st.ST_ID = attend_plan.id_st
          where  semestr = $sem_pl_at ".$usl_predmeta."
          and id_std_year = $year_pl_at
          and  ST_AKGRP = $group".$usl_intervala."
          ORDER BY id_st")){
          while($row = $result->fetch_assoc()){
              $fio_grp[] = $row['ST_F1U'] ." ".$row['ST_F2U'] ." ".$row['ST_F3U'];
              $id_st_gr[] = $row['id_st'];
          }
        }

        if ($result = $link->query("select distinct date_of_week_end from attend_plan
        inner join st on st.ST_ID = attend_plan.id_st
        where  semestr = $sem_pl_at ".$usl_predmeta."
        and id_std_year = $year_pl_at
        and  ST_AKGRP = $group".$usl_intervala."
        ORDER BY  date_of_week_end ")){
        while($row = $result->fetch_assoc()){
          $days[] = $row['date_of_week_end'];
        }
      }
          if ($result = $link->query("select * from attend_plan
          inner join st on st.ST_ID = attend_plan.id_st
          where  semestr = $sem_pl_at ".$usl_predmeta."
          and id_std_year = $year_pl_at
          and  ST_AKGRP = $group".$usl_intervala."
          ORDER BY id_predmeta, id_vidzan, date_of_week_end, id_st")){
          while($row = $result->fetch_assoc()){
            $stroka = $row['date_of_week_end'];
            $for_data_id =  $row['id_st'];
            $perc[$for_data_id][$stroka][] = $row['plan_perc'];
            $t_perc[$for_data_id][$stroka][] = $row['top_perc'];
            $b_perc[$for_data_id][$stroka][] = $row['bot_perc'];
          }
        }
          if(count($days) != 0 ){

            $for_res = "<div class='row' id='row_tbl'>";

            $div_of_name = "<div class='col-md-5 part_table' id='at_names'>
            <table class= 'table table-bordered table-reflow'>
            <tr> <td> Cтудент</td></tr> ";
            foreach ($fio_grp as $intoTbl) {
                $div_of_name.="<tr> <td>$intoTbl</td></tr>";
            }
            $div_of_name.="<tr><td>Дані за групою</td></tr></table></div>";

            $div_of_data = "<div class='col-md-7 part_table' id = 'attend_data'>
            <table class= 'table table-bordered table-reflow'> <tr>";

            // array_multisort($perc);
            // array_multisort($t_perc);
            // array_multisort($b_perc);
            for ($j=0; $j < count($days); $j++) {
              $ins = date("d/m/y",strtotime($days[$j]));
              $div_of_data.= "<td colspan='3'>$ins,%</td>";
            }
            $div_of_data.="</tr><tr>";

            $sumB;
            $sum;
            $sumT;

            for ($i=0; $i < count($id_st_gr); $i++) {

              for ($j=0; $j < count($days); $j++) {
                if(isset($b_perc[$id_st_gr[$i]][$days[$j]])) {
                  $pb = array_sum($b_perc[$id_st_gr[$i]][$days[$j]])/count ($b_perc[$id_st_gr[$i]][$days[$j]]);
                  $pp = array_sum($perc[$id_st_gr[$i]][$days[$j]])/count ($perc[$id_st_gr[$i]][$days[$j]]);
                  $pt = array_sum($t_perc[$id_st_gr[$i]][$days[$j]])/count ($t_perc[$id_st_gr[$i]][$days[$j]]);

                  $sumB[$days[$j]][]=$pb;
                  $sum[$days[$j]][]=$pp;
                  $sumT[$days[$j]][]=$pt;

                  $div_of_data.= "<td>$pb</td><td>$pp</td><td>$pt</td>";
                }
                else{
                  $div_of_data.= "<td>0</td><td>0</td><td>0</td>";
                  $sumB[$days[$j]][]=0;
                  $sum[$days[$j]][]=0;
                  $sumT[$days[$j]][]=0;
                }
              }
              $div_of_data.="</tr><tr>";
            }

            for ($j=0; $j < count($days); $j++) {
              $avgB =  round(array_sum($sumB[$days[$j]])/count($sumB[$days[$j]]),2);
              $avg =  round(array_sum($sum[$days[$j]])/count($sum[$days[$j]]),2);
              $avgT =  round(array_sum($sumT[$days[$j]])/count($sumT[$days[$j]]),2);
              $div_of_data.= "<td>$avgB</td><td>$avg</td><td>$avgT</td>";
            }

            $div_of_data.= " </tr></table></div>";

            $for_res.=$div_of_name;
            $for_res.=$div_of_data;
            $for_res.="
            <input  class='btn btn-primary ' type='button'  value='Переглянути траєкторії 'id='at_pl_show_traectory'  >
            <div id='curve_chart' style= 'height: 500px; display: none;' ></div>
            <div id='wrap_chart' style= 'height: 500px; display: none;' ></div>
              </div>";
            echo $for_res;

          }
          else {
            echo "<h3 id='row_tbl'>Немає даних за цим запитом</h3>";
          }
        }

  $link->close();
}

if(isset($_POST['get_obj']) && isset($_POST['get_predm'])&& isset($_POST['get_int'])){

      $group = $_POST['group_pl_at'];
      $sem_pl_at = $_POST['sem_pl_at'];
      $year_pl_at = $_POST['year_pl_at'];
      $predm_pl_at = $_POST['predm_pl_at'];
      $vidzan_pl_at = $_POST['vidzan_pl_at'];
      $std_pl_at = $_POST['std_pl_at'];
      $usl_intervala ="";
      $usl_predmeta ="";
      $usl_predmeta_pzan ="";
      $usl_std ="";
      $usl_std_pzan ="";
      $days;


    if( $_POST['get_int'] == 2){
      $top_pl_at = $_POST['top_pl_at'];
      $bot_pl_at = $_POST['bot_pl_at'];
      $usl_intervala .= "  AND date_of_week_end BETWEEN '$bot_pl_at' AND '$top_pl_at' ";
    }

    $predm = $_POST['get_predm'];

    if( $predm > 1){
      $usl_predmeta .= "  AND id_predmeta = '$predm_pl_at' ";
      $usl_predmeta_pzan .= "  AND pzan4 = '$predm_pl_at' ";
        if( $predm > 2){
      $usl_predmeta .= "  AND id_vidzan = '$vidzan_pl_at' ";
      $usl_predmeta_pzan .= "  AND pzan7 = '$vidzan_pl_at' ";
        }
    }

    if($_POST['get_obj'] == 1){
      $usl_std_pzan .= " AND pzan1 IN (SELECT ST_ID FROM ST WHERE ST_AKGRP = '$group') ";
      $usl_std .= " AND id_st IN (SELECT ST_ID FROM ST WHERE ST_AKGRP = '$group') ";
    }
    else if($_POST['get_obj'] == 2){
      $usl_std_pzan .= " AND pzan1 = '$std_pl_at' ";
      $usl_std .= " AND id_st = '$std_pl_at' ";
    }




      if ($result = $link->query("select distinct date_of_week_end from attend_plan
      inner join st on st.ST_ID = attend_plan.id_st
      where  semestr = $sem_pl_at ".$usl_predmeta."
      and id_std_year = $year_pl_at".$usl_std.$usl_intervala." ORDER BY date_of_week_end")){

      while($row = $result->fetch_assoc()){
        $days[] = $row['date_of_week_end'];
        }
      }

      $fact = array();
      $max_at = array();
      for ($i=0; $i < count($days); $i++) {
        $sum = 0;
        $max_at[$i] = 0;
      if($i == 0){
        if ($result = $link->query("select * from pzan
          where  pzan3 = $sem_pl_at
          ".$usl_predmeta_pzan."
          and pzan2 = $year_pl_at
          ".$usl_std_pzan."
          and  pzan5 <= '$days[$i]'
          ORDER BY pzan5, pzan6, pzan4, pzan1")){
          while($row = $result->fetch_assoc()){
            $sum += $row['pzan9'];
            $max_at[$i] +=2;
              }
            }
          }
      else{
        $kon = $i-1;
        if ($result = $link->query("select * from pzan
          where  pzan3 = $sem_pl_at ".$usl_predmeta_pzan."
          and pzan2 = $year_pl_at
            ".$usl_std_pzan."
          and  pzan5 > '$days[$kon]' and pzan5 <= '$days[$i]'
          ORDER BY pzan5, pzan6, pzan4, pzan1")){
          while($row = $result->fetch_assoc()){
              $sum += $row['pzan9'];
              $max_at[$i] +=2;
              }
            }
          }
          $fact[$i] = $sum;
      }
      $fr_res = array();
      for ($i=0; $i < count($fact); $i++) {
        if($max_at[$i] == 0){
            $fr_res[$i] = 100;
        }
        else{
        $fr_res[$i] = round ((($fact[$i]/$max_at[$i])*100),2);
      }
    }
      echo json_encode($fr_res);



}

if(isset($_POST['send_obj']) && isset($_POST['send_predm'])){
     $send_obj = $_POST["send_obj"];
     $send_predm = $_POST["send_predm"];
     $get_grppp = $_POST["get_grppp"];
     $get_sem = $_POST["get_sem"];
     $get_year = $_POST["get_year"];

     $get_plan = $_POST["get_plan"];
     $get_b_plan = $_POST["get_b_plan"];
     $get_t_plan = $_POST["get_t_plan"];
     $get_datu_konca= $_POST["get_datu_konca"];


     $usl_predm="";


    $mas_st;
     if($send_obj == 1){
        if ($result = $link->query("
       select ST_ID FROM ST WHERE ST_AKGRP = $get_grppp")){
        while($row = $result->fetch_assoc()){
          $mas_st[] = $row['ST_ID'];
          }
        }
     }
     else if($send_obj == 2){
        $mas_st[] = $_POST["get_stud"];
     }

    if($send_predm > 1){
      $get_pred = $_POST["get_pred"];
      $usl_predm.=" AND rasp4 = '$get_pred' ";
      if($send_predm > 2){
      $get_vid = $_POST["get_vid"];
      $usl_predm.=" AND rasp8 = '$get_vid' ";
      }
    }


    $predm_vidzan;
     if ($result = $link->query("
    select distinct rasp4, rasp8 from rasp
    where rasp1 = $get_grppp
    and rasp2 = $get_year".$usl_predm."
    and rasp3 = $get_sem ")){
     while($row = $result->fetch_assoc()){
       $str = $row['rasp4'];
       $stlb  = $row['rasp8'];
       $predm_vidzan[$str][] = $stlb;
       }
     }

     foreach ($predm_vidzan as $i_pr => $pr_mas) {// $i_pr - id predmeta
       foreach ($pr_mas as $vidzan) { // $vidzan - id vidzan
         foreach ($mas_st as $i_st) { // $i_st - id stud
           $link->query("INSERT INTO attend_plan
            (id_st, semestr,id_predmeta, date_of_week_end, id_vidzan,
            plan_perc, top_perc, bot_perc, id_std_year)
           VALUES
           ('$i_st', '$get_sem', '$i_pr', '$get_datu_konca', '$vidzan',
            '$get_plan', '$get_t_plan', '$get_b_plan', '$get_year')");
         }
       }
     }
      mysqli_close($link);
    $fr_res = "Нову планову траэкторію для ";
     switch ($send_obj){
       case 1: $fr_res.= "обраної групи за ";
       break;
       case 2: $fr_res.= "обраного студента за ";
       break;
     }
     switch ($send_predm){
       case 1:  $fr_res.= "всіма дисциплінами додано!";
       break;
       case 2:  $fr_res.= "обраною дисципліною додано!";
       break;
       case 3:  $fr_res.= "обраними дисципліною та видом занять додано!";
       break;
     }
      echo $fr_res;
}






?>
