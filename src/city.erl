-module(city).
-export([new/2,name/1, neighbours/1,infection_level/2, infect/2]).

new(CityName, Neighbours) ->
    {ok,{CityName,Neighbours,#{}}}.

name({Name,_Neighbours,_State}) -> Name.

neighbours({_Name,Neighbours,_State}) -> Neighbours.

infection_level({_CityName,_Neighbours,State},Disease) ->
    maps:get(Disease, State, 0).

infect({CityName,Neighbours,State}, Disease) ->
    NewLevel = maps:get(Disease, State, 0) + 1,
    case NewLevel >3 of
        true -> outbreak ;
        false -> 
            NewState = State#{Disease => NewLevel},
            {infected, {CityName, Neighbours, NewState}}
    end.
