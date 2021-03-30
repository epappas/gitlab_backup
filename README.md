# gitlab backup

If you just need to take a copy of your gitlab repos with one command. This code is not actively maintained, use it as you wish.

## What does it do

Lists all of your project that you own, and base on their structure clones the repos in a directory structure as they exist in gitlab.

## How to use

- Depende on the [python-gitlab](https://python-gitlab.readthedocs.io/en/stable/cli-usage.html)
- Install the cli client
- Set your config as [described here](https://python-gitlab.readthedocs.io/en/stable/cli-usage.html#configuration)
- run `./backup.sh`
- done
