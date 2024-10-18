import json

from pathlib import Path
from typing import Any


class Cache:
    def __init__(self, namespace: str):
        cache_path = Path.home() / ".cache" / "scripts"
        cache_path.mkdir(parents=True, exist_ok=True)
        cache_file = cache_path / "cache_{}.json".format(namespace)
        cache_file.touch(exist_ok=True)

        self.cache_fp = open(cache_file, "r+")
        if self.cache_fp.read() == "":
            self.cache_fp.write("{}")
            self.cache_fp.seek(0)

    def read(self):
        self.cache_fp.seek(0)
        return json.load(self.cache_fp)

    def get(self, key: str) -> Any | None:
        return self.read().get(key, None)

    def set(self, key: str, value):
        cache = self.read()
        cache[key] = value
        self.cache_fp.seek(0)
        json.dump(cache, self.cache_fp)

    def delete(self, key: str):
        cache = self.read()
        del cache[key]
        json.dump(cache, self.cache_fp)
