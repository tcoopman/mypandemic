-module(city).
-export([new/2,name/1, neighbours/1,infection_level/2, infect/2]).

new(CityName, Neighbours) ->
    {ok,{CityName,Neighbours,#{}}}.

name({Name,_Neighbours,_State}) -> Name.

neighbours({_Name,Neighbours,_State}) -> Neighbours.

infection_level({_CityName,_Neighbours,State},Disease) ->
    maps:get(Disease, State, 0).

infect(City = {CityName,Neighbours,State}, Disease) ->
    OldLevel = infection_level(City, Disease),
    case OldLevel of
        3 -> outbreak ;
        _ -> 
            NewState = State#{Disease => OldLevel + 1},
            {infected, {CityName, Neighbours, NewState}}
    end.
