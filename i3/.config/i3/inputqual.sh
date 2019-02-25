#!/bin/bash

echo `pacmd list-sink-inputs | grep -B 10 "Spotify" | grep "sample spec" | cut -d " " -f 3,4,5`
