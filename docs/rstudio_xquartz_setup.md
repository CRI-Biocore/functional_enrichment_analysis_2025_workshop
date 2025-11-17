# RStudio Access on Randi with XQuartz / Windows

This document provides step-by-step instructions to access RStudio on the CRI HPC system `randi` using XQuartz for X11 forwarding on macOS or an X11 server on Windows.

## Prerequisites

### macOS
1. **Install XQuartz**
   - Download and install XQuartz from [https://www.xquartz.org/](https://www.xquartz.org/).
   - After installation, log out and log back in, or restart your computer.

2. **Enable X11 Forwarding in SSH**
   - Use the `-Y` option when connecting to `randi` to enable trusted X11 forwarding.

### Windows
1. **Install an X11 Server**
   - Recommended: **VcXsrv** (https://sourceforge.net/projects/vcxsrv/) or **Xming** (https://sourceforge.net/projects/xming/).
   - Start the X11 server before opening the SSH session.

2. **Use an SSH client with X11 forwarding support**
   - **Recommended:** [PuTTY](https://www.putty.org/).
   - In PuTTY settings:
     - Go to `Connection > SSH > X11`
     - Check `Enable X11 forwarding`
     - Set `X display location` to `localhost:0` (default for VcXsrv/Xming)

## Steps to Access RStudio on Randi

1. **Log into Randi**
To access randi, use the SSH command below with your assigned BSDID and password:

```
ssh your_username@randi.cri.uchicago.edu
```

After logging in successfully, you should see a screen similar to the following:

![](../images/randi-login-screenshot.png)


2. **Request an interactive job on Randi**

- without node reservation

```bash
srun --mem=4Gb --pty --time=02:00:00 /bin/bash
```

- workshop with node reservation

```bash
srun --pty --reservation=workshop --mem=4GB --pty --time=02:00:00 /bin/bash
```

- Wait for the job to be allocated resources.
- You should see a prompt like:

![](../images/interactive_node_start.png)


3. **Check network interfaces for ip address** 

```bash
ip a
```

- You should see something like:

![](../images/ip_a.png)


4. **Open a new terminal, then connect via SSH with X11 forwarding from your local machine**

Open a **new terminal**, and login to your assigned interactive node with above provided ip address. 

> **Note:** make sure to open a new terminal to ensure your interactive node is still open for connection.
During workshop all registered users will be gaven the reserved nodes, so you do not need to concern this.

```bash
ssh -Y yli22@10.50.46.8
```

- You should see something like:

![](../images/ip_login.png)


5. **Load required modules**

Once logged in to the interactive node, run the following commands to load required modules and confirm loading success:

```bash
module load gcc/12.1.0
module load miniconda3/24.9.2
module list
source activate /gpfs/data/biocore-workshop/functional_enrichment_workshop5/gsor_Nov25_v2
```

- You should see something like:

![](../images/module_load.png)

6. **Activate pre-set computational environment**

```bash
source activate /gpfs/data/biocore-workshop/functional_enrichment_workshop5/gsor_Nov25_v2
```

- You should see something like:

![](../images/conda_env.png)

- Verify paths and versions in this pre-set conda environment:

```bash
which R

which python

python --version

which rstudio
```

- You should see something like:

![](../images/conda_env2.png)

6. **Launch RStudio**

```bash
rstudio
```

> **Note:** This will open RStudio on your local machine via X11 forwarding.

- You should see a pop up window like this, then select 'ignore updates', then this rstudio is ready to use. 

![](../images/rstudio_1.png)


7. **Close computational environment**

```bash
conda deactivate
exit
```
- You should see something like:

![](../images/close_node_conda_env.png)

## Common X11‑related Issues

#### "X11 forwarding request failed"

This error often occurs when trying to run GUI applications on a remote server via SSH with X11 forwarding.

**Possible causes and solutions:**

1. **X server is not running**
   - Make sure XQuartz (macOS) or VcXsrv/Xming (Windows) is launched **before** starting the SSH session.

2. **Access control restrictions**
   - By default, X11 restricts which remote clients can connect. If your remote server cannot connect, you may see this error.

**Quick (less secure) fix (macOS only):**
```bash
xhost +
```
- This disables access control completely, allowing any remote host to connect to your X server.  
- **Security note:** This is convenient for workshops or temporary use, but not secure for untrusted networks.

**Safer alternative (macOS only):**
```bash
xhost +10.50.46.63
```
- Replace `10.50.46.63` with the IP of your remote server.  
- After your session, restore security with `xhost -`

> On Windows, this is typically handled via PuTTY or SSH client X11 forwarding settings, so `xhost` commands are not needed.

## Troubleshooting RStudio Launch

- **RStudio fails to start:**
  - Ensure you have requested enough memory (`--mem=4Gb` or higher) and sufficient time.
  - Use the `module load` commands and activate the workshop conda environment as shown above.

- **SSH connection fails:**
  - Confirm you can ping the node (`ping 10.50.46.63`).
  - Use the `-Y` option on macOS or enable X11 forwarding in your Windows SSH client.

> **Note:** Always start your X server on your machine **before** initiating the SSH connection for GUI applications to display correctly.

