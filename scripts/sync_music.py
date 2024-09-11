import hashlib
import shutil
from pathlib import Path

music = Path.home() / "Music" / "Music" / "spotdl"
dst = Path("/Volumes/Quasar/music")

try:
    with open(dst / "hashes", "br") as f:
        hashes = eval(f.read().decode())
except FileNotFoundError:
    hashes = {}

new_hashes = {}
for file in music.glob("*.mp3"):
    if (
        file.name in hashes
        and hashes[file.name] == hashlib.md5(file.read_bytes()).hexdigest()
        and (dst / file.name).exists()
    ):
        print(f"Skipping {file.name}")
        new_hashes[file.name] = hashes[file.name]
        continue
    print(f"Copying {file.name}")
    shutil.copy(file, dst)
    new_hashes[file.name] = hashlib.md5(file.read_bytes()).hexdigest()

with open(dst / "hashes", "bw") as f:
    f.write(str(new_hashes).encode())