-module(city).
-export([new/2,name/1, neighbours/1,infection_level/2, infect/2]).

new(CityName, Neighbours) ->
    {ok,{CityName,Neighbours,#{}}}.

name({Name,_Neighbours,_State}) -> Name.

neighbours({_Name,Neighbours,_State}) -> Neighbours.

infection_level({_CityName,_Neighbours,State},Disease) ->
    maps:get(Disease, State, 0).

infect({CityName,Neighbours,State}, Disease) ->
    OldLevel = maps:get(Disease, State, 0),
    case OldLevel of
        3 -> outbreak ;
        _ -> 
            NewState = State#{Disease => OldLevel + 1},
            {infected, {CityName, Neighbours, NewState}}
    end.
