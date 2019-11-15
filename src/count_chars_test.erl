%%%-------------------------------------------------------------------
%%% @author ikhvostenkov
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%%-------------------------------------------------------------------
-module(count_chars_test).
-author("ikhvostenkov").
-include_lib("eunit/include/eunit.hrl").

empty_input_test() ->
  ?assertEqual([], count_chars:count_chars("")).
input_with_spaces_test() ->
  ?assertEqual([{32, 2}], count_chars:count_chars("  ")).
single_char_input_test() ->
  ?assertEqual([{97, 1}], count_chars:count_chars("a")).
multiple_items_of_the_same_char_input_test() ->
  ?assertEqual([{97, 10}], count_chars:count_chars("aaaaaaaaaa")).
random_input_test() ->
  ?assertEqual([{32, 3}, {97, 1}, {101, 1}, {104, 1}, {105, 2}, {115, 3}, {116, 3}],
    count_chars:count_chars("this is a test")).
