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


# edit to add more configs
configs: dict[str, Callable[[str, Path], None]] = {
    "wezterm": Helper.link_to_config,
    "yazi": Helper.link_to_config,
    "nvim": Helper.link_to_config,
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
