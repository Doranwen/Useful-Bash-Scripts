## Script Descriptions
Below is a description of each script and how to use it.

All scripts below are designed to work with files of the format `<title> by <author>`.

----
**createfolders.sh**

Run this inside of a folder full of files to sort, and it will first prompt you for the fandom (the folder name you are going to sort them to).  It will automatically check each file and report that it is either creating a folder for the author name, or that such a folder already exists.

----

**createfolders-large.sh**

This behaves the same as **createfolders.sh** with one key difference: It will create two layers of folders - the first being the first letter of each author's name, and the second being the author's name, under the correct folder.  For author names which begin with numerals, _, or -, the folders `0-9` and `_-` will be created as necessary.

----

**sortfics.sh**

Run this inside of a folder full of files to sort, and it will first prompt you for the fandom (the folder name you are going to sort them to).  It will then go through every subfolder (created by **createfolders.sh**) in that folder and search your current folder for matches, then move them into that subfolder.

----

**sortficslarge.sh**

This behaves the same as **sortfics.sh** except it works with folders created by **createfolders-large.sh** instead, with the two-level folder sorting.
