## Script Descriptions
These scripts allow for comparison between a text file with ordinary text ("passage.txt") and a wordlist ("wordlist.txt").

----
**scriptoutlinephrasematch:**
This script should be run as follows:
```
./scriptoutlinephrasematch <passage.txt> <wordlist.txt>
```
It first asks the user to name a phrase length (how many words long?) and then checks the passage for words that match the wordlist.  When it finds a phrase that is *at least as long* as the desired length, and for which all of the words are found in the wordlist (caps-insensitive), then it adds it to the file "phrasematches.txt".

----
**scriptoutlinewordmatch:**
This script should be run as follows:
This script should be run as follows:
```
./scriptoutlinephrasematch <passage.txt> <wordlist.txt>
```
It checks for any line in the passage.txt file where *all* of the words in the line are found in the wordlist.  Matching lines are added to "linematches.txt".

----
## Important Note
Passage.txt (or whatever equivalent file you are using) *must* be converted to LF line endings only; the scripts will fail if the passage.txt has CR LF line endings.
