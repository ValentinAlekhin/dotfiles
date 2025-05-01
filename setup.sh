#!/bin/bash
set -e

info() { echo -e "\033[1;34m[INFO]\033[0m $1"; }

# 1. Установка Homebrew
if ! command -v brew &>/dev/null; then
  info "Устанавливаю Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  info "Homebrew уже установлен."
fi

# 2. Установка пакетов из Brewfile
if [ -f ./Brewfile ]; then
  info "Устанавливаю пакеты из Brewfile..."
  brew bundle --file=./Brewfile
else
  info "Файл Brewfile не найден — пропускаю установку пакетов."
fi

# 3. Применение chezmoi
if ! command -v chezmoi &>/dev/null; then
  info "chezmoi ещё не установлен — вероятно, будет установлен через Brewfile. Запусти скрипт позже повторно."
  exit 1
fi

info "Применяю конфигурации через chezmoi..."
chezmoi apply

info "Готово!"
