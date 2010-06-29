% Nitrogen Web Framework for Erlang
% Copyright (c) 2008-2010 Rusty Klophaus
% Contributions from Torbjorn Tornkvist (tobbe@tornkvist.org)
% See MIT-LICENSE for licensing information.

-module (validator_max_length).
-include_lib ("wf.hrl").
-export([render_action/1]).

-ifdef(TEST).
-export([validate/2]).
-endif.

-spec render_action(#max_length{}) -> iodata().
render_action(Record)  ->
    TriggerPath= Record#max_length.trigger,
    TargetPath = Record#max_length.target,
    Text = wf:js_escape(Record#max_length.text),
    Length = Record#max_length.length,
    CustomValidatorAction = #custom { trigger=TriggerPath, target=TargetPath, function=fun validate/2, text=Text, tag=Record },
    validator_custom:render_action(CustomValidatorAction),
    wf:f("v.add(Validate.Length, { maximum: ~p, tooLongMessage: \"~s\" });", [Length, Text]).

validate(Record, Value) ->
    Record#max_length.length >= length(Value).
