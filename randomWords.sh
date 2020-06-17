#!/usr/bin/env bash

# 根目录
ROOT_PATH=$PWD
# 词库文件
WORDS_NAME="words.txt"
WORDS_PATH="$PWD/$WORDS_NAME"

# 函数：随机词语
randomWord(){
	totalWordsNum=`wc -l $WORDS_PATH | awk '{print $1}'`
	idx=1
	Num=2 # NUM为要生成的随机单词的个数
	declare -i num
	declare -i randNum
	ratio=1
	firstIndex=0
	words=""
	
	while [ "$idx" -le "$Num" ]
	do
		a=$RANDOM
		num=$(( $a*$ratio ))
		randNum=`expr $num%$totalWordsNum+1`
		word=`sed -n "$randNum"p $WORDS_PATH`
		firstWord=${word:0:1}
		if [ $idx != 1 ]; then
		firstWord=`echo $firstWord | tr "[a-z]" "[A-Z]"`
	fi
		otherWord=${word:1}
		newWord=$firstWord$otherWord
		words=$words$newWord

		idx=`expr $idx + 1`
	done
	echo $words
}

# 输出随机词语的结果
echo `randomWord`