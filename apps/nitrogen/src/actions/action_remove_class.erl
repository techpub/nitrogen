% Nitrogen Web Framework for Erlang
% Copyright (c) 2008-2010 Rusty Klophaus
% See MIT-LICENSE for licensing information.

-module (action_remove_class).
-include_lib ("wf.hrl").
-compile(export_all).

-spec render_action(#remove_class{}) -> wf_render_action_data().
render_action(Record) ->
    #jquery_effect {
        type=remove_class,
        class = Record#remove_class.class,
        speed = Record#remove_class.speed
    }.
