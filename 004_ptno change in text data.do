/* text 내 환자번호 변환 작업 테스트용
clear
use "NAFLD_S"
drop PTNO
clonevar PTNOS = KEYA
tostring PTNOS, replace
gen PTNO = substr("00000000",1,8-ustrlen(PTNOS))+PTNOS
order PTNO
drop PTNOS
gen SM_DATE = string(KEYB, "%tdCCYY-NN-DD") /* 기존의 숫자로 된 날짜 값을 string으로 변경 */
order SM_DATE, after(PTNO)
save "NAFLD_S", replace
gen chck = ustrregexm(UNS005_ORIGINAL,"[0-9]{8}") // 8자리 숫자로 이루어진 값이 있는지 찾기, 있다면 1/없다면 0
gen chck2 = ustrregexm(UNS005_ORIGINAL,PTNO) // 환자번호 있는지 찾기,  있다면 1/없다면 0
gen chck3 = ustrregexrf(UNS005_ORIGINAL,PTNO,"",1) // 첫번째 환자번호만 변환가능
gen chck4 = ustrregexra(UNS005_ORIGINAL,PTNO,"") // text 내에 포함된 모든 환자번호 변환가능.
gen TEST = UNS005_ORIGINAL+PTNO
gen chck5 = ustrregexra(TEST,PTNO,"",1) // text 내에 포함된 모든 환자번호 변환가능.
// gen UNS005_CHCK2 = ustrpos(UNS005_ORIGINAL,PTNO) // 변환전 결과, 환자번호 시작 위치 찾기,  있다면 1/없다면 0
// gen UNS003_CHCK2 = ustrpos(UNS003,PTNO) // 변환전 결과, 환자번호 시작 위치 찾기,  있다면 1/없다면 0
save "NAFLD_S", replace
*/

// TEXT내 환자번호 변환
gen UNS005_ORIGINAL_T = ustrregexra(UNS005_ORIGINAL,PTNO,CDW_NO) // ptno를 cdw_id로 변환
gen UNS003_T =ustrregexra(UNS003,PTNO,CDW_NO) // ptno를 cdw_id로 변환
gen UNS005_CHCK1 = ustrregexm(UNS005_ORIGINAL,PTNO) // 변환전 결과, 환자번호 있는지 찾기,  있다면 1/없다면 0
gen UNS003_CHCK1 = ustrregexm(UNS003,PTNO) // 변환전 결과, 환자번호 있는지 찾기,  있다면 1/없다면 0
gen UNS005_CHCK2 = ustrregexm(UNS005_ORIGINAL_T,"([0-9]){8}") if UNS005_CHCK1 == 0 // 이중번호 합본으로 TEXT 결과에 환자번호가 남아있는지 확인, 8자리의 연속된 숫자배열 여부확인
gen UNS003_CHCK2 = ustrregexm(UNS003_T,"([0-9]){8}") if UNS003_CHCK1 == 0 // 이중번호 합본으로 TEXT 결과에 환자번호가 남아있는지 확인, 8자리의 연속된 숫자배열 여부확인
gen UNS005_ORIGINAL_T2 = ustrregexra(UNS005_ORIGINAL,"([0-9]){8}",CDW_NO) if UNS005_CHCK2 == 1 // TEXT 결과에 포함된 ptno를 cdw_id로 변환
gen UNS003_T2 = ustrregexra(UNS003,"([0-9]){8}",CDW_NO) if UNS003_CHCK2 == 1 // TEXT 결과에 포함된 ptno를 cdw_id로 변환

// 이중번호 합본에 의해 변환되지 않은 내용을 확인한 후 작업
gen UNS005_ORIGINAL_T3 = ustrregexra(UNS005_ORIGINAL,PTNO,CDW_NO) if UNS005_CHCK2 != 1
replace UNS005_ORIGINAL_T3 = ustrregexra(UNS005_ORIGINAL,"([0-9]){8}",CDW_NO) if UNS005_CHCK2 == 1
gen UNS003_T3 = ustrregexra(UNS003,PTNO,CDW_NO) if UNS003_CHCK2 != 1
replace UNS003_T3 = ustrregexra(UNS003,"([0-9]){8}",CDW_NO) if UNS003_CHCK2 == 1
