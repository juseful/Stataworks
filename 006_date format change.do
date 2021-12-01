// CCYY 앞의 형식은 STATA에서 나오는 DATA Format에 따라 바뀜
gen SM_DATE = string(ORDR_YMD, "%tcCCYY-NN-DD") /* 기존의 숫자로 된 날짜 값을 string으로 변경 */
gen ENFR_DT = string(ENFR_DT, "%tcCCYY-NN-DD_HH:MM:SS") /* 기존의 숫자로 된 날짜 값을 string으로 변경 */

gen SM_DATE = string(ORDR_YMD, "%tdCCYY-NN-DD") /* 기존의 숫자로 된 날짜 값을 string으로 변경 */
gen ENFR_DT = string(ENFR_DT, "%tdCCYY-NN-DD_HH:MM:SS") /* 기존의 숫자로 된 날짜 값을 string으로 변경 */
