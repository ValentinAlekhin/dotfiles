## Установка
```bash
# Клонировать репозиторий
git clone github.com/ValentinAlekhin/dotfiles ~/.local/share/chezmoi

# Перейти в директорию проекта
cd ~/.local/share/chezmoi


# Установить зависимости
chmod +x setup.sh
./setup.sh
```

## Обновление Homebrew файла зависимотей
```sh
brew bundle dump --describe --force
```
