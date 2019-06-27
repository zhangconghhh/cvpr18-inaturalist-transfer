#!/bin/sh
# CUDA_VISIBLE_DEVICES=1 ./eval.sh

DATASET_NAME=INaturalist
DATASET_DIR=/media/disk/Backup/01drive/01zhangcong/FGVC2019/inature/tfrecords
#MODEL_DIR=./checkpoints/${DATASET_NAME}/V3_ImageNet_299
MODEL_DIR=/home/congzhang/git/inature_cvpr18/checkpoints/INaturalist/V3_ImageNet_299

MODEL_NAME=inception_v3

EVAL_BATCH_SIZE=2
EVAL_IMAGE_SIZE=299

EVAL_INTERVAL_SECS=0

python eval.py \
    --checkpoint_path=${MODEL_DIR} \
    --eval_dir=${MODEL_DIR} \
    --dataset_dir=${DATASET_DIR} \
    --dataset_name=${DATASET_NAME} \
    --model_name=${MODEL_NAME} \
    --batch_size=${EVAL_BATCH_SIZE} \
    --eval_image_size=${EVAL_IMAGE_SIZE} \
    --eval_interval_secs=${EVAL_INTERVAL_SECS}\
    --gpus="2"
