MODEL=john6688/DeepSeek-R1-Distill-Qwen-1.5B-GRPO-LIMO-ECS #deepseek-ai/DeepSeek-R1-Distill-Qwen-1.5B
REVISION=5b5c3b586442a66402133c0ad0025ce0b3b4624c
MODEL_ARGS="pretrained=$MODEL,revision=$REVISION,dtype=bfloat16,max_model_length=32768,gpu_memory_utilization=0.8,generation_parameters={max_new_tokens:32768,temperature:0.6,top_p:0.95}"
OUTPUT_DIR=data/evals/$MODEL

# AIME 2024
TASK=aime24
CUDA_VISIBLE_DEVICES=7 lighteval vllm $MODEL_ARGS "custom|$TASK|0|0" \
    --custom-tasks src/open_r1/evaluate.py \
    --use-chat-template \
    --output-dir $OUTPUT_DIR

# MATH-500
TASK=math_500
CUDA_VISIBLE_DEVICES=7 lighteval vllm $MODEL_ARGS "custom|$TASK|0|0" \
    --custom-tasks src/open_r1/evaluate.py \
    --use-chat-template \
    --output-dir $OUTPUT_DIR

# GPQA Diamond
TASK=gpqa:diamond
CUDA_VISIBLE_DEVICES=7 lighteval vllm $MODEL_ARGS "custom|$TASK|0|0" \
    --custom-tasks src/open_r1/evaluate.py \
    --use-chat-template \
    --output-dir $OUTPUT_DIR
