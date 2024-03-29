#!/bin/bash

TEST_FILE_CREATE_LOCATION=testFiles

# Remove old test files
rm -rf $TEST_FILE_CREATE_LOCATION
mkdir $TEST_FILE_CREATE_LOCATION
rm $TARGET_DTL_LOCATION



function createFilesOver25MB {
	size=30        

        for i in $(eval echo "{1..10}"); do            
            currentFile="$TEST_FILE_CREATE_LOCATION/over25mb-$i"         

            dd if=/dev/zero of=$currentFile bs=1M count=$size
           
        done    
}

function createAccessedAndModifiedWithin15Days {
	 for i in $(eval echo "{1..5}"); do 
        currentFile="$TEST_FILE_CREATE_LOCATION/15days-$i"         
        touch -d "1 days ago" $currentFile        
    done
    for i in $(eval echo "{6..10}"); do 
        currentFile="$TEST_FILE_CREATE_LOCATION/15days-$i"         
        touch -d "15 days ago" $currentFile        
    done
}

function createAccessedAndModifiedWithin16And30DaysAgo {
	 for i in $(eval echo "{1..10}"); do 
        currentFile="$TEST_FILE_CREATE_LOCATION/16-30days-$i"         
        touch -d "16 days ago" $currentFile        
    done
    for i in $(eval echo "{11..20}"); do 
        currentFile="$TEST_FILE_CREATE_LOCATION/16-30days-$i"         
        touch -d "30 days ago" $currentFile        
    done
}

function createAccessedAndModifiedWithin31And90DaysAgo {
	 for i in $(eval echo "{1..10}"); do 
        currentFile="$TEST_FILE_CREATE_LOCATION/31-90days-$i"         
        touch -d "31 days ago" $currentFile        
    done
    for i in $(eval echo "{11..20}"); do 
        currentFile="$TEST_FILE_CREATE_LOCATION/31-90days-$i"         
        touch -d "90 days ago" $currentFile        
    done
}

function createAccessedAndModifiedWithin3And6MonthsAgo {
	 for i in $(eval echo "{1..10}"); do 
        currentFile="$TEST_FILE_CREATE_LOCATION/3-6months-$i"         
        touch -d "3 months ago" $currentFile        
    done
    for i in $(eval echo "{11..20}"); do 
        currentFile="$TEST_FILE_CREATE_LOCATION/3-6months-$i"         
        touch -d "6 months ago" $currentFile        
    done
}

function createAccessedAndModifiedWithin6And12MonthsAgo {
	 for i in $(eval echo "{1..10}"); do 
        currentFile="$TEST_FILE_CREATE_LOCATION/6-12months-$i"         
        touch -d "7 months ago" $currentFile        
    done
    for i in $(eval echo "{11..20}"); do 
        currentFile="$TEST_FILE_CREATE_LOCATION/6-12months-$i"         
        touch -d "12 months ago" $currentFile        
    done
}

function createAccessedAndModifiedOver12MonthsAgo {
	 for i in $(eval echo "{1..10}"); do 
        currentFile="$TEST_FILE_CREATE_LOCATION/over-12months-$i"         
        touch -d "13 months ago" $currentFile        
    done
    for i in $(eval echo "{11..20}"); do 
        currentFile="$TEST_FILE_CREATE_LOCATION/over-12months-$i"         
        touch -d "36 months ago" $currentFile        
    done
}

createFilesOver25MB
createAccessedAndModifiedWithin15Days
createAccessedAndModifiedWithin16And30DaysAgo
createAccessedAndModifiedWithin31And90DaysAgo
createAccessedAndModifiedWithin3And6MonthsAgo
createAccessedAndModifiedWithin6And12MonthsAgo
createAccessedAndModifiedOver12MonthsAgo
