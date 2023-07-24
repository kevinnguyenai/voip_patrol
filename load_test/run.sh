#!/bin/bash
SESSION=$USER

SERVER="$1"

ulimit -c unlimited

if [ "$1" == "stop" ]
then
	tmux kill-session -t $SESSION
	exit
fi

if [ "$1" = "" ]
then
	echo "missing server argument."
	exit
fi

# clean result files
rm *.json

tmux kill-session -t $SESSION
tmux -2 new-session -d -s $SESSION

tmux new-window -t $SESSION:1 -n 'Logs'
tmux split-window -h

run_voip_patrol () {
	P=$((${ID}+1))
	DELAY=$(((${ID}-1)*2))
	ENVS="VP_ENV_SERVER=\"${SERVER}\" VP_ENV_CALLEE=\"perf_callee${ID}@${SERVER}\" VP_ENV_U=perf_callee${ID} "
	CMD="sleep ${DELAY} && ../voip_patrol -p ${P}000 -c load.xml -o perf${ID}.json --rtp-port ${ID}0010"
	# echo "$ENVS bash -c \"$CMD\""
	tmux send-keys "${ENVS} bash -c \"${CMD}\"" Enter
}

run_voip_patrol_new () {
	P=$((${ID}+1))
	DELAY=$(((${ID}-1)*2))
	ENVS="VP_ENV_SERVER=\"${SERVER}\" VP_ENV_CALLEE=\"*98@35.179.77.242:5060\" VP_ENV_U=demo_000009 "
	CMD="sleep ${DELAY} && ../voip_patrol -p ${P}000 -c load.xml -o perf${ID}.json --rtp-port ${ID}0010"
	# echo "$ENVS bash -c \"$CMD\""
	tmux send-keys "${ENVS} bash -c \"${CMD}\"" Enter
}

# start a voip_patrol
tmux select-pane -t 0
ID=1
run_voip_patrol_new
tmux split-window -v

# start a voip_patrol
tmux select-pane -t 1
ID=2
run_voip_patrol_new
tmux select-pane -t 2
tmux send-keys "htop" C-m
tmux split-window -v

# start a voip_patrol
tmux select-pane -t 3
ID=3
run_voip_patrol_new
tmux split-window -v

# start a voip_patrol
tmux select-pane -t 4
ID=4
run_voip_patrol_new

# Set default window
tmux select-window -t $SESSION:3

# Attach to session
tmux -2 attach-session -t $SESSION

echo "grep \"action\\\": \\\"call\\\"\" --no-filename  perf[1-4].json | jq . | grep mos_lq | sort | uniq -c"

#example 
#VP_ENV_SERVER="35.179.77.242:5060" VP_ENV_CALLEE="demo_000001@35.179.77.242:5060" VP_ENV_U=demo_000001  bash -c "sleep 0 && ../voip_patrol -p 2000 -c load.xml -o perf1.json --rtp-port 10010" 
#VP_ENV_SERVER="35.179.77.242" VP_ENV_CALLEE="001252424631@35.179.77.242:5060" VP_ENV_U=demo_000009  bash -c "sleep 0 && ../voip_patrol -p 32579 -c load.xml -o perf1.json --rtp-port 10010" 