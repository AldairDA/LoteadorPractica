
PROGRAM _INIT
	(* Insert code here *)
	 VisuCtrl.numInputs.batch := 0;
END_PROGRAM

PROGRAM _CYCLIC
	//VARIABLES GLOBALES A LOCALES
	
	
	
	

	
	
	
	
	
	//VARIABLES LOCALES A GLOBALES
	gVisu.buttons.buttonAddToList 	:= VisuCtrl.buttons.buttonAddToList;
	gVisu.numInputs.batch 			:= VisuCtrl.numInputs.batch;
	gVisu.numInputs.material 		:= VisuCtrl.numInputs.material;
	 
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

