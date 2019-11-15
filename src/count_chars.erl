%%%-------------------------------------------------------------------
%%% @author ikhvostenkov
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%%-------------------------------------------------------------------
-module(count_chars).
-author("ikhvostenkov").

%% API
-export([count_chars/1]).

count_chars(String) ->
  orddict:to_list(count_chars(String, orddict:new())).

count_chars([H | T], Acc) ->
  CharCounts = case orddict:is_key(H, Acc) of
                 true -> orddict:update(H, fun(CharCount) -> CharCount + 1 end, Acc);
                 false -> orddict:store(H, 1, Acc)
               end,
  count_chars(T, CharCounts);
count_chars([], Acc) -> Acc.
