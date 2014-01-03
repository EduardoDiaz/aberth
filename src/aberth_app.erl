-module(aberth_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
	barrel:start_listener(echo, 100, barrel_tcp,
          [{port, 10001}], aberth_handler, []),
    aberth_sup:start_link().

stop(_State) ->
    ok.
