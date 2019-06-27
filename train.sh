#!/bin/sh
# CUDA_VISIBLE_DEVICES=0 ./train.sh

DATASET_NAME=INaturalist
DATASET_DIR=/media/disk/Backup/01drive/01zhangcong/FGVC2019/inature/tfrecords
MODEL_DIR=./checkpoints/${DATASET_NAME}/V3SE_ImageNet_299
CHECKPOINT_PATH=./model/inception_v3_ILSVRC_299.ckpt
CHECKPOINT_EXCLUDE_SCOPES=Logits,Mixed_5b/SE_block,Mixed_5c/SE_block,Mixed_5d/SE_block,Mixed_6b/SE_block,\
        Mixed_6c/SE_block,Mixed_6a/SE_block,Mixed_6d/SE_block,Mixed_7b/SE_block,Mixed_7c/SE_block,Mixed_7d/SE_block,Mixed_7a/SE_block

MODEL_NAME=inception_v3_se

OPTIMIZER=momentum

LR=0.01
END_LR=0.0001
LR_DECAY=0.1
EPOCHS_PER_DECAY=10.0

TRAIN_BATCH_SIZE=12
TRAIN_IMAGE_SIZE=229

LOG_STEPS=10
SAVE_SUMMARIES_SECS=10
SAVE_MODEL_SECS=60

# fine-tune last layer for 30 epochs.
# inature has 265213 training images, with 8 train batch size:
# 1 epoch = 33151 steps, 20 epochs = xxxx steps.
MAX_STEPS=136720

python train.py \
    --train_dir=${MODEL_DIR} \
    --dataset_dir=${DATASET_DIR} \
    --dataset_name=${DATASET_NAME} \
    --model_name=${MODEL_NAME} \
    --checkpoint_path=${CHECKPOINT_PATH} \
    --checkpoint_exclude_scopes=${CHECKPOINT_EXCLUDE_SCOPES} \
    --optimizer=${OPTIMIZER} \
    --learning_rate=${LR} \
    --end_learning_rate=${END_LR} \
    --learning_rate_decay_factor=${LR_DECAY} \
    --num_epochs_per_decay=${EPOCHS_PER_DECAY} \
    --batch_size=${TRAIN_BATCH_SIZE} \
    --train_image_size=${TRAIN_IMAGE_SIZE} \
    --max_number_of_steps=${MAX_STEPS} \
    --log_every_n_steps=${LOG_STEPS} \
    --save_summaries_secs=${SAVE_SUMMARIES_SECS} \
    --save_interval_secs=${SAVE_MODEL_SECS} \
    --gpus="1"
