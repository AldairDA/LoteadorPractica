
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	//VARIABLES GLOBALES A LOCALES
	
	//*****************************CONDICIONES************************************************************
	FOR i := 1 TO MAX_NUM_BATCH DO
		IF LoteCtrl.param.numberBatch[i] > 0 THEN
			LoteCtrl.status.writtenLine[i] := TRUE;
		ELSE
			LoteCtrl.status.writtenLine[i] := FALSE;
		END_IF;
//		LoteCtrl.status.numberBatch[i] := gVisu.numInputs.batch;
	
	
	
	
	 	IF  EDGEPOS(gVisu.buttons.buttonAddToList) THEN
//		FOR i := 1 TO MAX_NUM_BATCH DO
//			LoteCtrl.status.numberBatch[i] := gVisu.numInputs.batch;
//
//		END_FOR;
			IF NOT (LoteCtrl.status.writtenLine[1])  THEN
				LoteCtrl.param.numberBatch[1] := gVisu.numInputs.batch;
			
			END_IF;
			
			IF  (LoteCtrl.status.writtenLine[1]) AND NOT (LoteCtrl.status.writtenLine[2])  THEN
				LoteCtrl.param.numberBatch[2] := gVisu.numInputs.batch;
			
			END_IF;
			
			IF  (LoteCtrl.status.writtenLine[2]) AND NOT (LoteCtrl.status.writtenLine[3]) THEN
				LoteCtrl.param.numberBatch[3] := gVisu.numInputs.batch;
			
			END_IF;
			
			IF  (LoteCtrl.status.writtenLine[3]) AND NOT (LoteCtrl.status.writtenLine[4]) THEN
				LoteCtrl.param.numberBatch[4] := gVisu.numInputs.batch;
			
			END_IF;
			
			IF  (LoteCtrl.status.writtenLine[4]) AND NOT (LoteCtrl.status.writtenLine[5]) THEN
				LoteCtrl.param.numberBatch[5] := gVisu.numInputs.batch;
			
			END_IF;
			
			IF  (LoteCtrl.status.writtenLine[5]) AND NOT (LoteCtrl.status.writtenLine[6]) THEN
				LoteCtrl.param.numberBatch[6] := gVisu.numInputs.batch;
			
			END_IF;
			
			IF  (LoteCtrl.status.writtenLine[6]) AND NOT (LoteCtrl.status.writtenLine[7]) THEN
				LoteCtrl.param.numberBatch[7] := gVisu.numInputs.batch;
			
			END_IF;
			
			IF  (LoteCtrl.status.writtenLine[7]) AND NOT (LoteCtrl.status.writtenLine[8]) THEN
				LoteCtrl.param.numberBatch[8] := gVisu.numInputs.batch;
			
			END_IF;
			
			IF  (LoteCtrl.status.writtenLine[8]) AND NOT (LoteCtrl.status.writtenLine[9]) THEN
				LoteCtrl.param.numberBatch[9] := gVisu.numInputs.batch;
			
			END_IF;
			
			IF  (LoteCtrl.status.writtenLine[9]) AND NOT (LoteCtrl.status.writtenLine[10]) THEN
				LoteCtrl.param.numberBatch[10] := gVisu.numInputs.batch;
			
			END_IF;
		
		END_IF;
		
	END_FOR;
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

