% Nitrogen Web Framework for Erlang
% Copyright (c) 2008-2009 Rusty Klophaus
% See MIT-LICENSE for licensing information.

-module (action_animate).
-include ("wf.inc").
-compile(export_all).

-spec(render_action/3::(wf_triggerpath(), wf_targetpath(), #animate{easing::wf_easing()}) -> iodata()).
render_action(TriggerPath, TargetPath, Record) ->
	Effect = #jquery_effect {
		type=animate,
		options = Record#animate.options,
		speed = Record#animate.speed,
		easing = Record#animate.easing
	},
	action_jquery_effect:render_action(TriggerPath, TargetPath, Effect).
