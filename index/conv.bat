python conv.py
del OUTPUT.mp4
ffmpeg -i temp.avi -vcodec libx264 -crf 25 out/OUTPUT.mp4
del temp.avi
pause