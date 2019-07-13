mkdir -p logs

export PYTHONUNBUFFERED="True"

LOG="logs/traininginfo.txt.`date +'%Y-%m-%d_%H-%M-%S'`"
exec &> >(tee -a "$LOG")
echo Logging to "$LOG"

starttime=`date +'%Y-%m-%d %H:%M:%S'`

python train.py

echo "------------"
endtime=`date +'%Y-%m-%d %H:%M:%S'`
start_seconds=$(date --date="$starttime" +%s);
end_seconds=$(date --date="$endtime" +%s);
echo "start time： "$((end_seconds-start_seconds))"s"
