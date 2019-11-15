%%%-------------------------------------------------------------------
%%% @author ikhvostenkov
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%%-------------------------------------------------------------------
-module(sort_tuples_test).
-author("ikhvostenkov").
-include_lib("eunit/include/eunit.hrl").

empty_input_test() ->
  ?assertEqual([], sort_tuples:sort_tuples([])).
input_with_empty_tuples_test() ->
  ?assertError(function_clause, sort_tuples:sort_tuples([{}, {}, {}])).
random_input_test() ->
  ?assertEqual([{104, 1}, {101, 1}, {97, 1}, {105, 2}, {116, 3}, {115, 3}, {32, 3}],
    sort_tuples:sort_tuples([{115, 3}, {105, 2}, {32, 3}, {101, 1}, {104, 1}, {97, 1}, {116, 3}])).
