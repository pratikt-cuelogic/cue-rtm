cuertm
========

Quick installer for a git pre-commit hook, which helps you to update RTM spreadsheet automatically on each commit.

Installing cuertm
-------------------
Supported platform: Linux, Mac, Windows ( not tested :D )

    curl -OL https://raw.githubusercontent.com/pratikt-cuelogic/cue-rtm/master/cuertm-installer.sh
    chmod 0777 cuertm-installer.sh
    ./cuertm-installer.sh
    
Usage
-------------------
Steps mentioned above will install cuertm tool globally, however we need to initialize this separately for each repository

### Initialization

To initialize a new repo to use cuertm, use:
  
		cuertm init

This will then interactively prompt you to with some questions such as provide spreadsheet ID (stored @googledrive) where you are mainitaining RTM doco. As we are using google script to update spreadsheet make sure google script ( or account which is hosting that script ) has access to that spreadsheet.
Once initialize, it will not allow user to commit anything unless RTM cell reference is specified.

### Link Branch to particular RTM cell

To link a new/existing branch to RTM cell, use:

		cuertm link <branchname> <cell_number>
		

Please help out
---------------
This project is still under development. Feedback and suggestions are very
welcome and I encourage you to use the [Issues
list](https://github.com/pratikt-cuelogic/cue-rtm/issues) on Github to provide that
feedback.

Feel free to fork this repo and to commit your additions.
