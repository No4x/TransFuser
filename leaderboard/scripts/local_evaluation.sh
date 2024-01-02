export CARLA_ROOT=${1:-/home/zizhen/work/TransFuser/carla}
export WORK_DIR=${2:-/home/zizhen/work/TransFuser}

export CARLA_SERVER=${CARLA_ROOT}/CarlaUE4.sh
export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI
export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI/carla
export PYTHONPATH=$PYTHONPATH:$CARLA_ROOT/PythonAPI/carla/dist/carla-0.9.10-py3.7-linux-x86_64.egg
export SCENARIO_RUNNER_ROOT=${WORK_DIR}/scenario_runner
export LEADERBOARD_ROOT=${WORK_DIR}/leaderboard
export PYTHONPATH="${CARLA_ROOT}/PythonAPI/carla/":"${SCENARIO_RUNNER_ROOT}":"${LEADERBOARD_ROOT}":${PYTHONPATH}

export SCENARIOS=${WORK_DIR}/leaderboard/data/longest6/eval_scenarios.json
export ROUTES=${WORK_DIR}/leaderboard/data/longest6/longest6.xml
#export ROUTES=/home/zizhen/work/InterFuser/leaderboard/data/training_routes/routes_town05_long.xml
#export SCENARIOS=/home/zizhen/work/InterFuser/leaderboard/data/scenarios/town05_all_scenarios.json
export REPETITIONS=1
export CHALLENGE_TRACK_CODENAME=SENSORS
export CHECKPOINT_ENDPOINT=${WORK_DIR}/results/transfuser_longst6.json
export PORT=2020 # same as the carla server port
export TM_PORT=4020 # port for traffic manager, required when spawning multiple servers/clients
export SAVE_PATH=${WORK_DIR}/data/transfuser
export TEAM_AGENT=${WORK_DIR}/team_code_transfuser/submission_agent.py
export TEAM_CONFIG=${WORK_DIR}/model_ckpt/transfuser
export DEBUG_CHALLENGE=0
export RESUME=1
export DATAGEN=0

python3 ${LEADERBOARD_ROOT}/leaderboard/leaderboard_evaluator_local.py \
--scenarios=${SCENARIOS}  \
--routes=${ROUTES} \
--repetitions=${REPETITIONS} \
--track=${CHALLENGE_TRACK_CODENAME} \
--checkpoint=${CHECKPOINT_ENDPOINT} \
--agent=${TEAM_AGENT} \
--agent-config=${TEAM_CONFIG} \
--debug=${DEBUG_CHALLENGE} \
--port=${PORT} \
--trafficManagerPort=${TM_PORT} \
--resume=${RESUME}
