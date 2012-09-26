#! /bin/bash
#Author : noPE
# Take an entry i.e filename
# calculate the required name
# return it
# execute mv filename newname
#

#to execute
#$chmod +x order_rename.sh
#$./order_rename.sh path_to_directory

if [ $# -lt 1 ]; then
	echo 'The correct usage is : '
	echo '$./order_rename path_to_the_directory'
	exit
fi


if [ ! -d $1 ]; then
	echo 'Argument should be a directory'	
	echo 'The correct usage is : '
	echo '$./order_rename path_to_the_directory'
	exit
fi
INDEX=0
function_result='noPE' #initial value
function nextName {
	fileName='file'
	SUFFIX='.dat'
	zero=0
	allowed_length=4
	INDEX=`expr $INDEX + 1`
	init_length=`expr ${#INDEX} + 1`

	while [ $init_length -le $allowed_length ]
	do
		fileName=$fileName$zero

		init_length=`expr $init_length + 1`
	done

	#Now add the global INDEXiable value
	fileName=$fileName$INDEX$SUFFIX
	#echo 'file Name is : '$fileName

	function_result=$fileName

}

#first change into the input directory


cd $1

for i in `ls -1 | sort `;
	do
		nextName
		echo 'result is : '$function_result
		`mv $i $function_result`

	done

cd -
