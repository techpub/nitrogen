% Nitrogen Web Framework for Erlang
% Copyright (c) 2008-2010 Rusty Klophaus
% See MIT-LICENSE for licensing information.

-module (action_effect).
-include_lib ("wf.hrl").
-compile(export_all).

-spec render_action(#effect{}) -> wf_render_action_data().
render_action(Record) ->
    #jquery_effect {
        type=effect,
        anchor = Record#effect.anchor,
        target = Record#effect.target,
        effect = Record#effect.effect,
        options = Record#effect.options,
        speed = Record#effect.speed
    }.
