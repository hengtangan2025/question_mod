class @AnswerVote
  constructor: (@$elm)->
    @question_id = jQuery(".page-question-show .question .vote").data "question-id"
    @bind_event()

  bind_event: ->
    @$elm.on "click", ".voted", (evt)=>
      @answer_id = jQuery(event.target).closest(".answer-vote").data "id"
      $unvoted = jQuery(event.target).closest(".voted").find ".btn-info"
      $voted = jQuery(event.target).closest(".voted").find ".btn-default"
      $vote_up_count = jQuery(event.target).closest(".voted").find ".count"
      $up_btn = jQuery(event.target).closest(".answer").find "a.vote-up"
      $down_btn = jQuery(event.target).closest(".answer").find "a.vote-down"
      $vote_sum = jQuery(event.target).closest(".answer").find ".vote-sum"
      jQuery.ajax
        method: "PUT"
        url: @path + "questions/#{@question_id}/answers/#{@answer_id}/vote_up"
        type: "json"
        success: (info)=>
          $unvoted.toggleClass "hidden"
          $voted.toggleClass "hidden"
          $vote_up_count.text(info.up_vote_count)
          @change_by_info(info,$up_btn,$down_btn,$vote_sum)

    @$elm.on "click", ".unvoted", (evt)=>
      @answer_id = jQuery(event.target).closest(".answer-vote").data "id"
      $unvoted = jQuery(event.target).closest(".unvoted").find ".btn-info"
      $voted = jQuery(event.target).closest(".unvoted").find ".btn-default"
      $vote_up_count = jQuery(event.target).closest(".unvoted").find ".count"
      $up_btn = jQuery(event.target).closest(".answer").find "a.vote-up"
      $down_btn = jQuery(event.target).closest(".answer").find "a.vote-down"
      $vote_sum = jQuery(event.target).closest(".answer").find ".vote-sum"
      jQuery.ajax
        method: "PUT"
        url: @path + "questions/#{@question_id}/answers/#{@answer_id}/vote_up"
        type: "json"
        success: (info)=>
          $unvoted.toggleClass "hidden"
          $voted.toggleClass "hidden"
          $vote_up_count.text(info.up_vote_count)
          @change_by_info(info,$up_btn,$down_btn,$vote_sum)

  change_by_info: (info,$up_btn,$down_btn,$vote_sum)->
    if info.state == "up"
      $up_btn.addClass "pressed"
      $down_btn.removeClass "pressed"

    if info.state == "down"
      $up_btn.removeClass "pressed"
      $down_btn.addClass "pressed"

    if info.state == null
      $up_btn.removeClass "pressed"
      $down_btn.removeClass "pressed"

    $vote_sum.text(info.vote_sum)