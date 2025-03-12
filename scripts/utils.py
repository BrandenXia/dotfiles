import json

from pathlib import Path
from typing import Any


class Storage:
    def __init__(self, namespace: str, path: Path) -> None:
        path.mkdir(parents=True, exist_ok=True)
        file = path / "cache_{}.json".format(namespace)
        file.touch(exist_ok=True)

        self.fp = open(file, "r+")
        if self.fp.read() == "":
            self.fp.write("{}")
            self.fp.seek(0)

    def read(self):
        self.fp.seek(0)
        return json.load(self.fp)

    def get(self, key: str) -> Any | None:
        return self.read().get(key, None)

    def set(self, key: str, value):
        cache = self.read()
        cache[key] = value
        self.fp.seek(0)
        json.dump(cache, self.fp)

    def delete(self, key: str):
        cache = self.read()
        del cache[key]
        json.dump(cache, self.fp)


class Cache(Storage):
    def __init__(self, namespace: str) -> None:
        super().__init__(namespace, Path.home() / ".cache" / "scripts")


class Persistent(Storage):
    def __init__(self, namespace: str) -> None:
        super().__init__(namespace, Path.home() / ".config" / "scripts")
