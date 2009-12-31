-module(element_ul_test).
-compile([export_all]).

-include_lib("eunit/include/eunit.hrl").

-include("wf.inc").

new_ul_1() ->
  Rec_ul = #ul{},
  lists:flatten(element_ul:render("1",Rec_ul)).

new_ul_2() ->
  Rec_ul = #ul{class="t_ul"},
  lists:flatten(element_ul:render("2",Rec_ul)).

new_ul_3() ->
  Rec_ul = #ul{class="t_ul", style="color: cyan;", body="SOME BODY"},
  lists:flatten(element_ul:render("3",Rec_ul)).

basic_test_() ->
  [
   ?_assertEqual("<ul id=\"1\" class=\"list\"/>",new_ul_1()),
   ?_assertEqual("<ul id=\"2\" class=\"list t_ul\"/>",new_ul_2()),
   ?_assertEqual("<ul id=\"3\" class=\"list t_ul\" style=\"color: cyan;\">SOME BODY</ul>",new_ul_3()),
   ?_assertEqual([module,id,actions,show_if,class,style,title,attrs,body],
	 element_ul:reflect())
  ].
