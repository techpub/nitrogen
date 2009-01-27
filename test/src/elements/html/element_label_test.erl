-module(element_label_test).
-compile([export_all]).

-author("michael@mullistechnologies.com").

-include_lib("eunit/include/eunit.hrl").

-include("wf.inc").

new_label_1() ->
  Rec_label = #label{},
  lists:flatten(element_label:render("123123",Rec_label)).

new_label_2() ->
  Rec_label = #label{class="t_label"},
  lists:flatten(element_label:render("123125",Rec_label)).

new_label_3() ->
  Rec_label = #label{class="t_label", style="color: cyan;", text="Username:"},
  lists:flatten(element_label:render("123125",Rec_label)).

basic_test_() ->
    [?_assertEqual("<span id='123123' class='label'></span>",new_label_1()),
     ?_assertEqual("<span id='123125' class='label t_label'></span>",new_label_2()),
     ?_assertEqual("<span id='123125' class='label t_label' style='color: cyan;'>Username:</span>",new_label_3())
    ].
