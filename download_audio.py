import urllib.request

def download_file(url, path):
    print(f"Downloading {url} to {path}...")
    req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
    with urllib.request.urlopen(req) as response, open(path, 'wb') as out_file:
        out_file.write(response.read())
    print("Downloaded successfully.")

try:
    download_file('https://actions.google.com/sounds/v1/crowds/light_applause.ogg', r'c:\Users\Hp\OneDrive\Desktop\flutter\jordan_explorer\assets\audio\clap.ogg')
    download_file('https://actions.google.com/sounds/v1/cartoon/magic_chime_chord.ogg', r'c:\Users\Hp\OneDrive\Desktop\flutter\jordan_explorer\assets\audio\cheer.ogg')
except Exception as e:
    print(f"Error: {e}")
