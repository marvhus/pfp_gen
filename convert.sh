#!/bin/bash

ammount=$(ls png | grep 'banner*' | wc -l)
ffmpeg -i ppm/banner.ppm png/banner_$ammount.png

ammount=$(ls png | grep 'avatar*' | wc -l)
ffmpeg -i ppm/avatar.ppm  png/avatar_$ammount.png 
