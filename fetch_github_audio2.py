import urllib.request
import json
import ssl

ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

def find_and_download(query, path):
    url = f"https://api.github.com/search/code?q={query}+extension:mp3"
    print(f"Searching: {url}")
    req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
    try:
        with urllib.request.urlopen(req, context=ctx) as response:
            data = json.loads(response.read().decode())
            if data['items']:
                item = data['items'][0]
                raw_url = item['html_url'].replace('github.com', 'raw.githubusercontent.com').replace('/blob/', '/')
                print(f"Found: {raw_url}")
                dl_req = urllib.request.Request(raw_url, headers={'User-Agent': 'Mozilla/5.0'})
                with urllib.request.urlopen(dl_req, context=ctx) as dl_res, open(path, 'wb') as f:
                    f.write(dl_res.read())
                print(f"Saved to {path}")
            else:
                print("No files found.")
    except Exception as e:
        print(f"Error: {e}")

find_and_download("success", r"c:\Users\Hp\OneDrive\Desktop\flutter\jordan_explorer\assets\audio\cheer.mp3")
