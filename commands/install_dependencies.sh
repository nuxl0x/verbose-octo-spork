#!/usr/bin/bash

python_installed="false"
install_method=()

function detect_package_manager {
  if command -v apt &>/dev/null; then
      echo "[VOS] Package Manager = apt"
      install_method=(apt install -y)

  elif command -v dnf &>/dev/null; then
      echo "[VOS] Package Manager = dnf"
      install_method=(dnf install -y)

  elif command -v yum &>/dev/null; then
      echo "[VOS] Package Manager = yum"
      install_method=(yum install -y)

  elif command -v pacman &>/dev/null; then
      echo "[VOS] Package Manager = pacman"
      install_method=(pacman -S --noconfirm)

  elif command -v zypper &>/dev/null; then
      echo "[VOS] Package Manager = zypper"
      install_method=(zypper install -y)

  elif command -v apk &>/dev/null; then
      echo "[VOS] Package Manager = apk"
      install_method=(apk add)

  else
      echo "[VOS] No supported package manager found. Please manually install the dependencies."
      exit 1
  fi
}

function check_installation {
  if command -v python3 &>/dev/null; then
    python_installed="true"
    echo "[VOS] Python is already installed."
  fi
  # add additional dependencies
}

function install_dependencies {
  if [[ "$python_installed" == "false" ]]; then
    sudo "${install_method[@]}" python3
  fi
  echo "[VOS] All dependencies installed."
}

echo "[VOS] Installing dependencies..."
detect_package_manager
echo "[VOS] Package manager detected successfully!"
check_installation
echo "[VOS] Checked for dependency installation. Installating dependencies..."
install_dependencies
