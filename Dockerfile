# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# No registry-verified custom nodes found.
# Could not resolve unknown custom node CheckpointLoaderSimple (no aux_id provided) - skipped

# download models into comfyui
RUN comfy model download --url https://huggingface.co/LyliaEngine/Pony_Diffusion_V6_XL/blob/main/ponyDiffusionV6XL_v6StartWithThisOne.safetensors --relative-path models/checkpoints --filename ponyDiffusionV6XL_v6StartWithThisOne.safetensors
RUN comfy model download --url https://huggingface.co/Kim2091/UltraSharp/resolve/main/4x-UltraSharp.pth --relative-path models/upscale_models --filename 4x-UltraSharp.pth

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
