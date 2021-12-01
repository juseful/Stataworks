// https://igija.tistory.com/217 참조함.

/* file 기준 */
clear
set more off
forvalues year = 2001/2021 {
import excel "FFQ_`year'.xls", firstrow case(preserve) allstring clear
tostring *, replace
save "FFQ_`year'", replace
}

clear
set more off
use "FFQ_2001"
save "FFQ", replace
forvalues year = 2002/2021 {
append using "FFQ_`year'"
save "FFQ", replace
}
drop if ORDR_PRRN_YMD > "2021-06-30"
save "FFQ", replace

/* sheet 기준 */
clear
set more off
forvalues SHEETNO = 1/3 {
import excel "RSLT_DRHX.xls", sheet("Sheet `SHEETNO'") firstrow case(preserve) allstring clear
tostring *, replace
save "RSLT_DRHX_`SHEETNO'"
}
