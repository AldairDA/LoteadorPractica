
TYPE
	LoteCtrl_type : 	STRUCT 
		cmd : LoteCtrl_cmd_type;
		param : LoteCtrl_param_type;
		status : LoteCtrl_status_type;
		state : LoteCtrl_state_type;
	END_STRUCT;
	LoteCtrl_cmd_type : 	STRUCT 
		New_Member : USINT;
	END_STRUCT;
	LoteCtrl_param_type : 	STRUCT 
		numberBatch : ARRAY[1..MAX_NUM_BATCH]OF UINT;
		material : ARRAY[1..MAX_NUM_BATCH]OF STRING[80];
		searchMaterial : STRING[80];
		searchYear : UINT;
		searchMonth : USINT;
		searchDay : USINT;
		searchHour : USINT;
		searchMinute : USINT;
	END_STRUCT;
	LoteCtrl_status_type : 	STRUCT 
		writtenLine : ARRAY[1..MAX_NUM_BATCH]OF BOOL;
		year : ARRAY[1..MAX_NUM_BATCH]OF UINT;
		month : ARRAY[1..MAX_NUM_BATCH]OF USINT;
		day : ARRAY[1..MAX_NUM_BATCH]OF USINT;
		hour : ARRAY[1..MAX_NUM_BATCH]OF USINT;
		minute : ARRAY[1..MAX_NUM_BATCH]OF USINT;
	END_STRUCT;
	LoteCtrl_state_type : 	STRUCT 
		New_Member : USINT;
	END_STRUCT;
END_TYPE
