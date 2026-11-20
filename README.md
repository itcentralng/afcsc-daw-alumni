# Alumni

**SK Aneke Hall of Fame · Department of Air Warfare · Armed Forces Command and Staff College, Nigeria**

A blank, offline kiosk shell for the Alumni section of the Department of Air
Warfare Hall of Fame. The screen currently shows a simple placeholder; alumni
content can be added as it is prepared.

## Running on the kiosk

1. Copy the folder onto the kiosk PC.
2. Run `prepare.bat` once to create a Desktop shortcut (then pin it to the taskbar).
3. Launch with the shortcut or `run.bat`. It opens Microsoft Edge in full-screen kiosk mode.
4. To update later, run `update.bat`. It closes the kiosk, fast-forward updates from the configured GitHub branch, and restarts it. Git and an internet connection are required; local changes that prevent a safe update are left untouched.

For development, open `index.html` in any modern browser.

## Structure

```
index.html       the placeholder alumni screen
styles.css       kiosk layout and appearance
assets/icons/    Nigerian Air Force app icon
run.bat          opens the screen in Edge kiosk mode
prepare.bat      creates a Desktop shortcut
update.bat       fetches and applies updates from GitHub
```
