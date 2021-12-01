/* 환자번호를 온전한 8자리로 변환하기 위한 과정 확인!!
drop if PTNOS !="7736099" & PTNOS !="9299"
order PTNOS
save "NAFLD_S", replace
gen PTNOL = ustrlen(PTNO)
gen PTNOL2 = substr("00000000",1,8-ustrlen(PTNO)) // 앞자리에 부족한 숫자만큼 0 채우기!!
rename PTNO PTNOS
*/

gen PTNO = substr("00000000",1,8-ustrlen(PTNOS))+PTNOS
// 환자번호 앞에 '0'이 삭제된 경우이므로, 모자른 0의 갯수는 '8-기존 자리수'로 계산해 병합한다.
