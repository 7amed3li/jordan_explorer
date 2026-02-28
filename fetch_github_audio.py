import urllib.request
import ssl

ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

def download_audio(url, path):
    print(f"Downloading {url}")
    req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
    try:
        with urllib.request.urlopen(req, context=ctx) as response, open(path, 'wb') as f:
            f.write(response.read())
        print(f"Saved: {path}")
    except Exception as e:
        print(f"Error {url}: {e}")

download_audio('https://raw.githubusercontent.com/AneeqaKhan/sound-board/master/sounds/applause.mp3', r'c:\Users\Hp\OneDrive\Desktop\flutter\jordan_explorer\assets\audio\clap.mp3')
download_audio('https://raw.githubusercontent.com/AneeqaKhan/sound-board/master/sounds/tada.mp3', r'c:\Users\Hp\OneDrive\Desktop\flutter\jordan_explorer\assets\audio\cheer.mp3')
