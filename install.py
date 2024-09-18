import sys
import os

from pathlib import Path
from collections.abc import Callable

dirname = Path(__file__).parent.absolute()

home_dir = Path.home()
config_dir = home_dir / ".config"


class Helper:
    @staticmethod
    def link_to_config(target_name: str, dotfile_dir: Path):
        os.symlink(dotfile_dir, config_dir / target_name)

    @staticmethod
    def link_file(
        file_name: str,
        dotfile_dir: Path,
        target_dir: Path,
    ):
        os.symlink(dotfile_dir / file_name, target_dir / file_name)

    @staticmethod
    def add_to_file(file_path: Path, content: str | list[str]):
        with open(file_path, "a") as f:
            f.write("\n")
            content = content if isinstance(content, str) else "\n".join(content)
            f.write(content)
            f.write("\n")

    @staticmethod
    def add_to_zshrc(content: str | list[str]):
        Helper.add_to_file(home_dir / ".zshrc", content)


# edit to add more configs
configs: dict[str, Callable[[str, Path], None]] = {
    "wezterm": Helper.link_to_config,
    "yazi": Helper.link_to_config,
    "nvim": Helper.link_to_config,
    "zsh": lambda _, dotfile_dir: Helper.add_to_zshrc(
        [
            "# common config from dotfiles",
            f"source {(dotfile_dir / 'common.zsh').absolute()}",
        ],
    ),
    "scripts": lambda _, dotfile_dir: Helper.add_to_zshrc(
        ["# scripts from dotfiles", f"export PATH=$PATH:{dotfile_dir.absolute()}"]
    ),
}


def main():
    try:
        target = sys.argv[1]
    except IndexError:
        print("Not enough argument provided")
        sys.exit(1)

    try:
        install_func = configs[target]
    except KeyError:
        print("Target not found")
        sys.exit(1)

    install_func(target, dirname / target)


if __name__ == "__main__":
    main()
