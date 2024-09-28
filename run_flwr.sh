#!/bin/bash
#SBATCH --job-name=flwr_job       # 任务名称
#SBATCH --output=flwr_output.log   # 输出日志文件
#SBATCH --error=flwr_error.log     # 错误日志文件
#SBATCH --ntasks=1                 # 任务数
#SBATCH --cpus-per-task=8          # 每个任务的 CPU 核心数
#SBATCH --gres=gpu:1               # 请求的 GPU 数量
#SBATCH --partition=interactive     # 指定分区
#SBATCH --nodelist=mauao            # 指定节点

# 加载 Conda 环境
source /nfs-share/dc912/miniconda3/bin/activate flwr

# 切换到指定目录
cd /nfs-share/dc912/camlsys

# 设置 Hugging Face Token
export HUGGINGFACE_TOKEN="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"

# 使用 Hugging Face CLI 登录
huggingface-cli login --token $HUGGINGFACE_TOKEN

# 运行 flwr 命令
flwr run