
ACTION ActionTime: 
	
(*Lee la hora y la fecha del reloj de tiempo real y escribe esta información en una estructura RTCtime_struct.*)
	
	status_gettime := RTC_gettime(ADR(rtc_gettime)); (* get current time and store it into time struct *)
	
	//	status_settime := RTC_settime(ADR(rtc_settime));

	//	IF ((rtc_gettime.hour = 12) AND (rtc_gettime.minute >= 0) AND (rtc_gettime.minute <= 30)) THEN (* check time interval *)
	//		DOUT1 := 1; (* set output to high *)
	//	ELSE
	//		DOUT1 := 0; (* set output to low *)
	//	END_IF
	
(*Lee la hora y la fecha del reloj de tiempo real y escribe esta información en una estructura RTCtime_struct. *)
	
	rtc_settime.year 		:= 2025;
	rtc_settime.month 		:= rtc_gettime.month;
	rtc_settime.day 		:= rtc_gettime.day;
	rtc_settime.hour 		:= rtc_gettime.hour;
	rtc_settime.minute 		:= rtc_gettime.minute;
	rtc_settime.second 		:= rtc_gettime.second;
	rtc_settime.millisec 	:= rtc_gettime.millisec;
		
	
	
	//	rtc_gettime.millisec := rtc_gettime.millisec +1;
	//	IF rtc_gettime.millisec >= 100 THEN
	//		rtc_gettime.millisec := 0;
	//	  rtc_gettime.second := rtc_gettime.second +1;
	//	END_IF;
	//	
	//	IF rtc_gettime.second >= 60 THEN
	//		rtc_gettime.second := 0;
	//		rtc_gettime.minute := rtc_gettime.minute +1;
	//	END_IF;
	//	
	//	IF rtc_gettime.minute >= 60 THEN
	//		rtc_gettime.minute := 0;
	//		rtc_gettime.hour := rtc_gettime.hour +1;
	//	END_IF;
	//	
	//	IF rtc_gettime.hour >= 24 THEN
	//		rtc_gettime.hour := 0;
	//		rtc_gettime.day := rtc_gettime.day +1;
	//	END_IF;

END_ACTION
