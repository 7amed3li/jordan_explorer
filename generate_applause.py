import wave
import struct
import math
import random

def generate_applause(filename, duration, sample_rate):
    with wave.open(filename, 'w') as f:
        f.setnchannels(1)
        f.setsampwidth(2)
        f.setframerate(sample_rate)
        
        # Generate 3 seconds of a continuous applause-like sound
        # using white noise with low-pass filtering and amplitude modulation
        
        last_val = 0
        for i in range(int(duration * sample_rate)):
            t = float(i) / sample_rate
            
            # White noise
            noise = random.uniform(-1, 1)
            
            # Simple low-pass filter to make it sound like clapping/rain
            filtered = 0.5 * noise + 0.5 * last_val
            last_val = filtered
            
            # Amplitude modulation to simulate varying crowd intensity
            mod = 0.5 + 0.5 * math.sin(2 * math.pi * 5 * t) * math.sin(2 * math.pi * 1.5 * t)
            
            # Fade out at the very end
            env = 1.0
            if t > duration - 0.5:
                env = max(0, (duration - t) / 0.5)
                
            val = filtered * mod * env * 0.4
            
            val_int = max(-32768, min(32767, int(val * 32767)))
            f.writeframesraw(struct.pack('<h', val_int))

print("Generating 3 seconds of applause...")
generate_applause(r'c:\Users\Hp\OneDrive\Desktop\flutter\jordan_explorer\assets\audio\clap.wav', 3.0, 44100)
print("Done!")
