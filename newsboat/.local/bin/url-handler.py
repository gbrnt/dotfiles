#!/usr/bin/env python3
"""
Take a URL from newsboat and open the relevant thing
"""

import sys
import subprocess

url = sys.argv[1]
protocol, remainder = url.split("://")
domain = remainder.split("/")[0]

match domain:
    # Youtube (could match other ytdl compatible video hosting?)
    case "www.youtube.com" | "youtube.com" | "youtu.be":
        #mpv --ytdl-format="bestvideo[height<=480]+bestaudio" "$1"
        #string = f"mpv --ytdl-format=bestvideo[height<=480]+bestaudio {url}"
        #print(string.split())
        subprocess.call([
            "mpv",
            "--ytdl-format=bestvideo[height<=480]+bestaudio",
            "--fs",
            url
            ])

    # Default - just let xdg-open do it
    case _:
        subprocess.call(["xdg-open", url])
