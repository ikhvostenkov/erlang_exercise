%%%-------------------------------------------------------------------
%%% @author ikhvostenkov
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%%-------------------------------------------------------------------
-module(build_huffman_test).
-author("ikhvostenkov").
-include_lib("eunit/include/eunit.hrl").

build_huffman_empty_list_test() ->
  ?assertEqual([], build_huffman:build_huffman([])).

build_huffman_one_tuple_in_list_test() ->
  ?assertEqual([{{{{97, 105}, 32}, {115, {{104, 101}, 116}}}, 14}],
    build_huffman:build_huffman([{{{{97, 105}, 32}, {115, {{104, 101}, 116}}}, 14}])).

build_huffman_sorted_tuples_in_list_test() ->
  ?assertEqual([{{{115, 32}, {{97, 105}, {{104, 101}, 116}}}, 14}],
    build_huffman:build_huffman([{104, 1}, {101, 1}, {97, 1}, {105, 2}, {116, 3}, {115, 3}, {32, 3}])).

build_encode_table_simple_tuple_test() ->
  ?assertEqual(#{1 => [0], 2 => [1]}, build_huffman:build_encode_table({1, 2})).

build_encode_table_simple_tuple_and_number_test() ->
  ?assertEqual(#{1 => [0, 0], 2 => [0, 1], 3 => [1]}, build_huffman:build_encode_table({{1, 2}, 3})).

build_encode_table_number_and_simple_tuple_test() ->
  ?assertEqual(#{1 => [1, 0], 2 => [1, 1], 3 => [0]}, build_huffman:build_encode_table({3, {1, 2}})).

build_encode_table_two_tuples_test() ->
  ?assertEqual(#{1 => [0, 0], 2 => [0, 1], 3 => [1, 0], 4=>[1, 1]},
    build_huffman:build_encode_table({{1, 2}, {3, 4}})).

build_encode_table_nested_tuples_test() ->
  ?assertEqual(#{
    32 => [0, 1],
    97 => [1, 0, 0],
    101 => [1, 1, 0, 1],
    104 => [1, 1, 0, 0],
    105 => [1, 0, 1],
    115 => [0, 0],
    116 => [1, 1, 1]},
    build_huffman:build_encode_table({{115, 32}, {{97, 105}, {{104, 101}, 116}}})).
