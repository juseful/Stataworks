/* tosting으로 null 값이 "."로 replace된 값 제거 */
foreach var of varlist * {
	replace `var' = "" if `var' == "."
}


/*
위의 경우 모든 변수의 format이 str인 경우는 가능하지만,
그렇지 않은 경우도 있으므로 일부만 하기 위해서
아래와 같이 특정 범위를 지정할 수도 있음.
*/

/* tosting으로 null 값이 "."로 replace된 값 제거 */
foreach var of varlist SM0101 - BL314201 {
	replace `var' = "" if `var' == "."
}
