# Simple SSH + Push Setup

## What This Does
Lets you:
- SSH into your server easily
- Avoid typing password every time
- Upload files/folders fast

---

## 1. Create SSH Key (Run on Local Machine)

```bash
ssh-keygen -t ed25519

ssh-copy-id eric@31.97.218.42
ssh eric@31.97.218.42
sudo pacman -S keychain
eval "$(keychain --eval --agents ssh id_ed25519)"
source ~/.bashrc

push() {
  rsync -avz --progress "$1" eric@31.97.218.42:~/linux/
}

source ~/.bashrc

push myfolder
push myfile.txt
