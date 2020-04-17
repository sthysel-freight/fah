# Folding@home docker containers

![No Magic](pics/dontbelieveinmagic.jpg)

This repo provides docker containers to run the folding@home client. 

So this is one way of getting Folding@Home done. It has all the usual benefits
of Docker containerization. Assuming you are already a docker user the install
should take a few minutes, most of which is building the containers. Perhaps
I'll push this to dockerhub later, idk.

# Install

## Prepare the docker environment if you have a Nvidia GPU

Be sure `docker` 19.03 or higher as well as the `nvidia-container-toolkit` is
installed. If docker is already installed be sure to restart docker after
installing `nvidia-container-toolkit`

For arch this would be:

```
$ yay -S docker nvidia-container-toolkit
$ sudo systemctl restart docker
```

Ubuntu or whatever will be very similar.

Once this is done run the `test-gpu.sh` script to verify your GPU's are available:

``` zsh
❯ ./test-gpu.sh
Thu Apr 16 11:14:52 2020       
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 440.82       Driver Version: 440.82       CUDA Version: 10.2     |
|-------------------------------|----------------------|----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|===============================+======================+======================|
|   0  GeForce RTX 2080    Off  | 00000000:01:00.0  On |                  N/A |
|  0%   43C    P8     4W / 260W |    952MiB /  7979MiB |      6%      Default |
+-------------------------------|----------------------|----------------------+
                                                                               
+-----------------------------------------------------------------------------+
| Processes:                                                       GPU Memory |
|  GPU       PID   Type   Process name                             Usage      |
|=============================================================================|
+-----------------------------------------------------------------------------+
```
 
# Run

So docker-compose does not support the --gpus flag at this time, so you have to
slum it with the `run-gpu.sh` script.

```zsh
$ ./run-gpu.sh -u sthysel -t 248479
```

If you have FAH passkey make sure its in your environment called `FAH_PASSKEY`

# Resources

- https://github.com/NVIDIA/nvidia-docker
