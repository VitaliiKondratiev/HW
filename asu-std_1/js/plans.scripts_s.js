var mas_fr_ch = [];

$(document).ready(function(){

$('#sorted td').bind('click',function(event){
    var ord = $(event.target).text();
    switch (ord){
        case 'ОПП':
        ord = "LEFT(shifr_opp,3), CAST(RIGHT(shifr_opp,2)AS UNSIGNED )";
        break;
        case 'Назва дисципліни':
        ord = "predm2u";
        break;
        case 'Вид контролю':
        ord = "ua_nazva_kontrolya";
        break;
        case 'Інд. завд.':
        ord = "kratkoe_nazv_ind_zad";
        break;
        case 'Кредити':
        ord = "creditov";
        break;
        case 'Години':
        ord = "chasov";
        break;
        case 'Семестр':
        ord = "UCHPLPR.semestr";
        break;
        default:  ord = "UCHPLPR.semestr";
    }
    if(location.href.indexOf('?')!=-1){
    if(location.href.indexOf('&order=')!=-1){
      location.href = location.href.substring(0,location.href.indexOf('&order='))+"&order="+ord;
    }
    else{
      location.href = location.href+"&order="+ord;
    }
  }
  else{
    location.href = location.href+"?order="+ord;
  }
  });

$('#sorted td').mouseenter( function(){
    this.style.backgroundColor='CCFFFF';
});

$('#sorted td').mouseleave(function(){
    this.style.backgroundColor='0dc3c6';
});

$('#uchebniy_plan tr:not(:last)').click( function(event){
  var s = $(event.target).parent('tr').text();
  var ar = s.split('\n');
  var hrefer = "plans.add_predmet_to_plan.php?";

  hrefer+="change="+ar[1].trim();
  hrefer+="&f="+$(event.target).parent('tr').attr('title').trim();
  hrefer+="&s="+ar[2].trim();
  hrefer+="&t="+ar[5].trim();
  hrefer+="&fr="+ar[7].trim();
  hrefer+="&fv="+ar[8].trim();
  hrefer+="&sx="+ar[9].trim();
  hrefer+="&sv="+ar[10].trim();
  hrefer+="&ei="+ar[11].trim();
 location.href = hrefer;

});

if(location.href.indexOf("change")!=-1){
  $('#del_pr').show();
  $('#change_pr').show();
  $('#inp_pred').show();
  $('#inp_sem').show();
  $('#add_sem').hide();
  $('#add_pr').hide();
  $('#predmet').hide();
  $('#inp_pred input[name="id_prdmt"]').val($.urlParam("f"));
  $('#inp_pred input[name="nzv"]').val($.urlParam("s"));
  $('#add_pred_formy input[name="lection"]').val($.urlParam("fr"));
  $('#add_pred_formy input[name="prac"]').val($.urlParam("fv"));
  $('#add_pred_formy input[name="labs"]').val($.urlParam("sx"));
  $('#add_pred_formy input[name="samost"]').val($.urlParam("sv"));
  $('#credits').val($.urlParam("t"));
  $('#inp_sem input').val($.urlParam("ei"));
  $('#shifr_opp input').val($.urlParam("change"));
}
else{
  $('#del_pr').hide();
  $('#change_pr').hide();
  $('#inp_pred').hide();
  $('#inp_sem').hide();
  $('#add_pr').show();
  $('#predmet').show();
  $('#add_sem').show();
}
//script for fixed foot & head
if (location.href.indexOf("plans.uchebniy_plan.php")!=-1){
    $.setTabledFoot();
    $.setWidthTabledHead();
}
//// // // // // // // // // // // // // // // // CLASSES PART// // // // // // // // // // // // // // // // // // // // // // // // // // // //
// script for  classes.rozklad.php"
if (location.href.indexOf("classes.rozklad.php")!=-1){
    $("#group_chosen_rozklad").change( function(){
      $.clearRozklad();
      $("div.dropdown-menu:eq(2) ul").empty();
      $("#semestr_rozklad").empty();
        $.ajax ({
          url: "plans.actions.php",
          method: "POST",
          data: {
            "group_chosen_rozklad_aj": $('#group_chosen_rozklad').val(),
          },
          dataType : 'json',
          success: function (selsem)
          {
            for (var i = 0; i < selsem.length; i++) {
            $("#semestr_rozklad").append($(selsem[i]['appToSel']));

            $("div.dropdown-menu:eq(2) ul").append($(selsem[i]['appToLi']));
            }
          }
              });
        $('div.bootstrap-select:eq(2) button span:eq(0)').text("Оберіть семестр");

        $('div.bootstrap-select:eq(2) button').mouseenter( function(){
          $('div.dropdown-menu:eq(2) ul li').off("click");
          $('div.dropdown-menu:eq(2) ul li').on("click",$.ajaxForSemestr);
        });
    });

    $('#add_para_rozklad').click(function(){
      if($("#group_chosen_rozklad").val()==null ||  $("#std_year_rozklad").val()==null || $("#semestr_rozklad").val()==null ){
          alert("Заполните все поля!");
          return false;
      }
      var str_rozklad = "/HW/classes.add_pred_rozklad.php?"
      str_rozklad += "group_chosen_rozklad="+$("#group_chosen_rozklad").val();
      str_rozklad += "&std_year_rozklad="+$("#std_year_rozklad").val();
      str_rozklad += "&semestr_rozklad="+$("#semestr_rozklad").val();
      location.href = str_rozklad;
    });
}

// script for  classes.add_pred_rozklad.php"
if (location.href.indexOf("classes.add_pred_rozklad.php")!=-1){
  $('input[name="std_year_rozklad"]').hide();
  $('input[name="sem_add_rozklad"]').hide();
  $('input[name="akgrp_add_rozklad"]').hide();
  $('input[name="std_year_rozklad"]').val($.urlParam('std_year_rozklad'));
  $('input[name="sem_add_rozklad"]').val($.urlParam('semestr_rozklad'));
  $('input[name="akgrp_add_rozklad"]').val($.urlParam('group_chosen_rozklad'));

  $('#chosen_predmet_rozklad').change(function(){
    $("div.dropdown-menu:eq(1) ul").empty();
    $("#vid_zan_add_rozklad").empty();
    $.ajax ({
      url: "classes.actions.php",
      method: "POST",
      data: {
        "pred_add_rozklad": $(this).val(),
        "sem_add_rozklad": $.urlParam('semestr_rozklad'),
        "akgrp_add_rozklad":$.urlParam('group_chosen_rozklad')

            },
      dataType : 'json',
      success: function (output)
      {

        for (var i = 0; i < output.length; i++) {
          $("#vid_zan_add_rozklad").append($(output[i]['addToOpt']));
          $("div.dropdown-menu:eq(1) ul").append($(output[i]['addToLi']));
        }
        $('div.bootstrap-select:eq(1) button span:eq(0)').text("Оберіть вид заняття");
      }
          });
  });
  $('div.bootstrap-select:eq(1) button').mouseenter( function(){
        $('div.dropdown-menu:eq(1) ul li').off("click");
        $('div.dropdown-menu:eq(1) ul li').on("click",$.ajaxForVidZan);
  });

  $('#korp_add_rozklad').change(function(){
    $("div.dropdown-menu:eq(7) ul").empty();
    $("#aud_add_rozklad").empty();
    $.ajax ({
      url: "classes.actions.php",
      method: "POST",
      data: {        "korp_add_rozklad": $(this).val()       },
      dataType : 'json',
      success: function (output)
      {

        for (var i = 0; i < output.length; i++) {
          $("#aud_add_rozklad").append($(output[i]['addToOpt']));
          $("div.dropdown-menu:eq(7) ul").append($(output[i]['addToLi']));
        }
        $('div.bootstrap-select:eq(7) button span:eq(0)').text("Оберіть аудиторію");
      }
          });
  });
  $('div.bootstrap-select:eq(7) button').mouseenter( function(){
        $('div.dropdown-menu:eq(7) ul li').off("click");
        $('div.dropdown-menu:eq(7) ul li').on("click",$.ajaxForAud);
  });
}

// script for  classes.new_aud_korp.php"
if (location.href.indexOf("classes.new_aud_korp.php")!=-1){
    $("#add_new_korp").click(function(){
      if($('#inp_korp_name').val() == null || $('#inp_korp_name').val() == '' ){
        alert("Введите наименование корпуса!");
      }
      $.ajax ({
        url: "classes.actions.php",
        method: "POST",
        data: {
          "aj1" : "1",
          "inp_korp_name": $('#inp_korp_name').val()
        },

        success: function ()
        {

        }
      });
    });

    $("#add_new_aud").click(function(){
      if($('#inp_aud_name').val() == null || $('#inp_aud_name').val() == '' ){
        alert("Введите номер аудитории!");
      }
      $.ajax ({
        url: "classes.actions.php",
        method: "POST",
        data: {
          "aj1" : "2",
          "korp_name": $('#korp_name').val(),
          "inp_aud_name": $('#inp_aud_name').val()
        },
        success: function ()
        {
            alert("Успешно добавлено");
            $('#inp_aud_name').val("");
        }
      });
    });
}

// script for  classes.attendance.php"
if (location.href.indexOf("classes.attendance.php")!=-1){

    var fr_tog = 1;

    $('.container').delegate(".down","click",function () {
      var $input = $(this).parent().find('input');
      var count = parseInt($input.val()) - 1;
      count = count < 0 ? 0 : count;

      $input.val(count);
      $input.change();
      return false;
    });

    $('.container').delegate(".up","click",function () {
      var $input = $(this).parent().find('input');
      var count = parseInt($input.val()) + 1;
      count = count > 2 ? 2 : count;
      $input.val(count);
      $input.change();
      return false;
        });

    $('.container').delegate("div.dropdown-menu:eq(2) ul li","click",$.ajaxForSemestrWithPredmet);

    $('.container').delegate("div.dropdown-menu:eq(3) ul li","click",$.ajaxForPredmetToVidzan);

    $('.container').delegate("div.dropdown-menu:eq(4) ul li","click",$.ajaxForVidzanToPrep);

    $('.container').delegate("div.dropdown-menu:eq(5) ul li","click",$.selectForPrepod);

    $('.container').delegate("div.dropdown-menu:eq(8) ul li","click",$.ajaxForAudAtt);

    $('#hid_zam_ate').hide();
    $("#group_chosen_attendance").change( function(){
      $.clearSelectOfAttend(1);
      $("#row_tbl_wod").remove();
        $.ajax ({
          url: "plans.actions.php",
          method: "POST",
          data: {
            "group_chosen_rozklad_aj": $('#group_chosen_attendance').val(),
          },
          dataType : 'json',
          success: function (selsem)
          {
            for (var i = 0; i < selsem.length; i++) {
            $("#semestr_attendance").append($(selsem[i]['appToSel']));
            $("div.dropdown-menu:eq(2) ul").append($(selsem[i]['appToLi']));
            }
          }
              });
        $('div.bootstrap-select:eq(2) button span:eq(0)').text("Оберіть семестр");
        // $('div.bootstrap-select:eq(2) button').mouseenter( function(){
        //   $('div.dropdown-menu:eq(2) ul li').off("click");
        //   $('div.dropdown-menu:eq(2) ul li').on("click",$.ajaxForSemestrWithPredmet);
        // });
        // $('div.bootstrap-select:eq(3) button').mouseenter( function(){
        //   $('div.dropdown-menu:eq(3) ul li').off("click");
        //   $('div.dropdown-menu:eq(3) ul li').on("click",$.ajaxForPredmetToVidzan);
        // });
        // $('div.bootstrap-select:eq(4) button').mouseenter( function(){
        //    $('div.dropdown-menu:eq(4) ul li').off("click");
        //    $('div.dropdown-menu:eq(4) ul li').on("click",$.ajaxForVidzanToPrep);
        //  });
        // $('div.bootstrap-select:eq(5) button').mouseenter( function(){
        //     $('div.dropdown-menu:eq(5) ul li').off("click");
        //     $('div.dropdown-menu:eq(5) ul li').on("click",$.selectForPrepod);
        //   });
    });

    $('#zamena_btn').click(function(){
      $('#hid_zam_ate').toggle();
      fr_tog++; // if %2 == 0 Zamena
    });

    $('#attendance_once').click(function(){
      $("#row_tbl").remove();
      $("#sv_at_div").remove();
      if($('#vidzan_attendance').val()==null || $('#pred_attendance').val()==null || $('#aud_attend').val()==null || $('#group_chosen_attendance').val()==null || $('#std_year_attendance').val()==null ||  $("#semestr_attendance").val() ==null ){
        alert("Будь ласка заповніть всі  поля.");
        return false;
      }
      $.ajax ({
        url: "classes.actions.php",
        method: "POST",
        data: {
          "type_of_aj" : "4",
          "group_attend": $('#group_chosen_attendance').val(),
        },
        success: function (output)
        {
          $("div.container").append($(output));
          $("div.container").append("<div class='row text-center' id='sv_at_div'>"+
          " <input  class='btn btn-primary ' type='button'  value='Всім по 2 години' id='all_full'>"+
          " <input  class='btn btn-primary ' type='button'  value='Зберегти' id='sv_at'>"+
          " </div>");
        }
       });
    });

    $('#korp_attend').change(function(){
      $("div.dropdown-menu:eq(8) ul").empty();
      $("#aud_attend").empty();
      $('div.bootstrap-select:eq(8) button span:eq(0)').text("Немає аудиторій");
      $.ajax ({
        url: "classes.actions.php",
        method: "POST",
        data: {        "korp_add_rozklad": $(this).val()       },
        dataType : 'json',
        success: function (output)
        {

          for (var i = 0; i < output.length; i++) {
            $("#aud_attend").append($(output[i]['addToOpt']));
            $("div.dropdown-menu:eq(8) ul").append($(output[i]['addToLi']));
          }
          var tutle = output[0]['addToOpt'].substring(output[0]['addToOpt'].indexOf('>')+1,output[0]['addToOpt'].indexOf('</'));////Замена "оберіть"

          $('div.bootstrap-select:eq(8) button span:eq(0)').text(tutle);
        }
            });
    });
    // $('div.bootstrap-select:eq(8) button').mouseenter( function(){
    //       $('div.dropdown-menu:eq(8) ul li').off("click");
    //       $('div.dropdown-menu:eq(8) ul li').on("click",$.ajaxForAudAtt);
    // });

    $('#attendance_once').mouseleave(function(){

      $('#sv_at').off("click");
      $('#sv_at').on("click",function () {
        var prep_att;
        if(fr_tog%2 == 0){
          prep_att = $('#zamena_attendance').val();
        }
        else {
          prep_att = $('#prepod_attendance').val();
        }
        var std = new Array();
        var hour= new Array();

        $("#row_tbl table tr").find('input').each(function(){
        std.push($(this).parents("tr").prop("title"));
        hour.push($(this).val());

        });

        $.ajax ({
          url: "classes.actions.php",
          method: "POST",
          data: {
            "type_of_aj" : "5",
            "vidzan_attend": $('#vidzan_attendance').val(),
            "pred_attend": $('#pred_attendance').val(),
            "prepod_attend": prep_att,
            "uch_god_attend": $('#std_year_attendance').val(),
            "semestr_attend": $("#semestr_attendance").val(),
            "aud_attend": $("#aud_attend").val(),
            "para_attend" : $("#time_attendance").val(),
            "date_attend" : $("#date_attendance").val(),
            "students_attend": std,
            "hours_attend": hour
          },
          success: function (out)
          {
              alert("Успешно добавлено");
              $("#row_tbl").remove();
              $("#sv_at_div").remove();
          }
        });
      });

      $('#all_full').off("click");
      $('#all_full').on("click",function () {
        $('#row_tbl input').val(2);
      });



    });

    $('#attendance_of_grp').click(function(){
        $("#row_tbl").remove();
        $("#sv_at_div").remove();
        if($('#vidzan_attendance').val()==null || $('#pred_attendance').val()==null  || $('#group_chosen_attendance').val()==null || $('#std_year_attendance').val()==null ||  $("#semestr_attendance").val() ==null ){
          alert("Будь ласка заповніть всі поля.");
          return false;
        }

        $.ajax ({
          url: "classes.actions.php",
          method: "POST",
          data: {
            "type_of_aj" : "6",
            "group_attend": $('#group_chosen_attendance').val(),
            "vidzan_attend": $('#vidzan_attendance').val(),
            "pred_attend": $('#pred_attendance').val(),
            "uch_god_attend": $('#std_year_attendance').val(),
            "semestr_attend": $("#semestr_attendance").val()

          },
          success: function (output)
          {
           $("div.container").append($(output));
        }
         });
      });

    $('#attendance_of_grp').mouseleave(function(){

            $("#attend_data table tr td").mouseenter(function(){
              var ind = $(event.target).index();
              $("#attend_data table").find('tr').each(function(){
                  var sel = "td:eq("+ind+")";
                  $(this).children(sel).css("background-color","CCFFFF");
              });
            });

            $("#attend_data table tr td").mouseleave(function(){
                  $("#attend_data table tr:nth-child(2n) td").css("background-color","#f0f0f0");
                  $("#attend_data table tr:nth-child(2n+1) td").css("background-color","white");
                });

            $("#attend_data table tr td").off("click");
            $("#attend_data table tr td").on("click",$.changeAttend);
    });

    $('#attendance_of_grp_by_sem').click(function(){
        $("#row_tbl").remove();
        $("#sv_at_div").remove();
        if($('#group_chosen_attendance').val()==null || $('#std_year_attendance').val()==null ||  $("#semestr_attendance").val() ==null ){
          alert("Будь ласка заповніть всі поля.");
          return false;
        }

        $.ajax ({
          url: "classes.actions.php",
          method: "POST",
          data: {
            "type_of_aj" : "7",
            "group_attend": $('#group_chosen_attendance').val(),
            "uch_god_attend": $('#std_year_attendance').val(),
            "semestr_attend": $("#semestr_attendance").val()

          },
          success: function (output)
          {
           $("div.container").append($(output));
        }
         });
      });

    $('#attendance_of_grp_by_sem').mouseleave(function(){

          $("#attend_data table tr td").mouseenter(function(){
            var ind = $(event.target).index();
            $("#attend_data table").find('tr').each(function(){
                var sel = "td:eq("+ind+")";
                $(this).children(sel).css("background-color","CCFFFF");
            });
          });

          $("#attend_data table tr td").mouseleave(function(){
                $("#attend_data table tr:nth-child(2n) td").css("background-color","#f0f0f0");
                $("#attend_data table tr:nth-child(2n+1) td").css("background-color","white");
              });

          $("#attend_data table tr td").off("click");
          $("#attend_data table tr td").on("click",$.changeAttend);
  });

    $("#canc_change_at").click(function(){
      $("#row_tbl_wod").remove();
      $(".hided").toggle();
      $(".nnhided").toggle();
    });

    $("#change_at").click(function(){

      var prep_att;
      if(fr_tog%2 == 0){
        prep_att = $('#zamena_attendance').val();
      }
      else {
        prep_att = $('#prepod_attendance').val();
      }
      var std = new Array();
      var hour= new Array();

            $("#row_tbl_wod table tr").find('input').each(function(){
            std.push($(this).parents("tr").prop("title"));
            hour.push($(this).val());
          });

        var day = mas_fr_ch[0].split('/')[0] +"";
        var month = mas_fr_ch[0].split('/')[1] +"";
        var year = +mas_fr_ch[0].split('/')[2] + 2000;

      $.ajax ({
        url: "classes.actions.php",
        method: "POST",
        data: {
          "type_of_aj" : "9",
          "vidzan_attend": $('#vidzan_attendance').val(),
          "pred_attend": $('#pred_attendance').val(),
          "prepod_attend": prep_att,
          "uch_god_attend": $('#std_year_attendance').val(),
          "semestr_attend": $("#semestr_attendance").val(),
          "aud_attend": $("#aud_attend").val(),
          "para_attend" : $("#time_attendance").val(),
          "date_attend" : $("#date_attendance").val(),
          "students_attend": std,
          "hours_attend": hour,
          "old_year" :   mas_fr_ch[3],
          "old_date" : (year+"-"+month+"-"+day),
          "old_sem": mas_fr_ch[2],
          "old_numbpara": mas_fr_ch[1],
        },
        success: function (out)
        {
            alert(out);
            $("#row_tbl_wod").remove();
            $(".hided").toggle();
            $(".nnhided").toggle();
        }
      });







    });

    $("#del_at").click(function(){
      var isDel= confirm("Удалить данные?");
      if(!isDel){
        return false;
      }

      var day = mas_fr_ch[0].split('/')[0] +"";
      var month = mas_fr_ch[0].split('/')[1] +"";
      var year = +mas_fr_ch[0].split('/')[2] + 2000;

        $.ajax ({
          url: "classes.actions.php",
          method: "POST",
          data: {
            "type_of_aj" : "10",
            "old_year" :   mas_fr_ch[3],
            "old_date" : (year+"-"+month+"-"+day),
            "old_sem": mas_fr_ch[2],
            "old_numbpara": mas_fr_ch[1],
          },
          success: function (out)
          {
              alert("Данные удалены");
              $("#row_tbl_wod").remove();
              $(".hided").toggle();
              $(".nnhided").toggle();
          }
        });
    });

} // classes.attendance.php

if (location.href.indexOf("plans.planing.php")!=-1){

      var obj = 1;
      var predm = 1;
      var int = 1;

      $('.container').delegate("div.dropdown-menu:eq(1) ul li","click",$.ajaxForStd);
      $('.container').delegate("div.dropdown-menu:eq(2) ul li","click",$.ajaxForSemestrWithPredmet);
      $('.container').delegate("div.dropdown-menu:eq(3) ul li","click",$.ajaxForPredmetToVidzan);
      $('.container').delegate("div.dropdown-menu:eq(4) ul li","click",$.ajaxVidzan);

      $("input[name='at_pl_obj']").change(function(){
          $('#id_at_pl_obj').toggle();
          obj = $(this).val();
          $('#row_tbl').remove();
      });

      $("input[name='at_pl_pred']").click(function(){
          if ($(this).val() == 1){
              $('#id_pred_attendance').hide();
              $('#id_vidzan_attendance').hide();
          }
          else if ($(this).val() == 2){
            $('#id_pred_attendance').show();
            $('#id_vidzan_attendance').hide();
          }
          else if ($(this).val() == 3){
            $('#id_pred_attendance').show();
            $('#id_vidzan_attendance').show();
          }
          predm = $(this).val();
          $('#row_tbl').remove();
      });

      $("input[name='at_pl_int']").change(function(){
          $('#id_at_pl_int').toggle();
          int = $(this).val();
          $('#row_tbl').remove();
      });

    $("#group_chosen_attendance").change( function(){
        $.clearSelectOfAttend(1);
        $("div.dropdown-menu:eq(1) ul").empty();
        $("#pl_at_st").empty();
        $.ajax ({
          url: "plans.actions.php",
          method: "POST",
          data: {
            "st_gr": $('#group_chosen_attendance').val(),
          },
          dataType : 'json',
          success: function (selsem)
          {
            for (var i = 0; i < selsem.length; i++) {
            $("#pl_at_st").append($(selsem[i]['appToSelToStd']));
            $("div.dropdown-menu:eq(1) ul").append($(selsem[i]['appToLiToStd']));
            }
          }
        });
        $.ajax ({
          url: "plans.actions.php",
          method: "POST",
          data: {
            "group_chosen_rozklad_aj": $('#group_chosen_attendance').val(),
          },
          dataType : 'json',
          success: function (selsem)
          {
            for (var i = 0; i < selsem.length; i++) {
            $("#semestr_attendance").append($(selsem[i]['appToSel']));
            $("div.dropdown-menu:eq(2) ul").append($(selsem[i]['appToLi']));
            $("#pl_at_st").append($(selsem[i]['appToSelToStd']));
            $("div.dropdown-menu:eq(1) ul").append($(selsem[i]['appToLiToStd']));
            }
          }
              });
        $('div.bootstrap-select:eq(1) button span:eq(0)').text("Оберіть студента");
        $('div.bootstrap-select:eq(2) button span:eq(0)').text("Оберіть семестр");
    });

    $("#show_plan_attend").click(function(){
        $("#row_tbl").remove();

        $.ajax ({
          url: "plans.actions.php",
          method: "POST",
          data: {
            "obj": obj,
            "predm": predm,
            "int": int,
            "group_pl_at": $("#group_chosen_attendance").val(),
            "sem_pl_at": $("#semestr_attendance").val(),
            "year_pl_at": $("#std_year_attendance").val(),
            "predm_pl_at": $("#pred_attendance").val(),
            "top_pl_at": $("#top_date").val(),
            "bot_pl_at": $("#bot_date").val(),
            "std_pl_at": $("#pl_at_st").val(),
            "vidzan_pl_at": $("#vidzan_attendance").val()

          },
          success: function (output)
          {
              $("div.container").append(output);
          }
        });
    });

    $("#show_plan_attend").mouseleave(function(){

      $("#at_pl_show_traectory").off("click");
      $("#at_pl_show_traectory").on("click",function(){
        $("#curve_chart").show();
        var mas = [];
        var q = 0;
        $("#attend_data table tr:first").find('td').each(function(){
            mas[q] = [];
          if(q == 0){
              mas[q][0] = "Срез";
              mas[q][1] = "План";
              mas[q][2] = "Верхня межа";
              mas[q][3] = "Нижня межа";
              mas[q][4] = "Факт";
                q++;
                mas[q] = [];
          }
              mas[q][0] = $(this).text().split(',')[0];
              q++;
        });

        q = 0;
        var tor = 1;
        $("#attend_data table tr:last").find('td').each(function(){

          if(q % 3 == 0){
              mas[tor][2] = Number($(this).text());

          }
          else if(q % 3 == 1){

            mas[tor][1] = Number($(this).text());
            mas[tor][4] = 100;
          }
          else if(q % 3 == 2){
            mas[tor][3] = Number($(this).text());
            tor++;
          }

          q++;
        });

        $.ajax ({
          url: "plans.actions.php",
          method: "POST",
          data: {
            "get_obj": obj,
            "get_predm": predm,
            "get_int": int,
            "group_pl_at": $("#group_chosen_attendance").val(),
            "sem_pl_at": $("#semestr_attendance").val(),
            "year_pl_at": $("#std_year_attendance").val(),
            "predm_pl_at": $("#pred_attendance").val(),
            "top_pl_at": $("#top_date").val(),
            "bot_pl_at": $("#bot_date").val(),
            "std_pl_at": $("#pl_at_st").val(),
            "vidzan_pl_at": $("#vidzan_attendance").val()
          },
          dataType : 'json',
          success: function (output)
          {
              for (var i = 1; i < mas.length; i++) {
                if(i <= output.length){
                  mas[i][4] = output[(i-1)];
                }
                else {
                  mas[i][4] = 200;
                }
              }

              var data = google.visualization.arrayToDataTable(mas);
              drawChart(data);
          }
        });

      });

    });

    $("#at_pl_create_plan").on("click",function(){

      var send_obj = obj;
      var send_predm = predm;
      var get_grp = $("#group_chosen_attendance").val() == null ? "null": $("#group_chosen_attendance").val();
      var get_sem = $("#semestr_attendance").val() == null ? "null": $("#semestr_attendance").val();
      var get_year = $("#std_year_attendance").val() == null ? "null": $("#std_year_attendance").val();
      var get_pred = $("#pred_attendance").val() == null ? "null": $("#pred_attendance").val();
      var get_stud = $("#pl_at_st").val() == null ? "null": $("#pl_at_st").val();
      var get_vid = $("#vidzan_attendance").val() == null ? "null": $("#vidzan_attendance").val();
      var loc = "plans.add_attend_plan.php?";
      loc+="send_obj="+send_obj+"&";
      loc+="send_predm="+send_predm+"&";
      loc+="get_grp="+get_grp+"&";
      loc+="get_sem="+get_sem+"&";
      loc+="get_year="+get_year+"&";
      loc+="get_pred="+get_pred+"&";
      loc+="get_stud="+get_stud+"&";
      loc+="get_vid="+get_vid;
      location.href = loc;


    });
} // plans.planing

if (location.href.indexOf("plans.add_attend_plan.php")!=-1){
  $("#plan_att").change( function(){
    $.keepInCheck("#plan_att","#otkl_att","#bot_att","#top_att")
  });
  $("#otkl_att").change( function(){
    $.keepInCheck("#plan_att","#otkl_att","#bot_att","#top_att")
  });

  $("#add_to_plan_attend").click(function(){
    var dte = new Date($("#get_datu_konca").val());
    if(dte.getDay() != 0){
      alert("Дата кінця інтервалу повина бути неділею!");
      return false
    }
   $.ajax ({
      url: "plans.actions.php",
      method: "POST",
      data: {
        "send_obj" : $.urlParam("send_obj"),
        "send_predm" : $.urlParam("send_predm"),
        "get_grppp" : $.urlParam("get_grp"),
        "get_sem" : $.urlParam("get_sem"),
        "get_year" : $.urlParam("get_year"),
        "get_pred" : $.urlParam("get_pred"),
        "get_stud" : $.urlParam("get_stud"),
        "get_vid" : $.urlParam("get_vid"),
        "get_plan" : $("#plan_att").val(),
        "get_b_plan" : $("#bot_att").val(),
        "get_t_plan" : $("#top_att").val(),
        "get_datu_konca" : $("#get_datu_konca").val()
      },
      success: function (res)
      {
          alert(res);
        /*  $("#plan_att").val(null);
          $("#otkl_att").val(null);
          $("#bot_att").val(null);
          $("#top_att").val(null);
          $("#get_datu_konca").val(null);
          */
        }
      });
    });



}

}); // onload


$.keepInCheck = function(orig,data,bot,top){
  var s = $(orig);
  var otkl = $(data);
  var btm = $(bot);
  var tp = $(top);
  if(s.val() <0 || s.val() > 100){
      s.val(50);
  }
  var sum1 = +s.val();
  var sum2 = +otkl.val();

  if( 0+sum1+sum2 > 100){
    tp.val(100);
  }
  else{
    tp.val(0+sum1+sum2);
  }
  if((s.val() - otkl.val()) < 0){
      btm.val(0);
  }
  else{
    btm.val((s.val() - otkl.val()));
  }
}

google.charts.load('current', {'packages':['corechart']});

function drawChart(data) {
  var options = {
    pointSize: 4,
    title: 'Виконання плану відвідуваності, %',
    legend: { position: 'right' }
  };
  var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
  chart.draw(data, options);
}

$.ajaxForStd = function(){
  var selectorOption = $(this).attr('data-original-index');
  var opt = $('#pl_at_st').children("option:eq("+selectorOption+")");
  $('#pl_at_st').val(opt.val());
  $('div.bootstrap-select:eq(1) button span:eq(0)').text($(this).text());
}

$.ajaxVidzan = function(){
  $.clearSelectOfAttend(4);
  var selectorOption = $(this).attr('data-original-index');
  var opt = $('#vidzan_attendance').children("option:eq("+selectorOption+")");
  $('#vidzan_attendance').val(opt.val());
  $('div.bootstrap-select:eq(4) button span:eq(0)').text($(this).text());
}

$.ajaxForVidzanToPrep = function(){
  $.clearSelectOfAttend(4);
  var selectorOption = $(this).attr('data-original-index');
  var opt = $('#vidzan_attendance').children("option:eq("+selectorOption+")");
  $('#vidzan_attendance').val(opt.val());
  $('div.bootstrap-select:eq(4) button span:eq(0)').text($(this).text());
  $.ajax ({
    url: "classes.actions.php",
    method: "POST",
    data: {
      "type_of_aj" : "3",
      "vidzan_attend": $('#vidzan_attendance').val(),
      "pred_attend": $('#pred_attendance').val(),
      "group_attend": $('#group_chosen_attendance').val(),
      "uch_god_attend": $('#std_year_attendance').val(),
      "semestr_attend": $("#semestr_attendance").val()
    },
    dataType : 'json',
    success: function (output)
    {
      for (var i = 0; i < output.length; i++) {
        $("#prepod_attendance").append($(output[i]['addToOpt']));
        $("div.dropdown-menu:eq(5) ul").append($(output[i]['addToLi']));
     }
    }
   });
     $('div.bootstrap-select:eq(5) button span:eq(0)').text("Оберіть викладача");
}

$.selectForPrepod = function(){

  var selectorOption = $(this).attr('data-original-index');
  var opt = $('#prepod_attendance').children("option:eq("+selectorOption+")");
  $('#prepod_attendance').val(opt.val());
  $('div.bootstrap-select:eq(5) button span:eq(0)').text($(this).text());

}

$.ajaxForPredmetToVidzan = function(){
  $.clearSelectOfAttend(3);
  var selectorOption = $(this).attr('data-original-index');
  var opt = $('#pred_attendance').children("option:eq("+selectorOption+")");
  $('#pred_attendance').val(opt.val());
  $('div.bootstrap-select:eq(3) button span:eq(0)').text($(this).text());
  $.ajax ({
    url: "classes.actions.php",
    method: "POST",
    data: {
      "type_of_aj" : "2",
      "pred_attend": $('#pred_attendance').val(),
      "group_attend": $('#group_chosen_attendance').val(),
      "uch_god_attend": $('#std_year_attendance').val(),
      "semestr_attend": $("#semestr_attendance").val()
    },
    dataType : 'json',
    success: function (output)
    {
      for (var i = 0; i < output.length; i++) {
        $("#vidzan_attendance").append($(output[i]['addToOpt']));
        $("div.dropdown-menu:eq(4) ul").append($(output[i]['addToLi']));
     }
    }
   });
     $('div.bootstrap-select:eq(4) button span:eq(0)').text("Оберіть вид заняття");
}

$.ajaxForSemestrWithPredmet = function(){
  $.clearSelectOfAttend(2);
  var selectorOption = $(this).attr('data-original-index');
  var opt = $('#semestr_attendance').children("option:eq("+selectorOption+")");
  $('#semestr_attendance').val(opt.val());
  $('div.bootstrap-select:eq(2) button span:eq(0)').text($(this).text());
  $.ajax ({
    url: "classes.actions.php",
    method: "POST",
    data: {
      "type_of_aj" : "1",
      "group_attend": $('#group_chosen_attendance').val(),
      "uch_god_attend": $('#std_year_attendance').val(),
      "semestr_attend": $("#semestr_attendance").val()
    },
    dataType : 'json',
    success: function (output)
    {
      for (var i = 0; i < output.length; i++) {
        $("#pred_attendance").append($(output[i]['addToOpt']));
        $("div.dropdown-menu:eq(3) ul").append($(output[i]['addToLi']));
     }
    }
   });
     $('div.bootstrap-select:eq(3) button span:eq(0)').text("Оберіть дисципліну");
}

$.urlParam = function(name){
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if (results==null){
       return null;
    }
    else{
       return decodeURI(results[1]) || 0;
    }
}

$.parseCell = function(predmet, prepod, aud, korpus, vidzan, den, week, para, zvan, name, s_name){
  var selec = '#'+para+den;
  var para_opisanie = "<span>"+predmet+" </span><br><span>"+ vidzan +" </span><br><span>";
  para_opisanie +=zvan +" </span><span>"+ prepod +" </span>";
  if( !(name == "" || s_name == "")){
  para_opisanie += " </span><span>"+ name[0] +".</span><span>"+ s_name[0] +".</span>";
  }
  para_opisanie += "<br><span>"+aud +" </span><span>"+ korpus+"</span>";



  if(week==0){
        var second = selec+2;
        selec +=1;
        $(selec).html(para_opisanie);
        $(selec).attr("rowspan",2);
        $(second).hide();
    }
    else{
      selec +=week;
      $(selec).html(para_opisanie);
    }
}

$.clearRozklad = function(){
  for (var i = 1; i < 7; i++) {
    for (var j = 1; j < 7; j++) {
      for (var z = 1; z < 3; z++) {
        var selec = '#'+i+j+z;
        $(selec).empty();
        $(selec).show();
        $(selec).attr("rowspan",1);
      }
    }
  }

};

$.setWidthTabledHead = function(){
        var bolOuterWidth = false;
        if (navigator.userAgent.search(/Firefox/) > -1) { bolOuterWidth = true;}
        var $trfst = $('#uchebniy_plan tr:first');
        var $sorting = $('#sorted');
        var i = 0;
        var lenght4 = 0;
        $trfst.find('td').each(function(){
          var slthdr = '#sorted td:eq('+i+')';
          var sltftr = '#foooter_uch_plana tr:last td:eq('+(i-3)+')';

          if(bolOuterWidth){
              $(slthdr).outerWidth($(this).width());
          }
          else{
            $(slthdr).width($(this).width());
          }
          if(i < 3){

            lenght4 +=$(this).width();

          }
          else if(i==3){
            if(bolOuterWidth){
                $(sltftr).outerWidth(lenght4 +$(this).width());
            }
            else{
              $(sltftr).width(lenght4 +$(this).width());
            }
          }
          else{
            if(bolOuterWidth){
                $(sltftr).outerWidth($(this).width());
            }
            else{
              $(sltftr).width($(this).width());
            }

          }
          i++;
        });

        var div = document.createElement('div');
          div.style.overflowY = 'scroll';
          div.style.width = '50px';
          div.style.height = '50px';
          div.style.visibility = 'hidden';
          document.body.appendChild(div);
          var scrollWidth = div.offsetWidth - div.clientWidth;
          document.body.removeChild(div);
          $("#sss").css("width","calc(100% - "+scrollWidth+"px)");


};

$.setTabledFoot= function(){
        var $itogy = $('#itog_plana').clone(true,true);
        $('#foooter_uch_plana tr:last').remove();

        var hgt = $('#itog_plana').outerHeight()*2;

              $('#sss').css({

                        "top":("-"+hgt+"px")


      });
        var $tableitoga = $('#foooter_uch_plana');
        $tableitoga.append($itogy);
};

$.ajaxForSemestr = function(){
    $.clearRozklad();
    var selectorOption = $(this).attr('data-original-index');
    var opt = $('#semestr_rozklad').children("option:eq("+selectorOption+")");
    $('#semestr_rozklad').val(opt.val());
    $('div.bootstrap-select:eq(2) button span:eq(0)').text($(this).text());

    $.ajax ({
      url: "plans.actions.php",
      method: "POST",
      data: {
        "rozk_semestr": $('#semestr_rozklad').val(),
        "uch_god": $('#std_year_rozklad').val(),
        "ak_group": $("#group_chosen_rozklad").val()
      },
      dataType : 'json',
      success: function (output)
      {

        for (var i = 0; i < output.length; i++) {
          $.parseCell(output[i]['predmet'],
          output[i]['prepod'],
          output[i]['aud'],
          output[i]['korpus'],
          output[i]['vidzan'],
          output[i]['den'],
          output[i]['week'],
          output[i]['para'],
          output[i]['zvan'],
          output[i]['prep_n'],
          output[i]['prep_s']);
        }

      }
          });
      }

$.ajaxForAudAtt = function(){
            var selectorOption = $(this).attr('data-original-index');
            var opt = $('#aud_attend').children("option:eq("+selectorOption+")");
            $('#aud_attend').val(opt.val());
            $('div.bootstrap-select:eq(8) button span:eq(0)').text($(this).text());

    }

$.ajaxForVidZan = function(){
          var selectorOption = $(this).attr('data-original-index');
          var opt = $('#vid_zan_add_rozklad').children("option:eq("+selectorOption+")");
          $('#vid_zan_add_rozklad').val(opt.val());
          $('div.bootstrap-select:eq(1) button span:eq(0)').text($(this).text());

  }

$.ajaxForAud = function(){
            var selectorOption = $(this).attr('data-original-index');
            var opt = $('#aud_add_rozklad').children("option:eq("+selectorOption+")");
            $('#aud_add_rozklad').val(opt.val());
            $('div.bootstrap-select:eq(7) button span:eq(0)').text($(this).text());

    }

$.clearSelectOfAttend = function(numb){
  switch(numb){
    case 1:   $("div.dropdown-menu:eq(2) ul").empty();
              $("#semestr_rozklad").empty();
    case 2:   $("div.dropdown-menu:eq(3) ul").empty();
              $("#pred_attendance").empty();
              $('div.bootstrap-select:eq(3) button span:eq(0)').text("Оберіть дисципліну");
    case 3:   $("div.dropdown-menu:eq(4) ul").empty();
              $("#vidzan_attendance").empty();
              $('div.bootstrap-select:eq(4) button span:eq(0)').text("Оберіть вид заняття");
    case 4:   $("div.dropdown-menu:eq(5) ul").empty();
              $("#prepod_attendance").empty();
              $('div.bootstrap-select:eq(5) button span:eq(0)').text("Оберіть викладача");
              $("#row_tbl").remove();
              $("#sv_at_div").remove();
  }

};

$.changeAttend = function(){
  var inde = $(this).index();
  var hours =[];
  $(".nnhided").toggle();
  $(".hided").toggle();


  $("#attend_data table").find('tr').each(function(){
      var sel = "td:eq("+inde+")";
      hours.push($(this).children(sel).text());
  });


  $("#row_tbl").remove();
  $.ajax ({
    url: "classes.actions.php",
    method: "POST",
    data: {
      "type_of_aj" : "4",
      "group_attend": $('#group_chosen_attendance').val(),
    },
    success: function (output)
    {
      $("div.container").append($(output));
    }
   });
   setTimeout( function(){
     var it = 1;
     $("#row_tbl").find('input').each(function(){
       $(this).val(hours[it]);
       it++;
     });
     $("#row_tbl").prop('id','row_tbl_wod');
   },100);


      mas_fr_ch[0] = hours[0].split(',')[0]; // Дата
      mas_fr_ch[1] = hours[0].split(',')[1];// Пара
      mas_fr_ch[2] =  $('#semestr_attendance').val();// Семестр
      mas_fr_ch[3] = $('#std_year_attendance').val();// Год
      mas_fr_ch[4] = $('#group_chosen_attendance').val();// Группа

      var day = mas_fr_ch[0].split('/')[0] +"";
      var month = mas_fr_ch[0].split('/')[1] +"";
      var year = +mas_fr_ch[0].split('/')[2] + 2000;

      var mas_click = [];
   $.ajax ({
     url: "classes.actions.php",
     method: "POST",
     data: {
       "type_of_aj" : "8",
       "group_attend": $('#group_chosen_attendance').val(),
       "uch_god_attend": $('#std_year_attendance').val(),
       "semestr_attend": $('#semestr_attendance').val(),
       "day": (year+"-"+month+"-"+day),
       "para":   mas_fr_ch[1]
     },
     success: function (output)
     {
       mas_click = output.split('@');
     }
    });
    setTimeout(function(){
    var i = 0;
    $("#pred_attendance").find('option').each(function(){
      if( $(this).val() == mas_click[0] ){
        $("div.dropdown-menu:eq(3) ul li:eq("+i+")").click();
        return false;
      }
      else{
        i++;
      }
    });
    i = 0;
    $("#korp_attend").find('option').each(function(){
      if( $(this).val() == mas_click[1] ){
        $("div.dropdown-menu:eq(7) ul li:eq("+i+") a").click();
        return false;
      }
      else{
        i++;
      }
    });
    i =0;
    $("#time_attendance").find('option').each(function(){

      if( $(this).val() == mas_click[2] ){
        $("div.dropdown-menu:eq(9) ul li:eq("+i+") a").click();
        return false;
      }
      else{
        i++;
      }
    });

    setTimeout( function(){
      i = 0;
      $("#vidzan_attendance").find('option').each(function(){
        if( $(this).val() == mas_click[3] ){
          $("div.dropdown-menu:eq(4) ul li:eq("+i+")").click();
          return false;
        }
        else{
          i++;
        }
      });
    },200);

    setTimeout( function(){
      i = 0;
      $("#aud_attend").find('option').each(function(){
        if( $(this).val() == mas_click[5] ){
        $("div.dropdown-menu:eq(8) ul li:eq("+i+")").click();
          return false;
        }
        else{
          i++;
        }
      });
          $("div.dropdown-menu:eq(5) ul li:eq(0)").click();
    },400);

    $("#date_attendance").val(year+"-"+month+"-"+day);


    },200);
}

$(window).resize(function(){
   $.setTabledFoot();
    $.setWidthTabledHead();

});
