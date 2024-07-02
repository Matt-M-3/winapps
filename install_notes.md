# Install Notes
The following are my install notes that would require a good deal of change to the original repo and thus I've forked it out to my own.

## Info File Changes for Icons
For some reason, the installer script will only add "word-o365" for the icon value, as an example. The script </code>update_info_file.sh</code> will instead utilize icon values within the original info files from the repository. 

## Remove Unused
There are issues with <code>inquirer.sh</code> causing it to incorrectly display options for additional found applications. Currently, all of them have to be installed. </code>remove_unused.sh</code> removes applications that I don't care to have included.

## WINAPPS Changes
Changes were made to the original winapps script as the "check" no longer worked correctly. Additionally, the evaluation of whether the RDPWindows VM was running or not was incorrect.

## MS-Teams Changes
The installer script will set the MS-Teams executable to an incorrect directory, especially after Teams updates in Windows. Changing it to something like:
```txt
WIN_EXECUTABLE="C:\Users\mattm\AppData\Local\Microsoft\Teams\current\Teams.exe"
```
will correct it. 