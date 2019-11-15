%%%-------------------------------------------------------------------
%%% @author ikhvostenkov
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%%-------------------------------------------------------------------
-module(build_huffman).
-author("ikhvostenkov").

%% API
-export([build_huffman/1, build_encode_table/1]).

build_huffman([{A, B}]) -> [{A, B}];
build_huffman([]) -> [];
build_huffman([{A1, B1}, {A2, B2} | T]) ->
  List = lists:merge(fun({_A3, B3}, {_A4, B4}) -> B3 < B4 end, [{{A1, A2}, B1 + B2}], T),
  build_huffman(List).

build_encode_table(C) -> to_map(encode(C)).

encode({A, B}) ->
  RSx = encode(A),
  RSy = encode(B),
  [{[0 | PathR], ValueR} || {PathR, ValueR} <- RSx] ++
  [{[1 | PathR], ValueR} || {PathR, ValueR} <- RSy];
encode(C) -> [{[], C}].

to_map(Xs) -> maps:from_list([{Value, Path} || {Path, Value} <- Xs]).
