You must translate these two user stories into a functional representation:

```
As a person,
So that I can use a bike,
I'd like a docking station to release a bike.

As a person,
So that I can use a good bike,
I'd like to see if a bike is working
```

nouns: person, bike, docking station
verbs: release, see if working


Objects  | Messages
------------- | -------------
person  |  
docking_station  | release_a_bike
bike  | see_if_working

docking_station > release_a_bike > bike
see_if_working < > true/false? < > bike
