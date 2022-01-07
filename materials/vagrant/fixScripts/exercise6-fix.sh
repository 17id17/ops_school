#!/bin/bash
#add fix to exercise6-fix here

# Check number of parameters
if [ "$#" -lt 2 ] ; then
   echo "Usage: ./$0 full-path-to-file1 full-path-to-file2 ... full-remote-dest-path"
   exit 1
fi

#echo $#
#echo $@
local_hname=$(hostname)
echo $hname

#hname="server2"

remote_dest=$(echo "${@: -1}")
echo "remote_dest: $remote_dest"

# Determine remote host
if [ $local_hname == "server1" ] ; then
   remote_host="server2"
else
   remote_host="server1"
fi

echo "remote_host: $remote_host"

# Create array of all args w/o the last one
array=( $@ )
len=${#array[@]}

args=${array[@]:0:$len-1}

echo "All args w/o last one: $args"
echo -e "\n\n"


for f in $args; do
   # echo ==== $f ====
   echo "scp $f $remote_host:$remote_dest"
   scp $f $remote_host:$remote_dest
done

# Print bytes count of transfered files
bytes_transfered=0
for f in $args; do
   # echo ==== $f ====

   bcount=$(wc -c $f | awk '{print $1}')
   bytes_transfered=$(( $bytes_transfered + $bcount ))
done
echo $bytes_transfered







