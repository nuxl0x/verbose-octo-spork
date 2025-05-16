#!/usr/bin/bash

ARG_1="$1"
ARG_2="$2"
ARG_3="$3"
ARG_4="$4"

# linear equations handling function
function linear {
	gradient="$ARG_2"
	y_intercept="$ARG_3"
	x_coord_1="-2"
	x_coord_2="-1"
	x_coord_3="0"
	x_coord_4="1"
	x_coord_5="2"
    # custom x coordinate checker (checks if arg 4 was "c" for custom, wont trigger if anything else)
	if [[ "$ARG_4" == "c" ]]; then
		read -p "[VOS] Enter first custom X coordinate: " x_coord_1
		read -p "[VOS] Enter second custom X coordinate: " x_coord_2
		read -p "[VOS] Enter third custom X coordinate: " x_coord_3
		read -p "[VOS] Enter fourth custom X coordinate: " x_coord_4
		read -p "[VOS] Enter fifth custom X coordinate: " x_coord_5
	fi
	result_1=$(echo "scale=2; $gradient * $x_coord_1 + $y_intercept" | bc -l)
	result_2=$(echo "scale=2; $gradient * $x_coord_2 + $y_intercept" | bc -l)
	result_3=$(echo "scale=2; $gradient * $x_coord_3 + $y_intercept" | bc -l)
	result_4=$(echo "scale=2; $gradient * $x_coord_4 + $y_intercept" | bc -l)
	result_5=$(echo "scale=2; $gradient * $x_coord_5 + $y_intercept" | bc -l)
	
	echo "($x_coord_1, $result_1)"
	echo "($x_coord_2, $result_2)"
	echo "($x_coord_3, $result_3)"
	echo "($x_coord_4, $result_4)"
	echo "($x_coord_5, $result_5)"
	exit 0
}

# standard math handler
operation="="
case "$ARG_1" in
	add) operation="+" ;;
  sub) operation="-" ;;
  mul) operation="*" ;;
	div) operation="/" ;;
	addition) operation="+" ;;
	subtraction) operation="-" ;;
	multiply) operation="*" ;;
	multiplication) operation="*" ;;
	division) operation="/" ;;
	divide) operation="/" ;;
	subtract) operation="-" ;;
	linear) linear ;;
	*) echo "[VOS] Invalid argument given. See man(math) in order to see how to use this command."; exit 1 ;;
esac
number_1="$ARG_2"
number_2="$ARG_3"
# calculate result 
result=$(echo "scale=2; $number_1 $operation $number_2" | bc -l)
echo "[VOS] $number_1 $operation $number_2 = $result"
