%%%-------------------------------------------------------------------
%%% @author ikhvostenkov
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%%-------------------------------------------------------------------
-module(sort_tuples).
-author("ikhvostenkov").

%% API
-export([sort_tuples/1]).

sort_tuples(Tuples) ->
  lists:sort(fun({A1, B1}, {A2, B2}) -> {B2, A1} > {B1, A2} end, Tuples).
