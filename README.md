# chrome-extension-trial
Trial of Chrome extensions

## Requirements

- Docker

## Development

1. Build this Chrome extension.

   ```bash
   $ make lint build
   ```

2. Start Chrome and open `chrome://extensions`.

3. Enable Developer mode.

4. Load `dist` directory of this project as an unpacked extension.

(Ref: https://developer.chrome.com/docs/extensions/mv3/getstarted/#manifest)
