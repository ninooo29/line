$(function($){
  // $('#tabcontent > div').hide();
  // $('.tabnav a').click(function () {
  //   $('#tabcontent > div').hide().filter(this.hash).fadeIn();
  //   $('.tabnav a').removeClass('active');
  //   $(this).addClass('active');
  //   return false;
  // }).filter(':eq(0)').click();
  // $("ul").on("click", "li",function() {
  //   $(this).addClass("selected");
  //   $("li.selected").removeClass("selected");
  // })

  $(window).on("load", function() {
    $("li").on("click", function() {
      $("li.selected").removeClass("selected");
      $(this).addClass("selected");
      $(".contents .div").hide(); // 二つの要素を非表示にする
      $("." + this.id).show(); //クリックされたボタンに対応する要素を表示する
    });
  });


  $(document).on('turbolinks:load', function () {
    Serchuser()
  })

  function Serchuser(){
    $("#user-search-field").on("keypress", function(){
      var input = $("#user-search-field").val()
      $(".UserPage").remove();
      $(".chat-group-user").remove();
      // if input.length != 0
      //   $.ajax({
      //     type: "GET",
      //     url: '';
      //     dataType: 'html';
      //   })
      $.ajax({
        type: 'GET',
        url: '',
        data: {
          name: input
        },
        dataType:'json'
      })
      .done(function(data){
        var users = data;
        $.each(users, function(i, user){
          $('#user-serch-result').append(buildHTML(user))
        })
      })
      .fail(function(data){
        // alert("userがいません");
      })
    })
  }

  function buildHTML(user){
    var html =
      `<div class="chat-group-user">
        <p class="chat-group-user__name">
          ${user.name}
        </p>
        <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</a>
       </div>`;
    return html;
  }

});
