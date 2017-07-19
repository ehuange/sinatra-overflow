$(document).ready(function() {

// questions/index (display questions sorted by whatever user requests)
// ~ default most upvoted/trending tabs to hidden
  $(".sorted-qs").hide()
  $(".by-most-recent").show()
// ~ on tab clicks
  $(".most-recent-tab").on("click", function(e) {
    $(".sorted-qs").hide()
    $(".by-most-recent").show();
  })
  $(".highest-vote-tab").on("click", function(e) {
    $(".sorted-qs").hide()
    $(".by-highest-vote").show();
  })
  $(".trending-tab").on("click", function(e) {
    $(".sorted-qs").hide()
    $(".by-trending").show();
  })


  $(".profile-cs").hide();
  $(".profile-cs-tab").on("click", function() {
    $(".profile-qs").hide();
    $(".profile-cs").show();
  })
  $(".profile-qs-tab").on("click", function() {
    $(".profile-cs").hide();
    $(".profile-qs").show();
  })

// ~ default answer-form to hidden
  $(".a-form").hide()
// ~ show answer form on button click
  $(".a-form-button").click(function() {
    $(".a-form").show()
    $(this).hide()
  });

//////////////////    comments    ///////////////////
  $("form.c-form").hide();

  $('body').on('click', "a#answer-comment-link",function(event) {
    event.preventDefault();
    $(this).siblings('form.c-form').toggle();
  })

  $("body").on("submit", "form.c-form", function(e) {
    e.preventDefault();
    var $this = $(this)
    $.ajax({
      method: "POST",
      url: $(this).attr("action"),
      data: $(this).serialize()
    })
    .done(function(response) {
      console.log(response)
      console.log($this.parents("div.cs-container"))
      $this.parents("div.cs-container").prepend(response)
      $this.trigger("reset").hide()
    })
  })

////////////////////    votes    ////////////////////
  $('body').on('submit', "form.upvote", function(event){
    event.preventDefault();
    var $votes = $(this).siblings('div.votes')
    var value = $votes.html()
    console.log($('div.votes'))
//     var $wrapper = $('as-container')
//     console.log($(this).siblings('div.votes'))
//     console.log($wrapper.find('div.votes').sort(function(a, b) {
//     return +a.dataset.percentage - +b.dataset.percentage;
// }))
//     var madness = $wrapper.find('div.votes').sort(function(a, b) {
//     return +a.dataset.percentage - +b.dataset.percentage;})
    $.ajax({
      method: "POST",
      url: $(this).attr('action'),
      data: $(this).serialize(),
      dataType: "json"
    })
      .done(function(response){
        $votes.text(response)
        // madness.prependTo($wrapper)
      })
  })

  $('body').on('submit', "form.downvote", function(event){
    event.preventDefault();
    var $votes = $(this).siblings('div.votes')
    $.ajax({
      method: "POST",
      url: $(this).attr('action'),
      data: $(this).serialize(),
      dataType: "json"
    })
      .done(function(response){
        $votes.text(response)
      })
  })

//////////////////////////best answer/////////////////////////////
  $("body").on("submit", ".best-answer-form", (function(e) {
    e.preventDefault();
    $form = $(this);
    var link = $(this).attr("action");
    $.ajax({
      method: "PUT",
      url: link,
    })
      .done(function(response) {
        $(".answer-image").remove();
        $form.append("<img class='answer-image' src='http://clipartix.com/wp-content/uploads/2016/04/Thumbs-up-clipart-2.png' width=30 height=30>");
        $(".as-container").prepend($form.closest(".a-container"));
      })
  }))

///////////////////////// add answer//////////////////////////
  $(".a-form").submit(function(e) {
    e.preventDefault();
    var link = $(this).attr("action");
    var data = $(this).serialize();
    var $that = $(this)
    $.ajax({
      method: "POST",
      url: link,
      data: data,
      dataType: "html"
    })
    .done(function(response){
      $(".as-container").prepend(response);
      // ~ rehide form, don't show comment form, reshow answer button
      $(".a-form-button").show();
      $that.trigger("reset").hide()
      $("form.c-form").hide();
    })
  })

//////////////////////// edit answer ///////////////////////////
  $('body').on('click', 'a.edit-answer', function(event) {
    event.preventDefault()
    var $li = $(this).closest('li.edit-answer')
    var $this = $(this)
    $.ajax({
      method: "GET",
      url: $(this).attr('href')
    })
      .done(function(response) {
        $this.remove()
        $li.append(response)
      })
  })

  $('body').on('submit', 'form.edit-answer', function(event){
    event.preventDefault()
    var $this = $(this)
    $.ajax({
      method: "PUT",
      url: $(this).attr('action'),
      data: $(this).serialize()
    })
      .done(function(response){
        $this.closest('.as-container').prepend(response)
        $this.closest('.a-container').remove()
        $this.hide()
        $("form.c-form").hide();
      })
  })

///////////////////////// delete answer ////////////////////////////
  $('body').on('submit', 'form.delete-answer', function(event){
    event.preventDefault()
    var $this = $(this)
    $.ajax({
      method: "DELETE",
      url: $this.attr('action')
    })
      .done(function(){
        $this.closest('.a-container').remove()
      })
  })

});
