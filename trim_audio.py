import urllib.request
import ssl
import wave
import struct

ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

# Download a short, soft applause WAV file
url = 'https://raw.githubusercontent.com/y1n0/javascript30-drum-kit/master/sounds/clap.wav'
path = r'c:\Users\Hp\OneDrive\Desktop\flutter\jordan_explorer\assets\audio\clap_full.wav'
req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
try:
    with urllib.request.urlopen(req, context=ctx) as r, open(path, 'wb') as f:
        f.write(r.read())
    print('Downloaded WAV.')
except Exception as e:
    print('WAV download failed:', e)

# Trim to exactly 3 seconds if needed (or just use it as it's already short)
path_final = r'c:\Users\Hp\OneDrive\Desktop\flutter\jordan_explorer\assets\audio\clap.wav'
try:
    with wave.open(path, 'rb') as wdn:
        nchannels = wdn.getnchannels()
        sampwidth = wdn.getsampwidth()
        framerate = wdn.getframerate()
        nframes = wdn.getnframes()
        
        # Max 3 seconds
        frames_to_read = min(nframes, framerate * 3)
        data = wdn.readframes(frames_to_read)
        
        with wave.open(path_final, 'wb') as wout:
            wout.setnchannels(nchannels)
            wout.setsampwidth(sampwidth)
            wout.setframerate(framerate)
            wout.writeframes(data)
    print('Trimmed WAV successfully to clap.wav.')
except Exception as e:
    print('Trimming failed:', e)
