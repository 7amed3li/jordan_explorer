import wave
import struct
import math
import random

def generate_wav(filename, duration, sample_rate, callback):
    with wave.open(filename, 'w') as f:
        f.setnchannels(1)
        f.setsampwidth(2)
        f.setframerate(sample_rate)
        
        for i in range(int(duration * sample_rate)):
            t = float(i) / sample_rate
            val = callback(t)
            # clamp to short
            val = max(-32768, min(32767, int(val * 32767)))
            f.writeframesraw(struct.pack('<h', val))

# 1. Gentle Short Clap (Subtle UI Pop/Click)
def clap_gen(t):
    # burst of noise with very fast exponential decay
    env = math.exp(-t * 40)
    noise = random.uniform(-1, 1)
    return noise * env * 0.3

# 2. Gentle Success Chime (Two soft notes for success: C5 to E5)
def chime_gen(t):
    freq1 = 523.25 # C5
    freq2 = 659.25 # E5
    if t < 0.15:
        env = math.exp(-t * 20)
        return math.sin(2 * math.pi * freq1 * t) * env * 0.4
    else:
        t2 = t - 0.15
        env = math.exp(-t2 * 15)
        return math.sin(2 * math.pi * freq2 * t2) * env * 0.4

generate_wav(r'c:\Users\Hp\OneDrive\Desktop\flutter\jordan_explorer\assets\audio\clap.wav', 0.2, 44100, clap_gen)
generate_wav(r'c:\Users\Hp\OneDrive\Desktop\flutter\jordan_explorer\assets\audio\cheer.wav', 0.8, 44100, chime_gen)
print("Audio generated successfully!")
