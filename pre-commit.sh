#!/bin/bash
# Pre commit check references for RTM Document and update Doc
RTMAPIURL="https://script.google.com/macros/s/AKfycbzl0p_ecNw087aLDFnIo7HdpPIUfuw_06t86ClhJ-95Ly4JOYda/exec";
current_branch=$(git symbolic-ref --short HEAD);
REF_EXIST=0

RTM_REF=`cat .git/rtmreferences.config`
IFS=";" read -ra REFERENCES <<< "$RTM_REF"
for i in "${REFERENCES[@]}"
do
	ref_branch=${i%:*}
	if  [ "$ref_branch" = "$current_branch" ]; then 
		REF_EXIST=${i##*:};
	fi
done

if  [ "$REF_EXIST" != "0" ]
then 
	echo "Reference for $current_branch branch is $REF_EXIST, updating RTM at google drive"

	while read st file; do
		if [ "$st" == 'D' ]; then continue; fi
		if [ "$UPDATED_FILES" == "" ]; then 
			UPDATED_FILES=$file
			continue;
		fi	
		UPDATED_FILES="$UPDATED_FILES,$file"
	done <<< "$(git diff --cached --name-status)"
	curl --data "cell_no=$REF_EXIST&files=$UPDATED_FILES" $RTMAPIURL > r.log;
else
	echo "Unable to find reference for $current_branch branch, please run following command to specify"
	echo "cuertm link <branchname> <cellno>"
	exit 1
fi
# Finish pre-commit hook
