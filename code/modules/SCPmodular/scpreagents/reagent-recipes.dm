/*
	USE THIS FILE TO ADD ALL FUTURE REAGENT RECIPES TO BE EASILY MAINTAINABLE - CATEGORISE THESE.
*/

//amnestics below
/datum/chemical_reaction/amnestics/classa
	name = "Amnestics-A"
	result = /datum/reagent/amnestics/classa
	required_reagents = list(/datum/reagent/ethanol = 20, /datum/reagent/mindbreaker = 10, /datum/reagent/sugar = 10)
	result_amount = 1

/datum/chemical_reaction/amnestics/classb
	name = "Amnestics-B"
	result = /datum/reagent/amnestics/classb
	required_reagents = list(/datum/reagent/mercury = 40, /datum/reagent/mindbreaker = 10, /datum/reagent/amnestics/classa = 1)
	result_amount = 1

/datum/chemical_reaction/amnestics/classc
	name = "Amnestics-C"
	result = /datum/reagent/amnestics/classc
	required_reagents = list(/datum/reagent/mercury = 60, /datum/reagent/mindbreaker = 10, /datum/reagent/amnestics/classb = 1)
	result_amount = 1

/datum/chemical_reaction/amnestics/classe
	name = "Amnestics-E"
	result = /datum/reagent/amnestics/classe
	required_reagents = list(/datum/reagent/ethanol = 80, /datum/reagent/mindbreaker = 10, /datum/reagent/amnestics/classc = 1)
	result_amount = 1
