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

1. **Request an interactive job on Randi**

```bash
srun --mem=4Gb --pty --time=2-00:00:00 /bin/bash
```

- Wait for the job to be allocated resources.
- You should see a prompt like:

```bash
[yli22@cri22cn063 lengyel-lab]$
```

2. **Check network interfaces** (optional, for debugging)

```bash
ip a
```

3. **Connect via SSH with X11 forwarding from your local machine**

- **macOS:**
```bash
ssh -Y yli22@10.50.46.63
```
- **Windows (PuTTY):**
  - Open PuTTY, configure X11 forwarding, and connect to `yli22@10.50.46.63`

- The first time, confirm the authenticity of the host by typing `yes`.
- You may see a message about registering the system with Red Hat Insights — this can be ignored for RStudio access.

4. **Load required modules and activate environment**

Once logged in to the interactive node, run the following commands:

```bash
module load gcc/12.1.0
module load mini
module load miniconda3/24.9.2
source activate /gpfs/data/biocore-workshop/functional_enrichment_workshop5/gsor_Nov25_v2
```

- Verify paths and versions:

```bash
which R
# /gpfs/data/biocore-workshop/functional_enrichment_workshop5/gsor_Nov25_v2/bin/R

which python
# /gpfs/data/biocore-workshop/functional_enrichment_workshop5/gsor_Nov25_v2/bin/python

python --version
# Python 3.14.0

which rstudio
# /gpfs/data/biocore-workshop/functional_enrichment_workshop5/gsor_Nov25_v2/bin/rstudio
```

5. **Launch RStudio**

```bash
rstudio
```

> **Note:** This will open RStudio on your local machine via X11 forwarding.

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

