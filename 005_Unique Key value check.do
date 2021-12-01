/* 중복값 여부 확인 */
duplicates report CON
/* 중복값 명단 확인 */
duplicates list CON

/* 중복되는 값의 순번 표시 */
gsort CON ordr_ymd_n ordr_cd
by CON: gen SEQ=_n
egen UK = concat(CON SEQ)
