
PROGRAM _INIT
	(* Insert code here *)
	error := 0;
	DOUT1 := 0;
	
	status_gettime := RTC_gettime(ADR(rtc_gettime)); (* get current time and store it into time struct *)
	
	IF (status_gettime <> 0) THEN
		error := 1; (* set error level for RTC_gettime *)
	END_IF
	
	IF (rtc_gettime.year <> 2000) THEN
		(* set values for RTCSetTime *)
		rtc_settime.year 		:= 2025;
		rtc_settime.month 		:= rtc_gettime.month;
		rtc_settime.day 		:= rtc_gettime.day;
		rtc_settime.hour 		:= rtc_gettime.hour;
		rtc_settime.minute 		:= rtc_gettime.minute;
		rtc_settime.second 		:= rtc_gettime.second;
//		rtc_settime.millisec 	:= rtc_gettime.millisec;
//		rtc_settime.microsec 	:= rtc_gettime.microsec;

		status_settime := RTC_settime(ADR(rtc_settime)); (* set new real time clock *)

		IF (status_settime <> 0) THEN
			error := 2; (* set error level for RTC_settime *)
		END_IF
	END_IF

	 
END_PROGRAM

PROGRAM _CYCLIC
	//VARIABLES GLOBALES A LOCALES
	
	
//	status_gettime := RTC_gettime(ADR(rtc_gettime)); (* get current time and store it into time struct *)
	status_settime := RTC_settime(ADR(rtc_settime));

//	IF ((rtc_gettime.hour = 12) AND (rtc_gettime.minute >= 0) AND (rtc_gettime.minute <= 30)) THEN (* check time interval *)
//		DOUT1 := 1; (* set output to high *)
//	ELSE
//		DOUT1 := 0; (* set output to low *)
//	END_IF

	
		rtc_settime.year 		:= 2025;
		rtc_settime.month 		:= rtc_gettime.month;
		rtc_settime.day 		:= rtc_gettime.day;
		rtc_settime.hour 		:= rtc_gettime.hour;
		rtc_settime.minute 		:= rtc_gettime.minute;
		rtc_settime.second 		:= rtc_gettime.second;
		rtc_settime.millisec 	:= rtc_gettime.millisec;
		
	
	
	rtc_gettime.millisec := rtc_gettime.millisec +1;
	IF rtc_gettime.millisec >= 100 THEN
		rtc_gettime.millisec := 0;
	  rtc_gettime.second := rtc_gettime.second +1;
	END_IF;
	
	IF rtc_gettime.second >= 60 THEN
		rtc_gettime.second := 0;
		rtc_gettime.minute := rtc_gettime.minute +1;
	END_IF;
	
	IF rtc_gettime.minute >= 60 THEN
		rtc_gettime.minute := 0;
		rtc_gettime.hour := rtc_gettime.hour +1;
	END_IF;
	
	IF rtc_gettime.hour >= 24 THEN
		rtc_gettime.hour := 0;
		rtc_gettime.day := rtc_gettime.day +1;
	END_IF;
	
	//*****************************BANDERA DE FILAS OCUPADAS POR N# DE LOTE ************************************************************
	FOR i := 1 TO MAX_NUM_BATCH DO
		IF LoteCtrl.param.numberBatch[i] > 0 THEN
			LoteCtrl.status.writtenLine[i] := TRUE;
		ELSE
			LoteCtrl.status.writtenLine[i] := FALSE;
		END_IF;
		//		LoteCtrl.status.numberBatch[i] := gVisu.numInputs.batch;
	
	
//*****************************LOGICA DE ACOMODO DE LOTES EN FILAS ************************************************************	
	
	 	IF  EDGEPOS(gVisu.buttons.buttonAddToList) THEN
//		FOR i := 1 TO MAX_NUM_BATCH DO
//			LoteCtrl.status.numberBatch[i] := gVisu.numInputs.batch;
//
//		END_FOR;
			IF NOT (LoteCtrl.status.writtenLine[1])  THEN
				LoteCtrl.param.numberBatch[1] 	:= gVisu.numInputs.batch;
				LoteCtrl.param.material[1] 		:= gVisu.numInputs.material;
				LoteCtrl.status.currentDay[1];
				LoteCtrl.status.year[1] 		:= rtc_settime.year;
				LoteCtrl.status.month[1] 		:= rtc_settime.month;
				LoteCtrl.status.day[1] 			:= rtc_settime.day;
				LoteCtrl.status.hour[1] 		:= rtc_settime.hour;
				LoteCtrl.status.minute[1] 		:= rtc_settime.minute;
				
			END_IF;
			
			IF  (LoteCtrl.status.writtenLine[1]) AND NOT (LoteCtrl.status.writtenLine[2])  THEN
				LoteCtrl.param.numberBatch[2] 	:= gVisu.numInputs.batch;
				LoteCtrl.param.material[2] 		:= gVisu.numInputs.material;
				LoteCtrl.status.currentDay[2];
				LoteCtrl.status.year[2] 		:= rtc_settime.year;
				LoteCtrl.status.month[2] 		:= rtc_settime.month;
				LoteCtrl.status.day[2] 			:= rtc_settime.day;
				LoteCtrl.status.hour[2] 		:= rtc_settime.hour;
				LoteCtrl.status.minute[2] 		:= rtc_settime.minute;
			END_IF;
			
			IF  (LoteCtrl.status.writtenLine[2]) AND NOT (LoteCtrl.status.writtenLine[3]) THEN
				LoteCtrl.param.numberBatch[3] 	:= gVisu.numInputs.batch;
				LoteCtrl.param.material[3] 		:= gVisu.numInputs.material;
			END_IF;
			
			IF  (LoteCtrl.status.writtenLine[3]) AND NOT (LoteCtrl.status.writtenLine[4]) THEN
				LoteCtrl.param.numberBatch[4] 	:= gVisu.numInputs.batch;
				LoteCtrl.param.material[4] 		:= gVisu.numInputs.material;
			END_IF;
			
			IF  (LoteCtrl.status.writtenLine[4]) AND NOT (LoteCtrl.status.writtenLine[5]) THEN
				LoteCtrl.param.numberBatch[5] 	:= gVisu.numInputs.batch;
				LoteCtrl.param.material[5] 		:= gVisu.numInputs.material;
			END_IF;
			
			IF  (LoteCtrl.status.writtenLine[5]) AND NOT (LoteCtrl.status.writtenLine[6]) THEN
				LoteCtrl.param.numberBatch[6] 	:= gVisu.numInputs.batch;
				LoteCtrl.param.material[6] 		:= gVisu.numInputs.material;
			END_IF;
			
			IF  (LoteCtrl.status.writtenLine[6]) AND NOT (LoteCtrl.status.writtenLine[7]) THEN
				LoteCtrl.param.numberBatch[7] 	:= gVisu.numInputs.batch;
				LoteCtrl.param.material[7] 		:= gVisu.numInputs.material;
			END_IF;
			
			IF  (LoteCtrl.status.writtenLine[7]) AND NOT (LoteCtrl.status.writtenLine[8]) THEN
				LoteCtrl.param.numberBatch[8] 	:= gVisu.numInputs.batch;
				LoteCtrl.param.material[8] 		:= gVisu.numInputs.material;
			END_IF;
			
			IF  (LoteCtrl.status.writtenLine[8]) AND NOT (LoteCtrl.status.writtenLine[9]) THEN
				LoteCtrl.param.numberBatch[9] 	:= gVisu.numInputs.batch;
				LoteCtrl.param.material[9] 		:= gVisu.numInputs.material;
			END_IF;
			
			IF  (LoteCtrl.status.writtenLine[9]) AND NOT (LoteCtrl.status.writtenLine[10]) THEN
				LoteCtrl.param.numberBatch[10] 	:= gVisu.numInputs.batch;
				LoteCtrl.param.material[10] 	:= gVisu.numInputs.material;
			END_IF;
		
		END_IF;
		
	//*****************************LOGICA DE BUSQUEDA DE MATERIAL ************************************************************	
		
		IF EDGEPOS(gVisu.buttons.buttonSearchMaterial) THEN
			IF ( LoteCtrl.param.numberBatch[1] = gVisu.numInputs.searchBatch)  THEN
				LoteCtrl.param.searchMaterial := LoteCtrl.param.material[1];
				LoteCtrl.param.searchYear 	  := LoteCtrl.status.year[1];
				LoteCtrl.param.searchMonth 	  := LoteCtrl.status.month[1];
				LoteCtrl.param.searchDay 	  := LoteCtrl.status.day[1];
				LoteCtrl.param.searchHour 	  := LoteCtrl.status.hour[1];
				LoteCtrl.param.searchMinute   := LoteCtrl.status.minute[1];
			END_IF;
			IF ( LoteCtrl.param.numberBatch[2] = gVisu.numInputs.searchBatch)  THEN
				LoteCtrl.param.searchMaterial := LoteCtrl.param.material[2];
				LoteCtrl.param.searchYear 	  := LoteCtrl.status.year[2];
				LoteCtrl.param.searchMonth 	  := LoteCtrl.status.month[2];
				LoteCtrl.param.searchDay 	  := LoteCtrl.status.day[2];
				LoteCtrl.param.searchHour 	  := LoteCtrl.status.hour[2];
				LoteCtrl.param.searchMinute   := LoteCtrl.status.minute[2];
			END_IF;
			IF ( LoteCtrl.param.numberBatch[3] = gVisu.numInputs.searchBatch)  THEN
				LoteCtrl.param.searchMaterial := LoteCtrl.param.material[3];
			END_IF;
			IF ( LoteCtrl.param.numberBatch[4] = gVisu.numInputs.searchBatch)  THEN
				LoteCtrl.param.searchMaterial := LoteCtrl.param.material[4];
			END_IF;
			IF ( LoteCtrl.param.numberBatch[5] = gVisu.numInputs.searchBatch)  THEN
				LoteCtrl.param.searchMaterial := LoteCtrl.param.material[5];
			END_IF;
			IF ( LoteCtrl.param.numberBatch[6] = gVisu.numInputs.searchBatch)  THEN
				LoteCtrl.param.searchMaterial := LoteCtrl.param.material[6];
			END_IF;
			IF ( LoteCtrl.param.numberBatch[7] = gVisu.numInputs.searchBatch)  THEN
				LoteCtrl.param.searchMaterial := LoteCtrl.param.material[7];
			END_IF;
			IF ( LoteCtrl.param.numberBatch[8] = gVisu.numInputs.searchBatch)  THEN
				LoteCtrl.param.searchMaterial := LoteCtrl.param.material[8];
			END_IF;
			IF ( LoteCtrl.param.numberBatch[9] = gVisu.numInputs.searchBatch)  THEN
				LoteCtrl.param.searchMaterial := LoteCtrl.param.material[9];
			END_IF;
			IF ( LoteCtrl.param.numberBatch[10] = gVisu.numInputs.searchBatch)  THEN
				LoteCtrl.param.searchMaterial := LoteCtrl.param.material[10];
			END_IF;
		END_IF;
		
	END_FOR;
	
	DTExSetTime_0(enable := 1, DT1 := LoteCtrl.status.currentDay[1]);
	
	
	ActionTime;
	LoteCtrl.status.currentDay1;
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

