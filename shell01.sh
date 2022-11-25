#!/bin/sh

#variables
<<var
startPoint=Delhi
#echo We're starting from $startPoint
echo We\'re starting from $startPoint
echo "We're starting from $startPoint"
#startPoint=Delhi Kashmiri gate
echo "We're starting from $startPoint"
#startPoint="${startPoint} kashmiri gate"
startPoint="Delhi Kashmiri gate"
echo "We're starting from $startPoint"
#taking user input
read -p 'Enter starting point : ' startPoint
echo "We're starting from $startPoint"
var

<<simpleArgs
#take Arguments
startPoint=$1
endPoint=$2
echo "We're starting from $startPoint"
echo "The bus will drop us at $endPoint"
#Get all args
echo "All args -- $@"
echo "All args -- $*"
echo "Total args -- $#"
echo " Your script name -- $0"
#shift command
echo $1
shift
echo $1
simpleArgs

#Using getopts and flags
<<getopts
while getopts s:e: flag
do
    case "${flag}" in
        s) startPoint=${OPTARG};;
        e) endPoint=${OPTARG};;
    esac
done
echo "We're starting from $startPoint"
echo "The bus will drop us at $endPoint"
getopts

#Array and for loop 
<<arrNfor
cabStops=('Kasol' 'Manikaran' 'Barshaini')
echo "Next stops are -- $cabStops"
echo "Next stops are -- ${cabStops[@]}"
echo "Next stops are -- ${cabStops[*]}"
echo "Next stop is -- ${cabStops[0]}"
echo " Total stops -- ${#cabStops[@]}"

#using for loop in this array
for nextStop in ${cabStops[@]}
do
    echo "Next stop is $nextStop"
done

#To iterate over a range of indieces of an array
for nextStopIndex in ${!cabStops[@]}
do
    stopNo=$(expr $nextStopIndex + 1)
    echo "Stop No $stopNo is -- ${cabStops[nextStopIndex]}"
done
arrNfor

#More for loop
#working with digit
<<moreFor
for i in {0..4} ; do echo "This is no $i" ; done
lastNo=4
for i in {0..$lastNo} ; do echo "This is no $i" ; done
for i in $(seq 0 $lastNo); do echo $i; done
for i in $(seq 2 $lastNo); do echo $i; done
for f in $(ls) ; do echo File -- $f; done
moreFor

<<ifelse
#if else 
headCount=7
if [ $headCount -le 4 ]
then
    echo "Book a Sedan "
elif [ $headCount -le 6 ]
then 
    echo "Book an SUV"
elif [ $headCount -gt 6 ] && [ $headCount -le 10 ]
then 
    echo "Book 2 Cars"
else
    echo "Book a bus"
fi

cabStops=('Jari' 'Kasol' 'Manikaran' 'Barshaini')
for nextStop in ${cabStops[@]}
do
    echo "Current place is $nextStop"
    if [ "$nextStop" == "Manikaran" ]
    then
        echo "We must visit the Gurdwara"
done
ifelse

<<iftest
#stringtest
driverName=''
if test -z $driverName ; then echo "We don't have any driver's contact yet" ; else echo "$driverName will drive us" ; fi
driverName='Chintan'
if [ -z $driverName ] ; then echo "We don't have any driver's contact yet" ; else echo "$driverName will drive us" ; fi
if test -n $driverName ; then echo "We don't have any driver's contact yet" ; else echo "$driverName will drive us" ; fi
#filetest

#test if any kind of file/dir exists
if test -a file1 ; then echo "We have the file" ; else echo " we don't have the file" ; fi
if test -a file3 ; then echo "We have the file" ; else echo " we don't have the file" ; fi
if test -a dir01 ; then echo "We have the file" ; else echo " we don't have the file" ; fi
if test -f dir01 ; then echo "We have the file" ; else echo " we don't have the file" ; fi
if test -d dir01 ; then echo "We have the folder" ; else echo " we don't have the folder" ; fi
#empty file
if test -s file1 ; then echo "File is NOT empty" ; else echo "File is empty" ; fi
if test -s dir01 ; then echo "File is NOT empty" ; else echo "File is empty" ; fi
#executable
if test -x file1 ; then echo "File is executable" ; else echo "File is NOT executable" ; fi
if test -x dir01 ; then echo "File is executable" ; else echo "File is NOT executable" ; fi
iftest







