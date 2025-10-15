
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
		
		(*Esta función permite configurar el reloj de tiempo real a la hora deseada (estructura RTCtime_struct).
		al configurar la fecha, tenga en cuenta los límites (el año debe estar entre 1990 y 2089*)
		
		status_settime := RTC_settime(ADR(rtc_settime)); (* set new real time clock *)

		IF (status_settime <> 0) THEN
			error := 2; (* set error level for RTC_settime *)
		END_IF
	END_IF

	 
END_PROGRAM

PROGRAM _CYCLIC
	(*VARIABLES GLOBALES A LOCALES*)
	
	

	
	//*****************************BANDERA DE FILAS OCUPADAS POR N# DE LOTE ************************************************************
	
	FOR i := 1 TO MAX_NUM_BATCH DO
		IF LoteCtrl.param.numberBatch[i] > 0 THEN
			LoteCtrl.status.writtenLine[i] := TRUE;
		ELSE
			LoteCtrl.status.writtenLine[i] := FALSE;
		END_IF;
		//		LoteCtrl.status.numberBatch[i] := gVisu.numInputs.batch;
	END_FOR;
	
	
	
	//*****************************LOGICA DE ACOMODO DE LOTES EN FILAS ************************************************************	
	
	IF  EDGEPOS(gVisu.buttons.buttonAddToList) THEN
		
		FOR i:= 1 TO MAX_NUM_BATCH DO
			
			IF (NOT LoteCtrl.status.writtenLine[i]) THEN
				nWrittenLine  := i;
				EXIT;
			END_IF;	
			
		END_FOR;
		
		LoteCtrl.param.numberBatch[nWrittenLine]	:= gVisu.numInputs.batch;
		LoteCtrl.param.material[nWrittenLine] 		:= gVisu.numInputs.material;
		LoteCtrl.status.year[nWrittenLine] 			:= rtc_settime.year;
		LoteCtrl.status.month[nWrittenLine] 		:= rtc_settime.month;
		LoteCtrl.status.day[nWrittenLine] 			:= rtc_settime.day;
		LoteCtrl.status.hour[nWrittenLine] 			:= rtc_settime.hour;
		LoteCtrl.status.minute[nWrittenLine] 		:= rtc_settime.minute;	

	END_IF;
	
		
	//*****************************LOGICA DE BUSQUEDA DE MATERIAL ************************************************************	
		
	IF EDGEPOS(gVisu.buttons.buttonSearchMaterial) THEN
		
		FOR i:= 1 TO MAX_NUM_BATCH DO
			
			IF ( LoteCtrl.param.numberBatch[i] = gVisu.numInputs.searchBatch)  THEN
				LoteCtrl.param.searchMaterial := LoteCtrl.param.material[i];
				LoteCtrl.param.searchYear 	  := LoteCtrl.status.year[i];
				LoteCtrl.param.searchMonth 	  := LoteCtrl.status.month[i];
				LoteCtrl.param.searchDay 	  := LoteCtrl.status.day[i];
				LoteCtrl.param.searchHour 	  := LoteCtrl.status.hour[i];
				LoteCtrl.param.searchMinute   := LoteCtrl.status.minute[i];
			END_IF;
			
		END_FOR;
		
	END_IF;
		



	(*Call FBs and Action*)
	
	ActionTime;
	
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

